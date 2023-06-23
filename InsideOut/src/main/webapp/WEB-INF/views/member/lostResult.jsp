<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/member/passcheck.js"></script>
</head>
<body>
<form method="post" action="/reset" onsubmit="return check();">
	<div>
		<input type="hidden" name="username" value="${username}">
		<input type="password" id="password" name="password" >
		<button type="submit">변경</button><br>
		<span id="alert_ruleS" style="color: green;">사용 가능한 비밀번호 입니다.</span> 
		<span id="alert_ruleF" style="color: red;">영문자, 숫자, 특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정</span>
	</div>
</form>
</body>
</html>