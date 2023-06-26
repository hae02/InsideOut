<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous">
		<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">

<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>

</head>

<body>

<div class="container">
  <form action="./PasswordUpdate" method="post" class="form-inline">
    <div class="form-group">
      <label class="sr-only" for="inputPassword">새로운 비밀번호 입력</label>
      <input type="password" name="newPassword" class="form-control" id="inputPassword" placeholder="새로운 비밀번호 입력" required>
    </div>
    <button type="submit" class="btn btn-primary">비밀번호 업데이트</button>
  </form>
</div>

</body>
</html>
