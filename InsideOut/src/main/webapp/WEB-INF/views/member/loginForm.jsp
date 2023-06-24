<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="/js/member/logincheck.js"></script>
</head>
<body>
<div>
	<form action="/login" method="post" onsubmit="return check()">
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
</div>
	<div><a href="/joinSelect">회원 가입</a> <a href="/lostSelect">비밀번호 재설정</a></div>
</body>
</html>