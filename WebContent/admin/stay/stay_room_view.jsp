<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="room" value="${ roomView }" />
<c:set var="stay" value="${ stayView }" />

<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>Room 상세 정보</h2>
    <small><strong>${ stay.stay_name }</strong>의 <strong>${ room.room_name }</strong> room 정보를 확인 할 수 있습니다.</small>
</div>

${ msg }
<c:remove var="msg" />

<div class="view-form">
    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <div class="card">
                <div class="card-body p-4">

                    <h2>
                    	<p>${ room.room_name }</p>
                    	<span>${ room.room_desc}</span>
                   	</h2>

                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="icon-location-pin"></i> ${room.room_type} &nbsp;
                        	<i class="fa fa-credit-card"></i> <fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${room.room_price}" type="currency" />~
                        </div>

                        <div class="col text-right">
                        	 <i class="fa fa-calendar"></i> 체크인 : ${room.room_checkin} / 체크아웃 : ${room.room_checkout}
                        </div>
                    </div>

                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="fa fa-user" ></i> 기준 <b><fmt:formatNumber value="${room.room_people_min}" /></b>명
                        	(최대 <b><fmt:formatNumber value="${room.room_people_max}" /></b>명)                       	
                        </div>

                        <div class="col text-right">
                        	<i class="icon-calendar"></i> 사이즈 : ${ room.room_size }m<sup>2</sup>
                        </div>
                    </div>
                    
                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="fa fa-bed" ></i> ${ room.room_bed } 
                        </div>

                        <div class="col text-right">
                     	   <c:forTokens items="${ room.room_tag }" delims="," var="tag">
                      		<button style="border: 0.8px solid lightgray; padding: 1px; cursor: auto;" >#${tag}</button>			
	                       </c:forTokens>
                        </div>
                    </div>
                    


                    <c:if test="${!empty room.room_photo1 or !empty room.room_photo2 or !empty room.room_photo3 or !empty room.room_photo4 or !empty room.room_photo5}">
                    <div class="d-flex py-3 border-bottom">
                        <div class="col">
                        	<ul class="stay-view-photo">
                        		<c:if test="${!empty room.room_photo1}"><li><img src="<%=request.getContextPath()%>${room.room_photo1}" alt="" /></li></c:if>
                        		<c:if test="${!empty room.room_photo2}"><li><img src="<%=request.getContextPath()%>${room.room_photo2}" alt="" /></li></c:if>
                        		<c:if test="${!empty room.room_photo3}"><li><img src="<%=request.getContextPath()%>${room.room_photo3}" alt="" /></li></c:if>
                        		<c:if test="${!empty room.room_photo4}"><li><img src="<%=request.getContextPath()%>${room.room_photo4}" alt="" /></li></c:if>
                        		<c:if test="${!empty room.room_photo5}"><li><img src="<%=request.getContextPath()%>${room.room_photo5}" alt="" /></li></c:if>
                        	</ul>
                        </div>
                    </div>
                    </c:if>


                    <div class="d-flex py-3">
                        <div class="col">
                        	<ul class="stay-view-option">
                        		<c:if test="${!empty room.room_features}">
                        		<li class="d-flex">
                        			<div>		
                        			   FEATURES		    
				                       <c:forTokens items="${ room.room_features }" delims="/" var="features">
	                        			<div class="pl-3">
	                        				<p><b>${features}</b></p>	                        				
	                        			</div>				                      
				                       </c:forTokens>
                        			</div>
                        		</li>
                        		</c:if>
                        		
                        		<br />

                        		<c:if test="${!empty room.room_amenities}">
                        		<li class="d-flex">
                        			<div>		
                        			   AMENITIES		    
				                       <c:forTokens items="${ room.room_amenities }" delims="/" var="amenities">
	                        			<div class="pl-3">
	                        				<p><b>${amenities}</b></p>	                        				
	                        			</div>				                      
				                       </c:forTokens>
                        			</div>
                        		</li>
                        		</c:if>
                        		
                        		<br />
                        		
                        		<c:if test="${!empty room.room_service}">
                        		<li class="d-flex">
                        			<div>		
                        			   ADD ON SERVICE		    
				                       <c:forTokens items="${ room.room_service }" delims="/" var="service">
	                        			<div class="pl-3">
	                        				<p><b>${service}</b></p>	                        				
	                        			</div>				                      
				                       </c:forTokens>
                        			</div>
                        		</li>
                        		</c:if>
                        	</ul>
                        </div>                 
                    </div>
                    <!-- 버튼 // START -->
                    <div class="d-flex justify-content-center mb-4">
				        <a href="<%=request.getContextPath()%>/admin/stayRoomDeleteOk.do?room_no=${room.room_no}&stay_no=${stay.stay_no}" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?\n※ 삭제된 정보는 복구할 수 없습니다.');"><i class="fa fa-trash-o"></i> 삭제하기</a>
				        <a href="<%=request.getContextPath()%>/admin/stayRoomModify.do?room_no=${room.room_no}&stay_no=${stay.stay_no}" class="btn btn-warning btn-sm mx-2"><i class="fa fa-pencil"></i> 수정하기</a>
				    </div>
				    <!-- 버튼 // end -->
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/layout_footer.jsp" />