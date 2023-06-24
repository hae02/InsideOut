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
<!-- 부트스트랩 -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous">

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
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(
			function() {

				$('button').click(
						function() {

							//		alert("test");

							var id = $(this).attr('id');
							var date1 = $('#date_' + id).val();
							var time1 = $('#time_' + id).val();

							alert(id);
							alert(date1);
							alert(time1);

							location.href = "confrim?booking_No=" + id
									+ "&booking_Dt=" + date1 + "&booking_Time="
									+ time1;

						});
			});
</script>
</head>
<body>
	<c:import url="../staffHeader.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="/api/v1/staff/StaffList">상담 내역</a></li>
					<li><a href="/api/v1/staff/surveyList">만족도 조사</a></li>
					<li><a href="#">내가 쓴 글</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${staff_no}">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${staff_no}">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${staff_no}">쪽지작성</a></li>
					<li><a href="/api/v1/staff/staffUpdateForm">회원정보 수정</a></li>
				</ul>
				<br>
			</div>

			<div class="col-9">

				<div id="list"></div>
				<nav class="nav">
					<a class="nav-link active" aria-current="page" href="StaffList">상담관리</a>
					<a class="nav-link" href="ConfirmList">상담내역</a>
					<a class="nav-link" href="counselRecordList">상담기록</a>
				</nav>

				<!-- <table class="table table-bordered"> -->
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
										<c:if test="${booking.cd_nm == '9:00'}"> ${"selected"} </c:if>>9:00</option>
									<option value="0200"
										<c:if test="${booking.cd_nm == '10:00'}"> ${"selected"} </c:if>>10:00</option>
									<option value="0300"
										<c:if test="${booking.cd_nm == '11:00'}"> ${"selected"} </c:if>>11:00</option>
									<option value="0400"
										<c:if test="${booking.cd_nm == '12:00'}"> ${"selected"} </c:if>>12:00</option>
									<option value="0500"
										<c:if test="${booking.cd_nm == '13:00'}"> ${"selected"} </c:if>>13:00</option>
									<option value="0600"
										<c:if test="${booking.cd_nm == '14:00'}"> ${"selected"} </c:if>>14:00</option>
									<option value="0700"
										<c:if test="${booking.cd_nm == '15:00'}"> ${"selected"} </c:if>>15:00</option>
									<option value="0800"
										<c:if test="${booking.cd_nm == '16:00'}"> ${"selected"} </c:if>>16:00</option>
									<option value="0900"
										<c:if test="${booking.cd_nm == '17:00'}"> ${"selected"} </c:if>>17:00</option>
							</select> <%-- ${booking.cd_nm} --%> <%-- <input type="time" name="booking_Time" value="${booking.booking_Time}"> --%>
							</td>
							<td>
								<button type="button" id="${booking.booking_No}"
									class="btn btn-outline-secondary">확정</button>
							</td>
							<!-- onclick="confirmButton('${booking.booking_No}')" -->

						</tr>
					</c:forEach>
				</table>
				<!-- 페이징 처리 -->
				<div class="page d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${StaffListCount > 0}">
								<c:if test="${startpage > 10}">
									<li class="page-item"><a class="page-link"
										href="StaffList?page=${startpage-10}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<li class="page-item"><a class="page-link"
										href="StaffList?page=${a}">${a}</a></li>
								</c:forEach>

								<c:if test="${endpage < maxpage}">
									<li class="page-item"><a class="page-link"
										href="StaffList?page=${startpage+10}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>