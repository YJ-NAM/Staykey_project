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

public class WishDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static WishDAO instance;

    private WishDAO() {}

    public static WishDAO getInstance() {
        if(instance == null) {
            instance = new WishDAO();
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
    // 숙소 찜하기 추가
    // ======================================================
    public String addWish(int stay_no, String member_id) {
        String result = "add_no";

        try {
            openConn();

            int count = 0;

            sql = "select max(wish_no) from staykey_member_wish";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) count = rs.getInt(1) + 1;

            sql = "insert into staykey_member_wish values(?, ?, ?, default)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setInt(2, stay_no);
            pstmt.setString(3, member_id);
            int chk = pstmt.executeUpdate();

            if(chk > 0) result = "add_ok";
            
        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }




    // ======================================================
    // 숙소 찜하기 삭제
    // ======================================================
    public String delWish(int stay_no, String member_id) {
        String result = "del_no";

        try {
            openConn();

            sql = "delete from staykey_member_wish where wish_stayno = ? and wish_memid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stay_no);
            pstmt.setString(2, member_id);
            int chk = pstmt.executeUpdate();

            if(chk > 0) result = "del_ok";
            
        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(pstmt, con);
        }

        return result;
    }





    // ======================================================
    // 해당 숙소 찜하기 정보 확인
    // ======================================================
    public String chkStayWish(int stay_no, String member_id) {
        String result = "N";

        try {
            openConn();

            sql = "select * from staykey_member_wish where wish_stayno = ? and wish_memid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stay_no);
            pstmt.setString(2, member_id);
            rs = pstmt.executeQuery();

            if(rs.next()) result = "Y";

        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }
    
    
    // ======================================================
    // 찜하기 정보 가져오는 메서드
    // ======================================================
    public List<Integer> getWishInfo(String id) {
    	
    	List<Integer> list = new ArrayList<Integer>();

        try {
            openConn();

            sql = "select wish_stayno from staykey_member_wish where wish_memid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	System.out.println("rs"+rs.getInt("wish_stayno"));
                list.add(rs.getInt("wish_stayno"));
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }
    



}
