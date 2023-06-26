<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 정보 수정</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css"
	integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK"
	crossorigin="anonymous">
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	 crossorigin="anonymous"> -->
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">

<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>

<style>
.container-fluid {
	width: 1400px !important;
}

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
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: navy;
	font-weight: bold;
}
</style>


</head>



<body>


	<c:import url="../studentHeader.jsp" />


	<%-- 	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<c:if test="${role == 'ROLE_STUDENT'}">
						<li><a href="/api/v1/student/StudentList" class="text-info">상담 내역</a></li>
						<li><a href="/api/v1/student/surveyList" class="text-info">만족도 조사</a></li>
					</c:if>
					<c:if test="${role == 'ROLE_STAFF'}">
						<li><a href="/api/v1/staff/StaffList" class="text-info">상담 내역</a></li>
						<li><a href="/api/v1/staff/surveyList" class="text-info">만족도 조사</a></li>
					</c:if>
					<li><a href="#" class="text-info">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${send_id}" class="text-info">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${send_id}" class="text-info">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${send_id}" class="text-info">쪽지작성</a></li>
					<c:if test="${role == 'ROLE_STUDENT'}">
						<li><a href="/api/v1/student/studentUpdateForm" class="text-info">회원정보 수정</a></li>
					</c:if>
					<c:if test="${role == 'ROLE_STAFF'}">
						<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보 수정</a></li>
					</c:if>
					<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info">비밀번호 수정</a></li>
				</ul>
			</div>
 --%>



	<div class="container">

		<form action="/api/v1/student/updateStudent" method="POST">
			<div class="form-group">

				<h1 class="text-primary">학생 정보 수정</h1>

				<input type="hidden" name="student_no" value="${student.student_no}">
				<div class="form-group">

					<label for="studentName">이름:</label> <input type="text"
						id="studentName" name="student_name"
						value="${student.student_name}" class="form-control" required><br>
				</div>

				<div class="form-group">
					<label for="studentTel">전화번호:</label> <input type="text"
						id="studentTel" name="student_tel" class="form-control"
						value="${student.student_tel}" required><br>
				</div>

				<div class="form-group">
					<label for="studentEmail">이메일:</label> <input type="email"
						id="studentEmail" name="student_email" class="form-control"
						value="${student.student_email}" required><br>
				</div>


				<input type="submit" name="submit" class="btn btn-primary"
					value="수정">
		</form>
	</div>


</body>
</html>





