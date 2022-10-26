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

public class MagazineDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static MagazineDAO instance;

    private MagazineDAO() {
    }

    public static MagazineDAO getInstance() {
        if (instance == null) {
            instance = new MagazineDAO();
        }

        return instance;
    }



    // ======================================================
    // DB 연동하는 작업을 진행하는 메서드
    // ======================================================
    public void openConn() {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
            con = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ======================================================
    // DB에 연결된 자원 종료하는 메서드
    // ======================================================
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
    }

    public void closeConn(PreparedStatement pstmt, Connection con) {
        try {
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (Exception e) {
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
        if (map.get("ps_title") != null) {
            search_sql += " and bbs_title like '%" + map.get("ps_title") + "%'";
        }

        try {
            openConn();

            sql = "select count(*) from staykey_magazine" + search_sql;
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next())
                result = rs.getInt(1);

        } catch(Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }




    // ======================================================
    // 매거진 목록 메서드
    // ======================================================
    public List<MagazineDTO> magazineList(int page, int rowsize, Map<String, Object> map) {
        List<MagazineDTO> list = new ArrayList<MagazineDTO>();

        int startNo = (page * rowsize) - (rowsize - 1);
        int endNo = (page * rowsize);

        // 검색용 설정
        String search_sql1 = " where bbs_no > 0";
        String search_sql2 = "";

        if (map.get("mg_stayno") != "" && map.get("mg_stayno") != null) {
            search_sql2 += " and bbs_no like '%" + map.get("mg_stayno") + "%'";
        }
        if (map.get("mg_date") != "" && map.get("mg_date") != null) {
            search_sql2 += " and bbs_date like '%" + map.get("mg_date") + "%'";
        }
        if (map.get("mg_title") != "" && map.get("mg_title") != null) {
            search_sql2 += " and bbs_title like '%" + map.get("mg_title") + "%'";
        }

        search_sql1 += search_sql2;
        System.out.println(search_sql1);


        // 정렬용 설정
        String order_sql = "bbs_date";

        if (map.get("ps_order").equals("bbs_date_desc")) {
            order_sql = "bbs_date desc";
        } else if (map.get("ps_order").equals("bbs_date_asc")) {
            order_sql = "bbs_date asc";
        } else if (map.get("ps_order").equals("bbs_stayno_desc")) {
            order_sql = "bbs_stayno desc";
        } else if (map.get("ps_order").equals("bbs_stayno_asc")) {
            order_sql = "bbs_stayno asc";
        }


        try {
            openConn();

            sql = "select * from (select row_number() over(order by " + order_sql
                    + ") rnum, b.* from staykey_magazine b" + search_sql1 + ") where rnum >= ? and rnum <= ?"
                    + search_sql2;

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startNo);
            pstmt.setInt(2, endNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MagazineDTO dto = new MagazineDTO();

                dto.setBbs_no(rs.getInt("bbs_no"));
                dto.setBbs_title(rs.getString("bbs_title"));
                dto.setBbs_content(rs.getString("bbs_content"));
                dto.setBbs_file1(rs.getString("bbs_file1"));
                dto.setBbs_file2(rs.getString("bbs_file2"));
                dto.setBbs_file3(rs.getString("bbs_file3"));
                dto.setBbs_file4(rs.getString("bbs_file4"));
                dto.setBbs_file5(rs.getString("bbs_file5"));
                dto.setBbs_stayno(rs.getString("bbs_stayno"));
                dto.setBbs_hit(rs.getInt("bbs_hit"));
                dto.setBbs_writer_name(rs.getString("bbs_writer_name"));
                dto.setBbs_writer_id(rs.getString("bbs_writer_id"));
                dto.setBbs_writer_pw(rs.getString("bbs_writer_pw"));
                dto.setBbs_date(rs.getString("bbs_date"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }




    // ======================================================
    // 매거진 등록 메서드
    // ======================================================
    public int registerMagazine(MagazineDTO dto) {
        int result = 0, count = 0;

        try {
            openConn();

            sql = "select max(bbs_no) from staykey_magazine";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) count = rs.getInt(1) + 1;

            sql = "insert into staykey_magazine values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, count);
            pstmt.setString(2, dto.getBbs_title());
            pstmt.setString(3, dto.getBbs_content());
            pstmt.setString(4, dto.getBbs_youtube());
            pstmt.setString(5, dto.getBbs_file1());
            pstmt.setString(6, dto.getBbs_file2());
            pstmt.setString(7, dto.getBbs_file3());
            pstmt.setString(8, dto.getBbs_file4());
            pstmt.setString(9, dto.getBbs_file5());
            pstmt.setString(10, dto.getBbs_stayno());
            pstmt.setString(11, dto.getBbs_map());
            pstmt.setInt(12, dto.getBbs_hit());
            pstmt.setString(13, dto.getBbs_writer_name());
            pstmt.setString(14, dto.getBbs_writer_id());
            pstmt.setString(15, dto.getBbs_writer_pw());
            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }




    /////////////////////////////////////////////////////////////
    // 매거진 상세 목록 조회
    /////////////////////////////////////////////////////////////
    public MagazineDTO getMagView(int no) {
        MagazineDTO dto = null;

        try {
            openConn();

            sql = "select * from staykey_magazine where bbs_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                dto = new MagazineDTO();

                dto.setBbs_no(rs.getInt("bbs_no"));
                dto.setBbs_title(rs.getString("bbs_title"));
                dto.setBbs_content(rs.getString("bbs_content"));
                dto.setBbs_youtube(rs.getString("bbs_youtube"));
                dto.setBbs_file1(rs.getString("bbs_file1"));
                dto.setBbs_file2(rs.getString("bbs_file2"));
                dto.setBbs_file3(rs.getString("bbs_file3"));
                dto.setBbs_file4(rs.getString("bbs_file4"));
                dto.setBbs_file5(rs.getString("bbs_file5"));
                dto.setBbs_stayno(rs.getString("bbs_stayno"));
                dto.setBbs_map(rs.getString("bbs_map"));
                dto.setBbs_hit(rs.getInt("bbs_hit"));
                dto.setBbs_writer_name(rs.getString("bbs_writer_name"));
                dto.setBbs_writer_id(rs.getString("bbs_writer_id"));
                dto.setBbs_writer_pw(rs.getString("bbs_writer_pw"));
                dto.setBbs_date(rs.getString("bbs_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return dto;

    }




    /////////////////////////////////////////////////////////////
    // 매거진 삭제 메서드 + No 재작업
    /////////////////////////////////////////////////////////////
    public int deleteMag(int no) {
        int result = 0;

        try {
            openConn();

            sql = "delete from staykey_magazine where bbs_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            result = pstmt.executeUpdate();

            sql = "update staykey_magazine set bbs_no = bbs_no - 1 where bbs_no > ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }


}
