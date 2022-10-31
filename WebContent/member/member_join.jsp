<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/member.css?<%=time%>" />



<div class="container page-title">
    <h2>JOIN</h2>
    <h4>회원 가입</h4>
</div>



<div class="container member-form join">
    <form name="login_form" method="post" action="<%=request.getContextPath()%>/memberJoinOk.do">
    <fieldset class="mf-wrap">
        <legend>회원 가입</legend>

        <div class="mf-form">
            <div>
                <label for="join_id">아이디</label>
                <input type="text" name="join_id" id="join_id" placeholder="아이디를 입력하세요." required autofocus />
                <p class="error">6자 이상, 영문 또는 숫자를 입력해주세요.</p>
            </div>

            <div>
                <label for="join_pw">비밀번호</label>
                <input type="password" name="join_pw" id="join_pw" placeholder="비밀번호를 입력하세요." required autofocus />
                <ul class="checked">
                    <li class="on">영문</li>
                    <li>숫자</li>
                    <li>특수문자</li>
                    <li>8자 이상 20자 이하</li>
                </ul>
            </div>

            <div>
                <input type="password" name="join_pw_re" placeholder="비밀번호를 확인해 주세요." required autofocus />
                <p class="error">비밀번호가 일치하지 않습니다.</p>
            </div>

            <div>
                <label for="join_name">이름</label>
                <input type="text" name="join_name" id="join_name" placeholder="이름를 입력하세요." required autofocus />
                <p class="error">1자 이상 10자 이하로 입력해 주세요.</p>
            </div>

            <div>
                <label for="join_email">이메일</label>
                <input type="email" name="join_email" id="join_email" placeholder="이메일을 입력하세요." required autofocus />
                <p class="error">잘못된 이메일 형식입니다.</p>
            </div>

            <div>
                <label for="join_phone">전화번호</label>
                <input type="number" name="join_phone" id="join_phone" placeholder="전화번호를 입력하세요." required autofocus />
                <p class="error">잘못된 전화번호 형식입니다.</p>
            </div>
        </div>


        <div class="mf-btn"><button type="submit">JOIN COMPLETE</button></div>
    </fieldset>
    </form>
</div>



<jsp:include page="../layout/layout_footer.jsp" />