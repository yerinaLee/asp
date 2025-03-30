<!-- <%@ Language="VBScript" CodePage="65001"%>
<%
    Response.charset = "UTF-8"
    Response.CodePage="65001"
    Response.ContentType="text/html ;charset=UTF-8"
    Session.CodePage="65001"
%> -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>step1. Login</title>
</head>
<body>

    <header>
        <h1>1단계 : 로그인</h1>
    </header>
    <hr/>

    <section>
        <p>이름과 암호를 입력해주세요.</p>
        <form action="./step2.asp" method="post">
            <label for="trialUsername">아이디 : </label>
            <input type="text" id="trialUsername" name="trialUsername" />

            <label for="trialPassword">비밀번호 : </label>
            <input type="text" id="trialPassword" name="trialPassword" />
            <input type="submit"> 
        </form>
    </section>

    <hr>
    <footer>
        <p>
            <span><strong>1 단계(로그인)</strong> | </span>
            <span><a href="./step2.asp">2단계(사용자 인증)</a> | </span>
            <span><a href="./step3.asp">3단계(회원 페이지)</a> | </span>
            <span><a href="./step4.asp">4단계(로그아웃)</a> | </span>
        </p>
    </footer>    
</body>
</html>