<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<!-- <form action="/PasswordUpdateForm" method="post">
  기타 필요한 입력 필드
  <input type="password" name="newPassword" placeholder="새 비밀번호">
  <button type="submit">비밀번호 업데이트</button>
</form> -->


<!-- // <form action="api/v1/student/PasswordUpdate" method="post"> -->
<form action="./PasswordUpdate" method="post">
    <!-- 비밀번호 입력 필드 -->
    <input type="password" name="newPassword" placeholder="새로운 비밀번호 입력" required>
    <!-- 비밀번호 업데이트 버튼 -->
    <button type="submit">비밀번호 업데이트</button>
</form>

</body>
</html>