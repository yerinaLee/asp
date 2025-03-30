<!-- <%@ Language="VBScript" CodePage="65001"%>
<%
    Response.charset = "UTF-8"
    Response.CodePage="65001"
    Response.ContentType="text/html ;charset=UTF-8"
    Session.CodePage="65001"
%> -->

<% ' step2 메서드 사용을 위해 include %>

<% 

Dim authorizeStatus
authorizeStatus = False

%>

<%
' session 계정 검증
If Not IsNull(Session("accountUsername")) Then
    If Not IsNull(Session("accountPassword")) Then
        accountUsername = Session("accountUsername")
        accountPassword = Session("accountPassword")

        authorizeStatus = authorizeAccount(accountUsername, accountPassword)
    End If
End If

' 계정 검증 통과시 세션 연장
If authorizeStatus = True Then
    Session("accountUsername") = accountUsername
    Session("accountPassword") = accountPassword
    Session.Timeout = 12 * 60
End If
%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>step3. for members</title>
</head>
<body>

    <header>
        <h1>3단계 : 회원 페이지</h1>
    </header>
    <hr/>

    <% Response.Write(authorizeStatus) %>

    <!-- <section>        
        <% If authorizeStatus = True Then %>
        <p>회원 전용 페이지</p>
        <p>Welcome! <%= accountUsername %> 님. </p>
        <p>쿠키 문자열 : </p>
        <pre><code><%= Request.ServerVariables("HTTP_COOKIE")%></code></pre>

        <p><a href="./step4.asp">로그아웃</a></p>

        <% Else %>
        <p>계정 로그인이 필요합니다.</p>
        <p><a href="./step1.asp">로그인</a></p>
        <% End If %>
    </section> -->
    <hr>
    <footer>
        <p>
            <span><a href="./step1.asp">1단계(로그인)</a> | </span>
            <span><a href="./step2.asp">2단계(사용자 인증)</a> | </span>
            <span><strong>3단계(회원 페이지)</strong> | </span>
            <span><a href="./step4.asp">4단계(로그아웃)</a> | </span>
        </p>
    </footer>    
</body>
</html>