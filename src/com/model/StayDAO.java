package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StayDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static StayDAO instance;

	private StayDAO() {
	} // 기본 생성자

	public static StayDAO getInstance() {

		if (instance == null) {
			instance = new StayDAO();
		}

		return instance;
	}

	/////////////////////////////////////////////////////////////
	// DB 연동
	/////////////////////////////////////////////////////////////
	public void openConn() {

		try {

			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle"); // 동일
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // openConn() 메서드 end

	/////////////////////////////////////////////////////////////
	// DB 자원 종료
	/////////////////////////////////////////////////////////////
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // closeConn() 메서드 end

	/////////////////////////////////////////////////////////////
	// 숙소 전체 목록 조회(날짜 역순)
	/////////////////////////////////////////////////////////////
	public List<StayDTO> getStayList(int page, int rowsize, Map<String, Object> map) {

		List<StayDTO> list = new ArrayList<StayDTO>();

		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		
		// 검색용 설정
		String search_sql1 = " where stay_no > 0";
		String search_sql2 = "";
		
		if (map.get("ps_type") != "" || map.get("ps_type") != null) {
			search_sql2 += " and stay_type like '%" + map.get("ps_type") + "%'";
		}
		if (map.get("ps_name") != "" || map.get("ps_name") != null) {
			search_sql2 += " and stay_name like '%" + map.get("ps_name") + "%'";
		}
		if (map.get("ps_location") != "" || map.get("ps_location") != null) {
			search_sql2 += " and stay_location like '%" + map.get("ps_location") + "%'";
		}
		if (map.get("ps_phone") != "" || map.get("ps_phone") != null) {
			search_sql2 += " and stay_phone like '%" + map.get("ps_phone") + "%'";
		}

		search_sql1 += search_sql2;

		// 정렬용 설정
		String order_sql = "stay_no desc";
		if (map.get("ps_order").equals("no_desc")) {
			order_sql = "stay_no desc";
		} else if (map.get("ps_order").equals("no_asc")) {
			order_sql = "stay_no asc";
		} else if (map.get("ps_order").equals("hit_desc")) {
			order_sql = "stay_hit desc";
		} else if (map.get("ps_order").equals("hit_asc")) {
			order_sql = "stay_hit asc";
		} else if (map.get("ps_order").equals("name_desc")) {
			order_sql = "stay_name desc";
		} else if (map.get("ps_order").equals("name_asc")) {
			order_sql = "stay_name asc";
		} else if (map.get("ps_order").equals("date_desc")) {
			order_sql = "stay_date desc";
		} else if (map.get("ps_order").equals("date_asc")) {
			order_sql = "stay_date asc";
		} else if (map.get("ps_order").equals("reserv_desc")) {
			order_sql = "stay_reserv desc";
		} else if (map.get("ps_order").equals("reserv_asc")) {
			order_sql = "stay_reserv asc";
		} 
		
		openConn();

		try {
			
			 sql = "select * from (select row_number() over(order by "+order_sql+") rnum, " +
			 "s.* from staykey_stay s "+search_sql1+") where rnum >= ? and rnum <= ? "+search_sql2;
			 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				StayDTO dto = new StayDTO();
				dto.setStay_no(rs.getInt("stay_no"));
				dto.setStay_type(rs.getString("stay_type"));
				dto.setStay_name(rs.getString("stay_name"));
				dto.setStay_desc(rs.getString("stay_desc"));
				dto.setStay_location(rs.getString("stay_location"));
				dto.setStay_addr(rs.getString("stay_addr"));
				dto.setStay_phone(rs.getString("stay_phone"));
				dto.setStay_email(rs.getString("stay_email"));
				dto.setStay_content1(rs.getString("stay_content1"));
				dto.setStay_content2(rs.getString("stay_content2"));
				dto.setStay_content3(rs.getString("stay_content3"));
				dto.setStay_info1(rs.getString("stay_info1"));
				dto.setStay_info2(rs.getString("stay_info2"));
				dto.setStay_info3(rs.getString("stay_info3"));
				dto.setStay_file1(rs.getString("stay_file1"));
				dto.setStay_file2(rs.getString("stay_file2"));
				dto.setStay_file3(rs.getString("stay_file3"));
				dto.setStay_file4(rs.getString("stay_file4"));
				dto.setStay_file5(rs.getString("stay_file5"));
				dto.setStay_option1_name(rs.getString("stay_option1_name"));
				dto.setStay_option1_price(rs.getInt("stay_option1_price"));
				dto.setStay_option1_desc(rs.getString("stay_option1_desc"));
				dto.setStay_option1_photo(rs.getString("stay_option1_photo"));
				dto.setStay_option2_name(rs.getString("stay_option2_name"));
				dto.setStay_option2_price(rs.getInt("stay_option2_price"));
				dto.setStay_option2_desc(rs.getString("stay_option2_desc"));
				dto.setStay_option2_photo(rs.getString("stay_option2_photo"));
				dto.setStay_option3_name(rs.getString("stay_option3_name"));
				dto.setStay_option3_price(rs.getInt("stay_option3_price"));
				dto.setStay_option3_desc(rs.getString("stay_option3_desc"));
				dto.setStay_option3_photo(rs.getString("stay_option3_photo"));
				dto.setStay_hit(rs.getInt("stay_hit"));
				dto.setStay_reserv(rs.getInt("stay_reserv"));
				dto.setStay_date(rs.getString("stay_date"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getStayList() 종료

	/////////////////////////////////////////////////////////////
	// 숙소 전체 data 개수 조회
	/////////////////////////////////////////////////////////////
	public int getStayTotalCount(Map<String, Object> map) {
		// Map<String, Object> map : 검색용 설정 변수

		int result = 0;

		// 검색용 설정 : 조건에 추가됨
		String search_sql = " where stay_no > 0";

		if (map.get("ps_type") != "" && map.get("ps_type") != null) {
			search_sql += " and (";
			String get_type = ((String) map.get("ps_type")).substring(1);
			String[] epd_type = get_type.split("/");
			for(int i=0; i<epd_type.length; i++) {
				if(i > 0) {
					search_sql += " or ";
				}
				search_sql += "stay_type = '"+epd_type[i]+"'";
			}
			search_sql += ") ";
		}

		if (map.get("ps_name") != "" && map.get("ps_name") != null) {
			search_sql += " and stay_name like '%" + map.get("ps_name") + "%'";
		}
		if (map.get("ps_location") != "" && map.get("ps_location") != null) {
			search_sql += " and stay_location like '%" + map.get("ps_location") + "%'";
		}
		if (map.get("ps_phone") != "" && map.get("ps_phone") != null) {
			search_sql += " and stay_phone like '%" + map.get("ps_phone") + "%'";
		}
		
		try {
			openConn();
			sql = "select count(*) from staykey_stay" + search_sql;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	} // getStayTotalCount() 종료

	/////////////////////////////////////////////////////////////
	// 상세 목록 조회
	/////////////////////////////////////////////////////////////
	public StayDTO getStayView(int no) {

		StayDTO dto = null;
		openConn();

		try {
			sql = "select * from staykey_stay where stay_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new StayDTO();
				dto.setStay_no(rs.getInt("stay_no"));
				dto.setStay_type(rs.getString("stay_type"));
				dto.setStay_name(rs.getString("stay_name"));
				dto.setStay_desc(rs.getString("stay_desc"));
				dto.setStay_location(rs.getString("stay_location"));
				dto.setStay_addr(rs.getString("stay_addr"));
				dto.setStay_phone(rs.getString("stay_phone"));
				dto.setStay_email(rs.getString("stay_email"));
				dto.setStay_content1(rs.getString("stay_content1"));
				dto.setStay_content2(rs.getString("stay_content2"));
				dto.setStay_content3(rs.getString("stay_content3"));
				dto.setStay_info1(rs.getString("stay_info1"));
				dto.setStay_info2(rs.getString("stay_info2"));
				dto.setStay_info3(rs.getString("stay_info3"));
				dto.setStay_file1(rs.getString("stay_file1"));
				dto.setStay_file2(rs.getString("stay_file2"));
				dto.setStay_file3(rs.getString("stay_file3"));
				dto.setStay_file4(rs.getString("stay_file4"));
				dto.setStay_file5(rs.getString("stay_file5"));
				dto.setStay_option1_name(rs.getString("stay_option1_name"));
				dto.setStay_option1_price(rs.getInt("stay_option1_price"));
				dto.setStay_option1_desc(rs.getString("stay_option1_desc"));
				dto.setStay_option1_photo(rs.getString("stay_option1_photo"));
				dto.setStay_option1_photo(rs.getString("stay_option2_name"));
				dto.setStay_option2_price(rs.getInt("stay_option2_price"));
				dto.setStay_option2_desc(rs.getString("stay_option2_desc"));
				dto.setStay_option2_photo(rs.getString("stay_option2_photo"));
				dto.setStay_option2_name(rs.getString("stay_option3_name"));
				dto.setStay_option2_price(rs.getInt("stay_option3_price"));
				dto.setStay_option2_desc(rs.getString("stay_option3_desc"));
				dto.setStay_option2_photo(rs.getString("stay_option3_photo"));
				dto.setStay_hit(rs.getInt("stay_hit"));
				dto.setStay_reserv(rs.getInt("stay_reserv"));
				dto.setStay_date(rs.getString("stay_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // getStayView() 종료

	/////////////////////////////////////////////////////////////
	// 각 숙소당 방 전체 목록 조회
	/////////////////////////////////////////////////////////////
	public List<StayRoomDTO> getStayRoomList(int no) {

		List<StayRoomDTO> list = new ArrayList<StayRoomDTO>();
		openConn();

		try {
			sql = "select * from staykey_stay_room where room_stayno = ? order by room_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				StayRoomDTO dto = new StayRoomDTO();
				dto.setRoom_no(rs.getInt("room_no"));
				dto.setRoom_stayno(rs.getInt("room_stayno"));
				dto.setRoom_name(rs.getString("room_name"));
				dto.setRoom_desc(rs.getString("room_desc"));
				dto.setRoom_checkin(rs.getString("room_checkin"));
				dto.setRoom_checkout(rs.getString("room_checkout"));
				dto.setRoom_people_min(rs.getInt("room_people_min"));
				dto.setRoom_people_max(rs.getInt("room_people_max"));
				dto.setRoom_size(rs.getInt("room_size"));
				dto.setRoom_features(rs.getString("room_features"));
				dto.setRoom_amenities(rs.getString("room_amenities"));
				dto.setRoom_service(rs.getString("room_service"));
				dto.setRoom_photo1(rs.getString("room_photo1"));
				dto.setRoom_photo2(rs.getString("room_photo2"));
				dto.setRoom_photo3(rs.getString("room_photo3"));
				dto.setRoom_photo4(rs.getString("room_photo4"));
				dto.setRoom_photo5(rs.getString("room_photo5"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getStayLoomList() 종료

	/////////////////////////////////////////////////////////////
	// 방 등록 메서드 + 방 번호 지정
	/////////////////////////////////////////////////////////////
	public int registerStayRoom(StayRoomDTO dto) {

		int result = 0, count = 0;
		openConn();

		try {
			sql = "select max(room_no) from staykey_stay_room where room_stayno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRoom_stayno());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into staykey_stay_room values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getRoom_stayno());
			pstmt.setString(3, dto.getRoom_name());
			pstmt.setString(4, dto.getRoom_desc());
			pstmt.setString(5, dto.getRoom_checkin());
			pstmt.setString(6, dto.getRoom_checkout());
			pstmt.setInt(7, dto.getRoom_people_min());
			pstmt.setInt(8, dto.getRoom_people_max());
			pstmt.setInt(9, dto.getRoom_size());
			pstmt.setString(10, dto.getRoom_features());
			pstmt.setString(11, dto.getRoom_amenities());
			pstmt.setString(12, dto.getRoom_service());
			pstmt.setString(13, dto.getRoom_photo1());
			pstmt.setString(14, dto.getRoom_photo2());
			pstmt.setString(15, dto.getRoom_photo3());
			pstmt.setString(16, dto.getRoom_photo4());
			pstmt.setString(17, dto.getRoom_photo5());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // registerStayRoom() 종료

}
