<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/header.jsp"%>
	<form action="/login" method="post">
		<table>
			<tr>
				<td><input type="text" id="username" name="username"
					placeholder="학 번"></td>
			</tr>
			<tr>
				<td><input type="password" id="password" name="password"
					placeholder="비밀 번호"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="login-button">로그인</button>
				</td>
			</tr>
		</table>
	</form>
	<div><a href="/joinSelect">회원 가입</a> 아이디 찾기 비밀번호 찾기</div>
</body>
</html>