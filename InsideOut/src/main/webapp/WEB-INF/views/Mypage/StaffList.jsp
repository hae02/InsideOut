<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>List</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	padding: 1rem 1.5rem;
	font-size: 110%;
	text-decoration: none;
	color: green;
	font-weight: bold;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	/* function confirmButton(booking_No) {
		alert(booking_No);
		alert($("#date_" + booking_No));

		var date_id = "date_" + booking_No;
		var time_id = "time_" + booking_No;

			alert("date:"+$("#date_"+booking_No).val()); 
		 alert("time:"+$("#time_"+booking_No).val());  

		console.log("booking_No:" + booking_No);
		console.log("date_booking_No:" + $("#date_" + booking_No));
		console.log("time_booking_No:" + $("#time_" + booking_No));
		console.log("date:" + $("#date_" + booking_No).val());
		console.log("time:" + $("#time_" + booking_No).val());

			location.href="";
	} */

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
	<c:import url="../header.jsp" />
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



				</head>
				<body>
					<div id="list"></div>
					<nav class="nav">
						<a class="nav-link active" aria-current="page" href="StaffList">상담관리</a>
						<a class="nav-link" href="ConfirmList">상담내역</a> 
						
					</nav>

					<table class="table table-bordered">
						<!-- <table border=1 width=1000px align=center> -->
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
										class="btn btn-outline-success">확정</button>
								</td>
								<!-- onclick="confirmButton('${booking.booking_No}')" -->
								
							</tr>
						</c:forEach>
					</table>
			</div>
		</div>
	</div>
</body>
</html>