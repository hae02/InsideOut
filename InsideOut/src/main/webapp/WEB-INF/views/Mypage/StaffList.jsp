<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Staff List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.0/dist/flatly/bootstrap.min.css"
	rel="stylesheet">

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
	margin-top: 4rem; /* Adjust the top margin if needed */
	padding-right: 0; /* Remove right padding */
	padding-left: 0; /* Remove left padding */
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
	color: green;
	font-weight: bold;
}

.bd-sidebar .nav>li>a.text-info {
	color: #28a745; /* Change text color to green */
}

/* Increase the vertical spacing */
.bd-sidebar {
	margin-top: 1rem;
}

.container {
	margin-top: 2rem; /* Increase container spacing */
	margin-left: 0;
	margin-right: 0;
}

.row .col-3 .nav>li>a:hover {
	text-decoration: none;
	color: #D3D3D3;
	background-color: #D3D3D3; /* Add background color for hover effect */
}
</style>



<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(document).ready(
			function() {

				$('button').click(
						function() {
							var id = $(this).attr('id');
							var date1 = $('#date_' + id).val();
							var time1 = $('#time_' + id).val();

							alert("수정완료");
							/* alert(date1);
							alert(time1); */

							location.href = "confrim?booking_No=" + id
									+ "&booking_Dt=" + date1 + "&booking_Time="
									+ time1;
						});

			});
</script>
</head>
<body>
	<c:import url="../staffHeader.jsp" />

	<!-- <div class="container"> -->
	<div class="row flex-nowrap">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<li><a href="/api/v1/staff/StaffList" class="text-info">상담
						내역</a></li>
				<li><a href="/api/v1/staff/surveyList" class="text-info">만족도
						조사</a></li>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${staff_no}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${staff_no}"
					class="text-info">쪽지작성</a></li>
				<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
						수정</a></li>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info">비밀번호
						수정</a></li>
			</ul>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8 container">
					<!-- <div class="col-9"> -->
					<form method="post">
						<input type="hidden" id="staff_no" name="staff_no"
							value="${staff_no}">
						<div id="list"></div>
						<nav class="nav">
							<a class="nav-link active text-info" aria-current="page"
								href="StaffList">상담관리</a> <a class="nav-link text-info"
								href="ConfirmList">상담내역</a> <a class="nav-link text-info"
								href="counselRecordList">상담기록</a>
						</nav>

						<table class="table table-hover">
							<tr>
								<td>이름</td>
								<td>상담 내용</td>
								<td>날짜</td>
								<td>시간</td>
								<td>확정</td>
							</tr>

							<c:forEach var="booking" items="${bookings}">
								<tr>
									<td>${booking.student_name}</td>
									<td>${booking.counsel_Request_Content}</td>
									<td><input type="text" name="booking_Dt"
										class="form-control" id='date_${booking.booking_No}'
										value="${booking.booking_Dt}"></td>
									<td><select class="form-select"
										id='time_${booking.booking_No}'
										aria-label="Default select example">
											<option value="0100"
												<c:if test="${booking.cd_nm == '9:00'}">selected</c:if>>9:00</option>
											<option value="0200"
												<c:if test="${booking.cd_nm == '10:00'}">selected</c:if>>10:00</option>
											<option value="0300"
												<c:if test="${booking.cd_nm == '11:00'}">selected</c:if>>11:00</option>
											<option value="0400"
												<c:if test="${booking.cd_nm == '12:00'}">selected</c:if>>12:00</option>
											<option value="0500"
												<c:if test="${booking.cd_nm == '13:00'}">selected</c:if>>13:00</option>
											<option value="0600"
												<c:if test="${booking.cd_nm == '14:00'}">selected</c:if>>14:00</option>
											<option value="0700"
												<c:if test="${booking.cd_nm == '15:00'}">selected</c:if>>15:00</option>
											<option value="0800"
												<c:if test="${booking.cd_nm == '16:00'}">selected</c:if>>16:00</option>
											<option value="0900"
												<c:if test="${booking.cd_nm == '17:00'}">selected</c:if>>17:00</option>
									</select></td>
									<td>
										<button type="button" id="${booking.booking_No}"
											class="btn btn-outline-danger">확정</button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 처리 -->
						<nav aria-label="Page navigation example" align="center">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${startpage > 1}">
										<li class="page-item"><a class="page-link"
											href="?page=${startpage - 1}" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><span class="page-link"
											aria-hidden="true">&laquo;</span></li>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="${startpage}" end="${endpage}" step="1"
									varStatus="loop">
									<c:choose>
										<c:when test="${loop.index == page}">
											<li class="page-item active"><span class="page-link">${loop.index}</span></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="?page=${loop.index}">${loop.index}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${endpage < maxpage}">
										<li class="page-item"><a class="page-link"
											href="?page=${endpage + 1}" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><span class="page-link"
											aria-hidden="true">&raquo;</span></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</form>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>

</body>
</html>
