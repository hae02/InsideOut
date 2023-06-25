<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Header</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css">
</head>
<body>
	<header class="navbar navbar-expand-lg bg-dark border-bottom">
		<ul class="nav col-12 col-md-auto mb-2 justify-content-start mb-md-0"
			style="color: #F20544; font-size: 35px; font-weight: bold;">
			<li><img src="/images/floo3.ico" width="50px">INSIDEOUT</li>
		</ul>
		<a href="/"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
		</a>


		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="/api/v1/student/StudentList"
				class="nav-link px-2 link-dark">마이페이지</a></li>
			<li><a href="/api/v1/student/counselType"
				class="nav-link px-2 link-dark">상담예약</a></li>
			<li><a href="/api/v1/user/job_list"
				class="nav-link px-2 link-dark">취업정보</a></li>
			<li><a href="/api/v1/user/notice_list"
				class="nav-link px-2 link-dark">공지사항</a></li>
			<li><a href="/api/v1/user/QnA_list"
				class="nav-link px-2 link-dark">QnA</a></li>
		</ul>

		<ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0">
			<li><a href="/logout" class="nav-link px-2 link-dark">로그아웃</a></li>
		</ul>
	</header>
</body>
</html>