package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class MemberDAO {
	
	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs = null;
	
	// 쿼리문을 저장할 변수
	String sql = null;

	
	// EmpDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
	//		  기본생성자의 접근제어자를 public이 아닌 private
	//		  으로 바꾸어 주어야 한다.
	//	      즉, 외부에서 직접적으로 기본생성자를 호출하지 못하게 하는 방법이다.

	
	// 2단계 : EmpDAO 객체를 정적(static) 멤버로 선언을 해주어야 한다.
	private static MemberDAO instance;
	
	// 1단계
	private MemberDAO() {	} // 기본생성자
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를 만들어서
	// 		  해당 getInstance() 라는 메서드를 외부에서 접글할 수 있도록 해 주면 됨.
	public static MemberDAO getInstance() {
		
		if(instance == null) {
			instance = new MemberDAO();	// 객체생성하면 주소값이 나온다. 주소값 저장
		}
		return instance;
		
	}
	
	
	// DB를 연동하는 작업을 진행하는 메서드. (커넥션 풀 방법) !!!!!
	public void openConn() {

		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는
			// 		  커넥션을 찾는다.
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}	// openConn() 메서드 end
	
	
	// DB에 연결된 자원 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		
		try {
			if(rs != null) {rs.close();}
			
			if(pstmt != null) {pstmt.close();}
			
			if(con != null) {con.close();}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}	//closeConn 메서드 end

	
	// 회원 목록 불러오는 메서드 (AdminMemberListAction에서 사용) 
	public List<MemberDTO> memberList() {
		
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		
		try {

			sql = "select * from staykey_member order by member_no desc";
			
			openConn();
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_no(rs.getInt("member_no"));
				dto.setMember_type(rs.getString("member_type"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_point(rs.getInt("member_point"));
				dto.setMember_reserv(rs.getInt("member_reserv"));
				dto.setMember_photo(rs.getString("member_photo"));
				dto.setMember_joindate(rs.getString("member_joindate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	}	// 전체 목록 조회 메서드 끝
	
	
	// 회원 검색어에 해당하는 게시물의 수를 조회하는 메서드.
	public int memberSearchListCount(String field, String keyword) {
		
		int count = 0;
		
		openConn();
		
		try {
			
			String searchSql = "";
			
			if(field != null && keyword != null) {
				if(field.equals("type")) {
					searchSql = "where member_type like '%"+keyword+"%'";
				}else if(field.equals("id")) {
					searchSql = "where member_id like '%"+keyword+"%'";
				}else {	// 이름과 일치하는거 찾기
					searchSql = "where member_name like '%"+keyword+"%'";
				}
			}
			
			sql = "select count(*) from staykey_member "+searchSql;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// if문으로 돌려서 여기서 값이 있으면 커서가 한개 씩 내려 가니까 + 1을 해놓으면 rs.next만큼 도니까 계속 더해진다.
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;

	}	// 검색 게시물 수 메서드 end

	
	// 회원 테이블에서 검색한 내용을 가지고 페이징처리를 하는 메서드 
	public List<MemberDTO> memberSearchList(String field, String keyword, int page, int rowsize) {
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize -1);
		
		// 해당 페이지에서 마지막 번호
		int endNo = (page * rowsize);
		
		openConn();
		
		String searchSql = "";
		
		if(field.equals("type")) {	// 유형 찾기
			
			searchSql = "select * from (select row_number() over(order by member_no desc) rnum, b.* from staykey_member b where member_type like '%"+keyword+"%') where rnum >= ? and rnum <= ?";
		
		}else if(field.equals("id")) {	// 아이디 찾기
			
			searchSql = "select * from (select row_number() over(order by member_id desc) rnum, b.* from staykey_member b where member_type like '%"+keyword+"%') where rnum >= ? and rnum <= ?";
		
		}else {		// 이름 찾기
			
			searchSql = "select * from (select row_number() over(order by member_name desc) rnum, b.* from staykey_member b where member_type like '%"+keyword+"%') where rnum >= ? and rnum <= ?";
		}
		
		try {
			
			sql = searchSql;
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_no(rs.getInt("member_no"));
				dto.setMember_type(rs.getString("member_type"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_point(rs.getInt("member_point"));
				dto.setMember_reserv(rs.getInt("member_reserv"));
				dto.setMember_photo(rs.getString("member_photo"));
				dto.setMember_joindate(rs.getString("member_joindate"));
				
				list.add(dto);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}		
		return list;
	}	// 회원 검색 페이징 메서드 end


	public int registerMember(MemberDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			
			openConn();
			
			sql = "select max(member_no) from staykey_member";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into staykey_member values(?, ?, ?, ?, ?, ?, ?, '', '', ?, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMember_type());
			pstmt.setString(3, dto.getMember_id());
			pstmt.setString(4, dto.getMember_pw());
			pstmt.setString(5, dto.getMember_name());
			pstmt.setString(6, dto.getMember_email());
			pstmt.setString(7, dto.getMember_phone());
			pstmt.setString(8, dto.getMember_photo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
	
	
	
	
}
