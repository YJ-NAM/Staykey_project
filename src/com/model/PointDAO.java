package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PointDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static PointDAO instance;

    private PointDAO() {}

    public static PointDAO getInstance() {
        if(instance == null) {
            instance = new PointDAO();
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
    // 회원의 적립금 내역 목록 메서드
    // ======================================================
    public List<PointDTO> getPointList(String member_id) {
        List<PointDTO> list = new ArrayList<PointDTO>();

        try {
            openConn();

            sql = "select * from staykey_member_point where point_id = ? order by point_date asc";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();

            while(rs.next()){
                PointDTO dto = new PointDTO();
                dto.setPoint_no(rs.getInt("point_no"));
                dto.setPoint_id(rs.getString("point_id"));
                dto.setPoint_type(rs.getString("point_type"));
                dto.setPoint_value(rs.getInt("point_value"));
                dto.setPoint_content(rs.getString("point_content"));
                dto.setPoint_date(rs.getString("point_date"));

                list.add(dto);
            }

        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }

}
