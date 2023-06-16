<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 120%;
}
</style>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="#">상담 내역</a></li>
					<li><a href="surveyList">만족도 조사</a></li>
					<li><a href="#">내가 쓴 글</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="#">쪽지함</a></li>
					<li><a href="#">회원정보 수정</a></li>
				</ul>
				<br>
			</div>

			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div>
					<select class="form-select" aria-label="Default select example">
						<option selected>연도</option>
						<option value="2023">2023</option>
						<option value="2022">2022</option>
						<option value="2021">2021</option>
					</select>
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>연도</th>
								<th>평점</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${staticList}" var="list">
								<tr>
									<td></td>
									<td>${list.year}</td>
									<td>★ ${list.total/5}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
</html>