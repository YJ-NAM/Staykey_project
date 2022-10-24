package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static ReservDAO instance;

    private ReservDAO() {}

    public static ReservDAO getInstance() {
        if(instance == null) {
            instance = new ReservDAO();
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
        String search_sql = " where reserv_no > 0";
        if(map.get("ps_stayname") != null){
            search_sql += " and reserv_stayname like '%"+map.get("ps_stayname")+"%'";
        }


        try {
            openConn();

            sql = "select count(*) from staykey_reserv" + search_sql;
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
    // 예약목록 메서드
    // ======================================================
    public List<ReservDTO> getReservList() {
        List<ReservDTO> list = new ArrayList<ReservDTO>();

        try {
            openConn();

            sql = "select * from staykey_reserv";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                ReservDTO dto = new ReservDTO();

                dto.setReserv_no(rs.getInt("reserv_no"));
                dto.setReserv_status(rs.getString("reserv_status"));
                dto.setReserv_sess(rs.getString("reserv_sess"));
                dto.setReserv_stayno(rs.getInt("reserv_stayno"));
                dto.setReserv_stayname(rs.getString("reserv_stayname"));
                dto.setReserv_roomno(rs.getInt("reserv_roomno"));
                dto.setReserv_roomname(rs.getString("reserv_roomname"));
                dto.setReserv_memid(rs.getString("reserv_memid"));
                dto.setReserv_memname(rs.getString("reserv_memname"));
                dto.setReserv_memphone(rs.getString("reserv_memphone"));
                dto.setReserv_mememail(rs.getString("reserv_mememail"));
                dto.setReserv_start(rs.getString("reserv_start"));
                dto.setReserv_end(rs.getString("reserv_end"));
                dto.setReserv_daycount(rs.getInt("reserv_daycount"));
                dto.setReserv_basic_price(rs.getInt("reserv_basic_price"));
                dto.setReserv_option_name(rs.getString("reserv_option_name"));
                dto.setReserv_option_price(rs.getInt("reserv_option_price"));
                dto.setReserv_use_point(rs.getInt("reserv_use_point"));
                dto.setReserv_total_price(rs.getInt("reserv_total_price"));
                dto.setReserv_people_adult(rs.getInt("reserv_people_adult"));
                dto.setReserv_people_kid(rs.getInt("reserv_people_kid"));
                dto.setReserv_people_baby(rs.getInt("reserv_people_baby"));
                dto.setReserv_pickup(rs.getString("reserv_pickup"));
                dto.setReserv_request(rs.getString("reserv_request"));
                dto.setReserv_date(rs.getString("reserv_date"));

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
