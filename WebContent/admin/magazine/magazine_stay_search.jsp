<%@page import="com.model.StayDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.StayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%		 
		 request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=UTF-8"); 
		StayDAO dao = StayDAO.getInstance();
		
		String search_type = request.getParameter("type");
		String search_keyword = request.getParameter("search").trim();

		List<StayDTO> stay = dao.getStaySearchList(search_type, search_keyword);
%>
				<c:choose>
					<c:when test="${!empty stay }">
						<c:forEach items="${stay}" var="list">
						<li class="my-2">

							<c:choose>

								<c:when test="${!empty list.stay_file1}">
									<img src="<%=request.getContextPath()%>${list.stay_file1}"
										alt="" width="60" height="60" />
								</c:when>

								<c:otherwise>
									<!-- 이미지가 없는 경우 기본 이미지 -->
									<svg class="bd-placeholder-img" width="60" height="60"
										xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img">
					                            <title>${dto.bbs_no}</title>
					                            <rect width="100%" height="100%"
											fill="#eee"></rect>
					                            <text x="48%" y="54%" fill="#888"
											dy=".1em">no img</text>
					                        </svg>
								</c:otherwise>
								
							</c:choose>
			
						
							<button class="staynobtn" id="staynobtn" onclick="test('${list.stay_no}'); close();" data-dismiss="modal">
								숙소 번호 : <b> ${list.stay_no} </b> / 숙소 이름 : <b>
									${list.stay_name}</b>
							</button>
							</li>


						</c:forEach>
					</c:when>

            <c:otherwise>등록된 회원이 없습니다.
            </c:otherwise>
            </c:choose>