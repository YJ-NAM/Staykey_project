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





public class ReviewDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static ReviewDAO instance;

    private ReviewDAO() {}

    public static ReviewDAO getInstance() {
        if(instance == null) {
            instance = new ReviewDAO();
        }

        return instance;
    }


    // ======================================================
    // DB 연동하는 작업을 진행하는 메서드
    // ======================================================
    public void openConn() {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
            con = ds.getConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }


    // ======================================================
    // DB에 연결된 자원 종료하는 메서드
    // ======================================================
    public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    public void closeConn(PreparedStatement pstmt, Connection con) {
        try {
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }





    // ======================================================
    // DB 전체 데이터 갯수 메서드
    // ======================================================
    public int getTotalCount(Map<String, Object> map) {
        int result = 0;

        // 검색용 설정
        String search_sql = " where review_no > 0";
        if (map.get("ps_name") != null) {
            search_sql += " and review_name like '%" + map.get("ps_name") + "%'";
        }
        if (map.get("ps_id") != null) {
            search_sql += " and review_id like '%" + map.get("ps_id") + "%'";
        }
        if (map.get("ps_stayname") != null) {
            search_sql += " and review_stayname like '%" + map.get("ps_stayname") + "%'";
        }

        try {
            openConn();
            
            System.out.println(map.get("ps_name"));
            sql = "select count(*) from staykey_review" + search_sql;
            System.out.println(sql);
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next())
                result = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }





    // ======================================================
    // 	후기 전체 리스트 메서드
    // ======================================================
    public List<ReviewDTO> reviewList(int page, int rowsize, Map<String, Object> map) {
    	List<ReviewDTO> list = new ArrayList<ReviewDTO>();
    	
        int startNo = (page * rowsize) - (rowsize - 1);
        int endNo = (page * rowsize);

        // 검색용 설정
        String search_sql1 = " where review_no > 0";
        String search_sql2 = "";

        if (map.get("ps_name") != "" && map.get("ps_name") != null) {
            search_sql2 += " and review_name like '%" + map.get("ps_name") + "%'";
        }
        if (map.get("ps_id") != "" && map.get("ps_id") != null) {
            search_sql2 += " and review_id like '%" + map.get("ps_id") + "%'";
        }
        if (map.get("ps_stayname") != "" && map.get("ps_stayname") != null) {
            search_sql2 += " and review_stayname like '%" + map.get("ps_stayname") + "%'";
        }
        search_sql1 += search_sql2;

        // 정렬용 설정
        String order_sql = "review_date";
        if (map.get("ps_order").equals("register_desc")) {
            order_sql = "review_date desc";
        } else if (map.get("ps_order").equals("register_asc")) {
            order_sql = "review_date asc";
        } else if (map.get("ps_order").equals("id_desc")) {
            order_sql = "review_id desc";
        } else if (map.get("ps_order").equals("id_asc")) {
            order_sql = "member_id asc";
        } else if (map.get("ps_order").equals("name_desc")) {
            order_sql = "review_name desc";
        } else if (map.get("ps_order").equals("name_asc")) {
            order_sql = "review_name asc";
        } else if (map.get("ps_order").equals("point_desc")) {
            order_sql = "review_point_total desc";
        } else if (map.get("ps_order").equals("point_asc")) {
            order_sql = "review_point_total asc";
        }

		try {
			openConn();
			
	           sql = "select * from " + "(select row_number() over(order by " + order_sql
	                    + ") rnum, b.* from staykey_review b " + search_sql1 + ") " + "where rnum >= ? and rnum <= ?"
	                    + search_sql2;
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startNo);
            pstmt.setInt(2, endNo);
            rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_stayno(rs.getInt("review_stayno"));
				dto.setReview_stayname(rs.getString("review_stayname"));
				dto.setReview_roomno(rs.getInt("review_roomno"));
				dto.setReview_roomname(rs.getString("review_roomname"));
				dto.setReview_point_total(rs.getDouble("review_point_total"));
				dto.setReview_point1(rs.getInt("review_point1"));
				dto.setReview_point2(rs.getInt("review_point2"));
				dto.setReview_point3(rs.getInt("review_point3"));
				dto.setReview_point4(rs.getInt("review_point4"));
				dto.setReview_point5(rs.getInt("review_point5"));
				dto.setReview_point6(rs.getInt("review_point6"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_file(rs.getString("review_file"));
				dto.setReview_id(rs.getString("review_id"));
				dto.setReview_pw(rs.getString("review_pw"));
				dto.setReview_name(rs.getString("review_name"));
				dto.setReview_date(rs.getString("review_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
    }

    
    // ======================================================
    // 리뷰 정보 가져오는 메서드
    // ======================================================
    public ReviewDTO getReviewInfo(int no) {
    	ReviewDTO dto = null;
    	
    	try {
    		openConn();
    		
            sql = "select * from staykey_review where review_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	        	dto = new ReviewDTO();
	        	
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_stayno(rs.getInt("review_stayno"));
				dto.setReview_stayname(rs.getString("review_stayname"));
				dto.setReview_roomno(rs.getInt("review_roomno"));
				dto.setReview_roomname(rs.getString("review_roomname"));
				dto.setReview_point_total(rs.getDouble("review_point_total"));
				dto.setReview_point1(rs.getInt("review_point1"));
				dto.setReview_point2(rs.getInt("review_point2"));
				dto.setReview_point3(rs.getInt("review_point3"));
				dto.setReview_point4(rs.getInt("review_point4"));
				dto.setReview_point5(rs.getInt("review_point5"));
				dto.setReview_point6(rs.getInt("review_point6"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_file(rs.getString("review_file"));
				dto.setReview_id(rs.getString("review_id"));
				dto.setReview_pw(rs.getString("review_pw"));
				dto.setReview_name(rs.getString("review_name"));
				dto.setReview_date(rs.getString("review_date"));
	        }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
    	return dto;
    }
    
    
    

    
    // ======================================================
    // 리뷰 정보 가져오는 메서드
    // ======================================================
    public int deleteReview(int no) {
        int result = 0;

        try {
            openConn();

            sql = "delete from staykey_review where review_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    }
    
    
    
    
    
    
    // ======================================================
    // 리뷰번호 재작업하는 메서드
    // ======================================================
    public void updateNo(int no) {
        try {
            openConn();

            sql = "update staykey_review set review_no = review_no - 1 where review_no > ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    } // updateSequence() 메서드 end





}
