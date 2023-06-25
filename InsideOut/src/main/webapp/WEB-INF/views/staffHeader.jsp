<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Header</title>
<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	 crossorigin="anonymous">
<!--  <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</head>
<body>



<!-- <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark"> -->
<nav class="navbar navbar-expand-lg lg bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">INSIDEOUT</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/api/v1/staff/StaffList">마이페이지
          <!--   <span class="visually-hidden">(current)</span> -->
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/api/v1/user/job_list">취업정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/api/v1/user/notice_list">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/api/v1/user/QnA_list">QnA</a>
        </li>
      
      </ul>
      <div>
      
      <ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0">
				<li><a href="/logout" class="nav-link px-2 link-dark">로그아웃</a></li>
			</ul>
  
    </div>
  </div>
</nav>


	<!-- <div class="container">
		<header
			class="d-flex flex-wrap justify-content-md-between py-3 border-bottom">
			<a href="/"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			</a>
			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="/api/v1/staff/StaffList" class="nav-link px-2 link-dark">마이페이지</a></li>
				<li><a href="/api/v1/user/job_list" class="nav-link px-2 link-dark">취업정보</a></li>
				<li><a href="/api/v1/user/notice_list" class="nav-link px-2 link-dark">공지사항</a></li>
				<li><a href="/api/v1/user/QnA_list" class="nav-link px-2 link-dark">QnA</a></li>
			</ul>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0">
				<li><a href="/logout" class="nav-link px-2 link-dark">로그아웃</a></li>
			</ul>
		</header>
	</div> -->
</body>
</html>