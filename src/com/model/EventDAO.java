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




public class EventDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static EventDAO instance;

    private EventDAO() {}

    public static EventDAO getInstance() {
        if(instance == null) {
            instance = new EventDAO();
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
        String search_sql = " where bbs_no > 0";
        if(map.get("ps_title") != null){
            search_sql += " and bbs_title like '%"+map.get("ps_title")+"%'";
        }


        try {
            openConn();

            sql = "select count(*) from staykey_event" + search_sql;
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
    // 이벤트 목록 메서드
    // ======================================================

    public List<EventDTO> eventList(int page, int rowsize, Map<String, Object> map) {
        List<EventDTO> list = new ArrayList<EventDTO>();

        int startNo = (page * rowsize) - (rowsize - 1);
        int endNo = (page * rowsize);

        // 검색용 설정
        String search_sql1 = " where bbs_no > 0";
        String search_sql2 = "";

        if (map.get("ps_type") != "" && map.get("ps_type").equals("user")) {
            search_sql2 += " and member_type = 'user'";
        } else if (map.get("ps_type") != "" && map.get("ps_type").equals("admin")) {
            search_sql2 += " and member_type = 'admin'";
        }
        if (map.get("ps_name") != "" && map.get("ps_name") != null) {
            search_sql2 += " and member_name like '%" + map.get("ps_name") + "%'";
        }
        if (map.get("ps_id") != "" && map.get("ps_id") != null) {
            search_sql2 += " and member_id like '%" + map.get("ps_id") + "%'";
        }
        if (map.get("ps_email") != "" && map.get("ps_email") != null) {
            search_sql2 += " and member_email like '%" + map.get("ps_email") + "%'";
        }

        search_sql1 += search_sql2;

        // 정렬용 설정
        String order_sql = "bbs_date";
        if (map.get("ps_order").equals("register_desc")) {
            order_sql = "member_joindate desc";
        } else if (map.get("ps_order").equals("register_asc")) {
            order_sql = "member_joindate asc";
        } else if (map.get("ps_order").equals("id_desc")) {
            order_sql = "member_id desc";
        } else if (map.get("ps_order").equals("id_asc")) {
            order_sql = "member_id asc";
        } else if (map.get("ps_order").equals("name_desc")) {
            order_sql = "member_name desc";
        } else if (map.get("ps_order").equals("name_asc")) {
            order_sql = "member_name asc";
        } else if (map.get("ps_order").equals("point_desc")) {
            order_sql = "member_point desc";
        } else if (map.get("ps_order").equals("point_asc")) {
            order_sql = "member_point asc";
        } else if (map.get("ps_order").equals("count_desc")) {
            order_sql = "member_reserv desc";
        } else if (map.get("ps_order").equals("count_asc")) {
            order_sql = "member_reserv asc";
        }

        try {
            openConn();

            sql = "select * from " + "(select row_number() over(order by " + order_sql
                    + ") rnum, b.* from staykey_event b " + search_sql1 + ") " + "where rnum >= ? and rnum <= ?"
                    + search_sql2;
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startNo);
            pstmt.setInt(2, endNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                EventDTO dto = new EventDTO();

                dto.setBbs_no(rs.getInt("bbs_no"));
                dto.setBbs_title(rs.getString("bbs_title"));
                dto.setBbs_content(rs.getString("bbs_content"));
                dto.setBbs_file1(rs.getString("bbs_file1"));
                dto.setBbs_file2(rs.getString("bbs_file2"));
                dto.setBbs_file3(rs.getString("bbs_file3"));
                dto.setBbs_file4(rs.getString("bbs_file4"));
                dto.setBbs_file5(rs.getString("bbs_file5"));
                dto.setBbs_stayno(rs.getString("bbs_stayno"));
                dto.setBbs_showstart(rs.getString("bbs_showstart"));
                dto.setBbs_showend(rs.getString("bbs_showend"));
                dto.setBbs_hit(rs.getInt("bbs_hit"));
                dto.setBbs_writer_name(rs.getString("bbs_writer_name"));
                dto.setBbs_writer_id(rs.getString("bbs_writer_id"));
                dto.setBbs_writer_pw(rs.getString("bbs_writer_pw"));
                dto.setBbs_date(rs.getString("bbs_date"));
                
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }







}
