<!-- <%@ Language="VBScript" CodePage="65001"%>
<%
    Response.charset = "UTF-8"
    Response.CodePage="65001"
    Response.ContentType="text/html ;charset=UTF-8"
    Session.CodePage="65001"
%> -->
<%
' 사용자 인증 로직
' 이름과 암호를 비교, 승인시 T, 미승인시 F 리턴

' 로그인 승인 계정
Const authorizedUsername = "testASP01"
Const authorizedUserPassword = "test123!"

' 로그인 승인 플래그
Dim authorizeStatus
authorizeStatus = False

' 로그인 검증 메서드
Function authorizeAccount(trialUsername, trialPassword)
    If StrComp(trialUsername, authorizedUsername) = 0 Then
        If StrComp(trialPassword, authorizedUserPassword) = 0 Then
            authorizeAccount = True
            Exit Function
        End If
    End If

    authorizeAccount = False
End Function
%>

<%
' 웹 헤더 영역

Dim trialUsername
Dim trialPassword

authorizeStatus = False

If Len(Request.Form("trialUsername")) > 0 Then
' If Not IsNull(Request.Form("trialUsername")) Then
    trialUsername = Request.Form("trialUsername") ' Post 전달데이터에서 계정명 추출
    
    If Len(Request.Form("trialPassword")) > 0 Then
        trialPassword = Request.Form("trialPassword")
        authorizeStatus = authorizeAccount(trialUsername, trialPassword)
    End If
End If

' 로그인 요청 승인 시
If authorizeStatus = True Then
    Session("accountUsername") = trialUsername
    Session("accountPassword") = trialPassword
    Session.Timeout = 12 * 60 ' 세션 유효기간 : 12시간
End If
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>step2. Authorize</title>
</head>
<body>

    <header>
        <h1>1단계 : 로그인</h1>
    </header>
    <hr/>

    <section>
        <% If authorizeStatus = True Then %>
        <p>로그인에 성공했습니다.</p>
        <p><a href="./step3.asp">회원 페이지</a></p>
        <% Else %>
        <p>로그인에 실패했습니다.</p>
        <p><a href="./step1.asp">로그인 화면</a></p>
        <% End If %>
    </section>
    <hr>
    <footer>
        <p>
            <span><a href="./step1.asp">1 단계(로그인)</a> | </span>
            <span><strong>2단계(사용자 인증)</strong> | </span>
            <span><a href="./step3.asp">3단계(회원 페이지)</a> | </span>
            <span><a href="./step4.asp">4단계(로그아웃)</a> | </span>
        </p>
    </footer>    
</body>
</html>