package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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
    // 숙소 전체 목록 조회(날짜 역순) + 검색 기능
    /////////////////////////////////////////////////////////////
    public List<StayDTO> getStayList(int page, int rowsize, Map<String, Object> map) {

        List<StayDTO> list = new ArrayList<StayDTO>();

        int startNo = (page * rowsize) - (rowsize - 1);
        int endNo = (page * rowsize);

        // 검색용 설정
        String search_sql1 = " where stay_no > 0";
        String search_sql2 = "";

        if (!map.get("ps_type").equals("all")) {
            search_sql2 += "and (";            
            StringTokenizer tokenizer = new StringTokenizer(map.get("ps_type").toString(), "/");
            while (tokenizer.hasMoreTokens()) {
                search_sql2 += "stay_type like '%" + tokenizer.nextToken() + "%' or ";
            }
            search_sql2 = search_sql2.substring(0, search_sql2.lastIndexOf("'") + 1);
            search_sql2 += ")";            
        } else {
            search_sql2 += "";
        }
        
        if (map.get("ps_name") != "" && map.get("ps_name") != null) {
            search_sql2 += " and stay_name like '%" + map.get("ps_name") + "%'";
        }

        if (map.get("ps_location") != "" && map.get("ps_location") != null) { // ps_location 값이 있을 때
            if (map.get("ps_location").equals("전체")) { // 그 중 전체일 때, ps_location_sub 값이 있으면 stay_location + stay_addr 합집합
                if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                    search_sql2 += " and stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                            + map.get("ps_location_sub") + "%'";
                }
            } else { // 지역 검색 유 / ps_location_sub 있을 때
                if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                    search_sql2 += " and stay_location like '%" + map.get("ps_location")
                            + "%' and (stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                            + map.get("ps_location_sub") + "%')";
                } else {
                    search_sql2 += " and stay_location like '%" + map.get("ps_location") + "%'";
                }
            }
        } else { // ps_location 없을 때,
            if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                search_sql2 += " and (stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                        + map.get("ps_location_sub") + "%')";
            }
        }

        if (map.get("ps_phone") != "" && map.get("ps_phone") != null) {
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
            // sql = "select * from (select row_number() over(order by " + order_sql + ") rnum, s.* from staykey_stay s " + search_sql1 + ") where rnum >= ? and rnum <= ? " + search_sql2;
            // 룸 정보 join
            sql = "select * from ("
                    + "    select"
                    + "        row_number() over(order by "+ order_sql +") rnum,"
                    + "        s.*"
                    + "    from ("
                    + "        select"
                    + "            t.stay_no, t.stay_type, t.stay_name, t.stay_desc, t.stay_location, t.stay_addr, t.stay_phone, t.stay_email, t.stay_content1, t.stay_content2, t.stay_content3, t.stay_info1, t.stay_info2, t.stay_info3, t.stay_file1, t.stay_file2, t.stay_file3, t.stay_file4, t.stay_file5, t.stay_option1_name, t.stay_option1_price, t.stay_option1_desc, t.stay_option1_photo, t.stay_option2_name, t.stay_option2_price, t.stay_option2_desc, t.stay_option2_photo, t.stay_option3_name, t.stay_option3_price, t.stay_option3_desc, t.stay_option3_photo, t.stay_hit, t.stay_reserv, t.stay_date, r.room_stayno, max(r.room_price) as room_price_max, min(r.room_price) as room_price_min, r.room_people_min, r.room_people_max"
                    + "        from staykey_stay t"
                    + "        left outer join staykey_stay_room r"
                    + "        on t.stay_no = r.room_stayno"
                    + "        group by t.stay_no, t.stay_type, t.stay_name, t.stay_desc, t.stay_location, t.stay_addr, t.stay_phone, t.stay_email, t.stay_content1, t.stay_content2, t.stay_content3, t.stay_info1, t.stay_info2, t.stay_info3, t.stay_file1, t.stay_file2, t.stay_file3, t.stay_file4, t.stay_file5, t.stay_option1_name, t.stay_option1_price, t.stay_option1_desc, t.stay_option1_photo, t.stay_option2_name, t.stay_option2_price, t.stay_option2_desc, t.stay_option2_photo, t.stay_option3_name, t.stay_option3_price, t.stay_option3_desc, t.stay_option3_photo, t.stay_hit, t.stay_reserv, t.stay_date, r.room_stayno, r.room_people_min, r.room_people_max"
                    + "    ) s" + search_sql1
                    + ") where rnum >= ? and rnum <= ?" + search_sql2;

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startNo);
            pstmt.setInt(2, endNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
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

                dto.setRoom_price_min(rs.getInt("room_price_min"));
                dto.setRoom_price_max(rs.getInt("room_price_max"));
                dto.setRoom_people_min(rs.getInt("room_people_min"));
                dto.setRoom_people_max(rs.getInt("room_people_max"));

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
            if (map.get("ps_type").equals("all")) {
                // all 값일 때, search_sql 없음
            } else {
                search_sql += " and (";
                String get_type = ((String) map.get("ps_type")).substring(1);
                String[] epd_type = get_type.split("/");
                for (int i = 0; i < epd_type.length; i++) {
                    if (i > 0) {
                        search_sql += " or ";
                    }
                    search_sql += "stay_type = '" + epd_type[i] + "'";
                }
                search_sql += ") ";
            }
        }
        if (map.get("ps_name") != "" && map.get("ps_name") != null) {
            search_sql += " and stay_name like '%" + map.get("ps_name") + "%'";
        }
        if (map.get("ps_location") != "" && map.get("ps_location") != null) { // ps_location 값이 있을 때
            if (map.get("ps_location").equals("전체")) { // 그 중 전체일 때, ps_location_sub 값이 있으면 stay_location + stay_addr
                                                       // 합집합
                if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                    search_sql += " and stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                            + map.get("ps_location_sub") + "%'";
                }
            } else { // 지역 검색 유 / ps_location_sub 있을 때
                if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                    search_sql += " and stay_location like '%" + map.get("ps_location")
                            + "%' and (stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                            + map.get("ps_location_sub") + "%')";
                } else {
                    search_sql += " and stay_location like '%" + map.get("ps_location") + "%'";
                }
            }
        } else { // ps_location 없을 때,
            if (map.get("ps_location_sub") != "" && map.get("ps_location_sub") != null) {
                search_sql += " and (stay_location like '%" + map.get("ps_location_sub") + "%' or stay_addr like '%"
                        + map.get("ps_location_sub") + "%')";
            }
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
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    } // getStayTotalCount() 종료

    /////////////////////////////////////////////////////////////
    // 숙소 상세 목록 조회
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
    // 숙소 등록 메서드 + 숙소 번호 지정
    /////////////////////////////////////////////////////////////
    public int noDuplicateName(String stay_name) {
    	
        int result = 0;
        openConn();

    	sql = "select stay_no from staykey_stay where stay_name = ?";
        try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stay_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
        return result;
    } // noDuplicateName() 종료
    
    /////////////////////////////////////////////////////////////
    // 숙소 등록 메서드 + 숙소 번호 지정
    /////////////////////////////////////////////////////////////
    public int registerStay(StayDTO dto) {

        int result = 0, count = 0;
        openConn();

        try {
            sql = "select max(stay_no) from staykey_stay";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1) + 1;
            }

            sql = "insert into staykey_stay values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                    + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setString(2, dto.getStay_type());
            pstmt.setString(3, dto.getStay_name());
            pstmt.setString(4, dto.getStay_desc());
            pstmt.setString(5, dto.getStay_location());
            pstmt.setString(6, dto.getStay_addr());
            pstmt.setString(7, dto.getStay_phone());
            pstmt.setString(8, dto.getStay_email());
            pstmt.setString(9, dto.getStay_content1());
            pstmt.setString(10, dto.getStay_content2());
            pstmt.setString(11, dto.getStay_content3());
            pstmt.setString(12, dto.getStay_info1());
            pstmt.setString(13, dto.getStay_info2());
            pstmt.setString(14, dto.getStay_info3());
            pstmt.setString(15, dto.getStay_file1());
            pstmt.setString(16, dto.getStay_file2());
            pstmt.setString(17, dto.getStay_file3());
            pstmt.setString(18, dto.getStay_file4());
            pstmt.setString(19, dto.getStay_file5());
            pstmt.setString(20, dto.getStay_option1_name());
            pstmt.setInt(21, dto.getStay_option1_price());
            pstmt.setString(22, dto.getStay_option1_desc());
            pstmt.setString(23, dto.getStay_option1_photo());
            pstmt.setString(24, dto.getStay_option2_name());
            pstmt.setInt(25, dto.getStay_option2_price());
            pstmt.setString(26, dto.getStay_option2_desc());
            pstmt.setString(27, dto.getStay_option2_photo());
            pstmt.setString(28, dto.getStay_option3_name());
            pstmt.setInt(29, dto.getStay_option3_price());
            pstmt.setString(30, dto.getStay_option3_desc());
            pstmt.setString(31, dto.getStay_option3_photo());
            pstmt.setInt(32, dto.getStay_hit());
            pstmt.setInt(33, dto.getStay_reserv());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    } // registerStay() 종료

    /////////////////////////////////////////////////////////////
    // 숙소 수정 메서드
    /////////////////////////////////////////////////////////////
    public int modifyStay(StayDTO dto) {

        int result = 0;
        openConn();

        try {
            sql = "update staykey_stay set stay_type = ?, stay_name = ?, stay_desc = ?, stay_location = ?, stay_addr = ?,"
                    + " stay_phone = ?, stay_email = ?, stay_content1 = ?, stay_content2 = ?, stay_content3 = ?, stay_info1 = ?, "
                    + "stay_info2 = ?, stay_info3 = ?, stay_file1 = ?, stay_file2 = ?, stay_file3 = ?, stay_file4 = ?, "
                    + "stay_file5 = ?, stay_option1_name = ?, stay_option1_price = ?, stay_option1_desc = ?, "
                    + "stay_option1_photo = ?, stay_option2_name = ?, stay_option2_price = ?, stay_option2_desc = ?, "
                    + "stay_option2_photo = ?, stay_option3_name = ?, stay_option3_price = ?, stay_option3_desc = ?, "
                    + "stay_option3_photo = ? where stay_no = ?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getStay_type());
            pstmt.setString(2, dto.getStay_name());
            pstmt.setString(3, dto.getStay_desc());
            pstmt.setString(4, dto.getStay_location());
            pstmt.setString(5, dto.getStay_addr());
            pstmt.setString(6, dto.getStay_phone());
            pstmt.setString(7, dto.getStay_email());
            pstmt.setString(8, dto.getStay_content1());
            pstmt.setString(9, dto.getStay_content2());
            pstmt.setString(10, dto.getStay_content3());
            pstmt.setString(11, dto.getStay_info1());
            pstmt.setString(12, dto.getStay_info2());
            pstmt.setString(13, dto.getStay_info3());
            pstmt.setString(14, dto.getStay_file1());
            pstmt.setString(15, dto.getStay_file2());
            pstmt.setString(16, dto.getStay_file3());
            pstmt.setString(17, dto.getStay_file4());
            pstmt.setString(18, dto.getStay_file5());
            pstmt.setString(19, dto.getStay_option1_name());
            pstmt.setInt(20, dto.getStay_option1_price());
            pstmt.setString(21, dto.getStay_option1_desc());
            pstmt.setString(22, dto.getStay_option1_photo());
            pstmt.setString(23, dto.getStay_option2_name());
            pstmt.setInt(24, dto.getStay_option2_price());
            pstmt.setString(25, dto.getStay_option2_desc());
            pstmt.setString(26, dto.getStay_option2_photo());
            pstmt.setString(27, dto.getStay_option3_name());
            pstmt.setInt(28, dto.getStay_option3_price());
            pstmt.setString(29, dto.getStay_option3_desc());
            pstmt.setString(30, dto.getStay_option3_photo());
            pstmt.setInt(31, dto.getStay_no());
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(null, pstmt, con);
        }
        return result;

    } // modifyStay() 종료

    /////////////////////////////////////////////////////////////
    // 숙소 삭제 메서드 + 번호 재작업
    /////////////////////////////////////////////////////////////
    public int deleteStay(int no) {
        int result = 0;
        openConn();

        try {
            sql = "delete from staykey_stay where stay_no = ?";
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
    } // deleteStay() 종료

    /////////////////////////////////////////////////////////////
    // 각 숙소당 방 전체 목록 조회
    /////////////////////////////////////////////////////////////
    public List<StayRoomDTO> getStayRoomList(int no) {

        List<StayRoomDTO> list = new ArrayList<StayRoomDTO>();
        openConn();

        try {
            sql = "select * from staykey_stay_room where room_stayno = ? order by room_no asc";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StayRoomDTO dto = new StayRoomDTO();
                dto.setRoom_no(rs.getInt("room_no"));
                dto.setRoom_stayno(rs.getInt("room_stayno"));
                dto.setRoom_name(rs.getString("room_name"));
                dto.setRoom_desc(rs.getString("room_desc"));
                dto.setRoom_type(rs.getString("room_type"));
                dto.setRoom_price(rs.getInt("room_price"));
                dto.setRoom_checkin(rs.getString("room_checkin"));
                dto.setRoom_checkout(rs.getString("room_checkout"));
                dto.setRoom_people_min(rs.getInt("room_people_min"));
                dto.setRoom_people_max(rs.getInt("room_people_max"));
                dto.setRoom_size(rs.getInt("room_size"));
                dto.setRoom_bed(rs.getString("room_bed"));
                dto.setRoom_features(rs.getString("room_features"));
                dto.setRoom_amenities(rs.getString("room_amenities"));
                dto.setRoom_service(rs.getString("room_service"));
                dto.setRoom_photo1(rs.getString("room_photo1"));
                dto.setRoom_photo2(rs.getString("room_photo2"));
                dto.setRoom_photo3(rs.getString("room_photo3"));
                dto.setRoom_photo4(rs.getString("room_photo4"));
                dto.setRoom_photo5(rs.getString("room_photo5"));
                dto.setRoom_tag(rs.getString("room_tag"));

                list.add(dto);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return list;
    } // getStayRoomList() 종료

    /////////////////////////////////////////////////////////////
    // 방 상세정보 보기
    /////////////////////////////////////////////////////////////
    public StayRoomDTO getStayRoomView(int roomNo, int stayNo) {

        StayRoomDTO dto = null;
        openConn();

        try {
            sql = "select * from staykey_stay_room where room_no = ? and room_stayno = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, roomNo);
            pstmt.setInt(2, stayNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new StayRoomDTO();
                dto.setRoom_no(rs.getInt("room_no"));
                dto.setRoom_stayno(rs.getInt("room_stayno"));
                dto.setRoom_name(rs.getString("room_name"));
                dto.setRoom_desc(rs.getString("room_desc"));
                dto.setRoom_type(rs.getString("room_type"));
                dto.setRoom_price(rs.getInt("room_price"));
                dto.setRoom_checkin(rs.getString("room_checkin"));
                dto.setRoom_checkout(rs.getString("room_checkout"));
                dto.setRoom_people_min(rs.getInt("room_people_min"));
                dto.setRoom_people_max(rs.getInt("room_people_max"));
                dto.setRoom_size(rs.getInt("room_size"));
                dto.setRoom_bed(rs.getString("room_bed"));
                dto.setRoom_features(rs.getString("room_features"));
                dto.setRoom_amenities(rs.getString("room_amenities"));
                dto.setRoom_service(rs.getString("room_service"));
                dto.setRoom_photo1(rs.getString("room_photo1"));
                dto.setRoom_photo2(rs.getString("room_photo2"));
                dto.setRoom_photo3(rs.getString("room_photo3"));
                dto.setRoom_photo4(rs.getString("room_photo4"));
                dto.setRoom_photo5(rs.getString("room_photo5"));
                dto.setRoom_tag(rs.getString("room_tag"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return dto;
    } // getStayRoomView() 종료

    /////////////////////////////////////////////////////////////
    // 방 등록 메서드 + 방 번호 지정
    /////////////////////////////// t//////////////////////////////
    public int[] registerStayRoom(StayRoomDTO dto) {

        // result 값 및 room_no 받기 위한 int[] 변수 선언
        int[] resultArr = null;
        int result = 0, count = 0;
        openConn();

        try {
            sql = "select max(room_no) from staykey_stay_room";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1) + 1;
            }

            sql = "insert into staykey_stay_room values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setInt(2, dto.getRoom_stayno());
            pstmt.setString(3, dto.getRoom_name());
            pstmt.setString(4, dto.getRoom_desc());
            pstmt.setString(5, dto.getRoom_type());
            pstmt.setInt(6, dto.getRoom_price());
            pstmt.setString(7, dto.getRoom_checkin());
            pstmt.setString(8, dto.getRoom_checkout());
            pstmt.setInt(9, dto.getRoom_people_min());
            pstmt.setInt(10, dto.getRoom_people_max());
            pstmt.setInt(11, dto.getRoom_size());
            pstmt.setString(12, dto.getRoom_bed());
            pstmt.setString(13, dto.getRoom_features());
            pstmt.setString(14, dto.getRoom_amenities());
            pstmt.setString(15, dto.getRoom_service());
            pstmt.setString(16, dto.getRoom_photo1());
            pstmt.setString(17, dto.getRoom_photo2());
            pstmt.setString(18, dto.getRoom_photo3());
            pstmt.setString(19, dto.getRoom_photo4());
            pstmt.setString(20, dto.getRoom_photo5());
            pstmt.setString(21, dto.getRoom_tag());

            result = pstmt.executeUpdate();
            resultArr = new int[] { result, count };
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return resultArr;
    } // registerStayRoom() 종료

    /////////////////////////////////////////////////////////////
    // 방 정보 가져오기 메서드 @노동진
    /////////////////////////////////////////////////////////////
    public StayRoomDTO getRoomInfo(int stay_no, int room_no) {
        StayRoomDTO dto = null;

        try {
            openConn();

            sql = "select * from staykey_stay_room where room_stayno = ? and room_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stay_no);
            pstmt.setInt(2, room_no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new StayRoomDTO();
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
                dto.setRoom_tag(rs.getString("room_tag"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }
        return dto;
    }

    /////////////////////////////////////////////////////////////
    // 방 수정 메서드
    /////////////////////////////////////////////////////////////
    public int modifyStayRoom(StayRoomDTO dto) {
        int result = 0;
        openConn();

        try {
            sql = "update staykey_stay_room set room_name = ?, room_desc = ?, room_type = ?, room_price = ?, "
                    + "room_checkin = ?, room_checkout = ?, room_people_min = ?, room_people_max = ?, room_size = ?, "
                    + "room_bed = ?, room_features = ?, room_amenities = ?, room_service = ?, room_photo1 = ?, "
                    + "room_photo2 = ?, room_photo3 = ?, room_photo4 = ?, room_photo5 = ?, room_tag = ? where room_no = ?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getRoom_name());
            pstmt.setString(2, dto.getRoom_desc());
            pstmt.setString(3, dto.getRoom_type());
            pstmt.setInt(4, dto.getRoom_price());
            pstmt.setString(5, dto.getRoom_checkin());
            pstmt.setString(6, dto.getRoom_checkout());
            pstmt.setInt(7, dto.getRoom_people_min());
            pstmt.setInt(8, dto.getRoom_people_max());
            pstmt.setInt(9, dto.getRoom_size());
            pstmt.setString(10, dto.getRoom_bed());
            pstmt.setString(11, dto.getRoom_features());
            pstmt.setString(12, dto.getRoom_amenities());
            pstmt.setString(13, dto.getRoom_service());
            pstmt.setString(14, dto.getRoom_photo1());
            pstmt.setString(15, dto.getRoom_photo2());
            pstmt.setString(16, dto.getRoom_photo3());
            pstmt.setString(17, dto.getRoom_photo4());
            pstmt.setString(18, dto.getRoom_photo5());
            pstmt.setString(19, dto.getRoom_tag());
            pstmt.setInt(20, dto.getRoom_no());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    } // modifyStayRoom() 종료

    /////////////////////////////////////////////////////////////
    // 방 삭제 메서드
    /////////////////////////////////////////////////////////////
    public int deleteRoom(int room_no) {
        int result = 0;
        openConn();

        try {
            sql = "delete from staykey_stay_room where room_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, room_no);
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    } // deleteRoom() 메서드 종료

    /////////////////////////////////////////////////////////////
    // 게시물에 등록된 숙소 목록 조회 (숙소 검색용)
    /////////////////////////////////////////////////////////////
    public List<StayDTO> getBbsStayList(String bbs_stay) {
        List<StayDTO> list = new ArrayList<StayDTO>();

        String search_sql = "where stay_no > 0 ";

        if (bbs_stay != null) {
            String tmp_bbs_stay = bbs_stay.substring(1, bbs_stay.length() - 1);
            String[] epd_bbs_stay = tmp_bbs_stay.split("/");

            
            if(epd_bbs_stay.length > 1){
                for(int i=0; i<epd_bbs_stay.length; i++){
                    if(i == 0){
                        search_sql += " and (stay_no = '"+epd_bbs_stay[i]+"')";
                    }else if(i == (epd_bbs_stay.length-1)){
                        search_sql += " or (stay_no = '"+epd_bbs_stay[i]+"')";
                    }else{
                        search_sql += " or stay_no = '"+epd_bbs_stay[i]+"'";
                    }
                }
            }else{
                search_sql += " and stay_no = '"+epd_bbs_stay[0]+"'";
            }

		}   
		/* else{ search_sql += " and stay_no < 0"; } */
			// 이게 없어야 숙소 검색 시 숙소 리스트가 확인됨

        try {
            openConn();

            sql = "select * from staykey_stay " + search_sql + " order by stay_no asc";
            System.out.println(sql);
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }
        return list;
    } // getBbsStayList() 종료
    
    
    
    /////////////////////////////////////////////////////////////
    // 게시물에 등록된 숙소 목록 조회 (뷰 페이지용)
    /////////////////////////////////////////////////////////////
    public List<StayDTO> getBbsViewList(String bbs_stay) {
        List<StayDTO> list = new ArrayList<StayDTO>();

        String search_sql = "where stay_no > 0 ";

        if (bbs_stay != null) {
            String tmp_bbs_stay = bbs_stay.substring(1, bbs_stay.length() - 1);
            String[] epd_bbs_stay = tmp_bbs_stay.split("/");

            
            if(epd_bbs_stay.length > 1){
                for(int i=0; i<epd_bbs_stay.length; i++){
                    if(i == 0){
                        search_sql += " and (stay_no = '"+epd_bbs_stay[i]+"')";
                    }else if(i == (epd_bbs_stay.length-1)){
                        search_sql += " or (stay_no = '"+epd_bbs_stay[i]+"')";
                    }else{
                        search_sql += " or stay_no = '"+epd_bbs_stay[i]+"'";
                    }
                }
            }else{
                search_sql += " and stay_no = '"+epd_bbs_stay[0]+"'";
            }

		}   
		 else{ search_sql += " and stay_no < 0"; } 
			// 이게 있어야 뷰 페이지에서 숙소 정보가 올바르게 뜸

        try {
            openConn();

            sql = "select * from staykey_stay " + search_sql + " order by stay_no asc";
            System.out.println(sql);
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            closeConn(rs, pstmt, con);
        }
        return list;
    } // getBbsStayList() 종료
    
    

    //////////////////////////////////////////////////////////////
    // 숙소에 따른 모든 방 번호 조회
    /////////////////////////////// t//////////////////////////////
    public List<Integer> getSelectedRoom(int stay_no) {

        List<Integer> list = new ArrayList<Integer>();
        int count = 0;
        openConn();

        try {
            sql = "select room_no from staykey_stay_room where room_stayno = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, stay_no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt("room_no");
                list.add(count);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return list;
    } // getSelectedRoom() 종료

    //////////////////////////////////////////////////////////////
    // customer 테이블의 전체 고객을 조회하는 메서드
    /////////////////////////////////////////////////////////////
    public String getStayList() {

        String result = "";

        try {
            openConn();
            sql = "select * from staykey_stay";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            result += "<staykey_stay>";

            while (rs.next()) {
                result += "<staykey_stay>";
                result += "<stay_no>" + rs.getInt("stay_no") + "</stay_no>";
                result += "<stay_name>" + rs.getString("stay_name") + "</stay_name>";
                result += "</staykey_stay>";
            }
            result += "</staykey_stay>";

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    } // getCustomerList() 메서드 end

    /////////////////////////////////////////////////////////////
    // 숙소 전체 목록 조회(날짜 역순) + 검색 기능
    /////////////////////////////////////////////////////////////
    public List<StayDTO> getStaySearchList(String search_type, String search_text) {
        List<StayDTO> list = new ArrayList<StayDTO>();

        // 검색용 설정
        String search_sql = " where stay_no > 0";
        if (search_type != "" || search_type != null) {
            if (search_type.equals("no")) {
                search_sql += " and stay_no like '%" + search_text + "%'";
            } else {
                search_sql += " and stay_name like '%" + search_text + "%'";
            }
            System.out.println(search_sql);
        }

        try {
            openConn();

            sql = "select * from staykey_stay " + search_sql;
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StayDTO dto = new StayDTO();
                dto.setStay_no(rs.getInt("stay_no"));
                dto.setStay_type(rs.getString("stay_type"));
                dto.setStay_name(rs.getString("stay_name"));
                dto.setStay_desc(rs.getString("stay_desc"));
                dto.setStay_file1(rs.getString("stay_file1"));
                dto.setStay_file2(rs.getString("stay_file2"));
                dto.setStay_file3(rs.getString("stay_file3"));
                dto.setStay_file4(rs.getString("stay_file4"));
                dto.setStay_file5(rs.getString("stay_file5"));

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
