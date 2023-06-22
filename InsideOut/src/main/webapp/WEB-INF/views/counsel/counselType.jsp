<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
.btn {
	border-radius: 5%;
	width: 300px;
	height: 300px;
	margin-right: 50px;
}

.containe {
	justify-content: center;
	align-items: center;
	display: flex;
	height: 100vh;
}
</style>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<c:import url="../header.jsp" />
	<div class="container">
		<button class="btn btn-outline-success" type="button"
			name="counsel_typeno"
			onclick="location.href='counselBooking?counsel_typeno=0101'">
			<img src="/images/people-fill.svg" width="40%">
			<h3>대학생활</h3>
		</button>
		<button class="btn btn-outline-success" type="button"
			name="counsel_typeno"
			onclick="location.href='counselBooking?counsel_typeno=0102'">
			<img src="/images/briefcase-fill.svg" width="40%">
			<h3>취업/진로</h3>
		</button>
		<button class="btn btn-outline-success" type="button"
			name="counsel_typeno"
			onclick="location.href='counselBooking?counsel_typeno=0103'">
			<img src="/images/mortarboard-fill.svg" width="40%">
			<h3>학사</h3>
		</button>
		<button class="btn btn-outline-success" type="button"
			name="counsel_typeno"
			onclick="location.href='counselBooking?counsel_typeno=0104'">
			<img src="/images/person-check-fill.svg" width="40%">
			<h3>개인고민</h3>
		</button>
	</div>
</body>
</html>