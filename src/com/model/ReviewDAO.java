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
        if(map.get("ps_content") != null){
            search_sql += " and review_content like '%"+map.get("ps_content")+"%'";
        }


        try {
            openConn();

            sql = "select count(*) from staykey_review" + search_sql;
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) result = rs.getInt(1);

        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }






    // ======================================================
    // 	후기 전체 리스트 메서드
    // ======================================================
    public List<ReviewDTO> reviewList() {
    	List<ReviewDTO> list = new ArrayList<ReviewDTO>();
    	
		try {
			openConn();
			
			sql = "select * from staykey_review order by review_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_stayno(rs.getInt("review_stayno"));
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





}
