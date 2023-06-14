<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
</head>
<body>
	<form method="post" action="counsel_Content">

		<input type="hidden" id="counsel_typeno" name="counsel_typeno"
			value="${counselType.counsel_typeno}">
		<h1>${counselType.counsel_typename}</h1>
		<h5>${counselType.counsel_typedetail}</h5>
		<br>

		<!-- 교직원 프로필 -->
		<div class="card-container">
			<c:forEach items="${staffList}" var="s">
				<button type="button" name="staff_no" value="${s.staff_no}">
					<input type="radio" name="staff_no" value="${s.staff_no}">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title text-dark">${s.staff_name}</h5>
							<p class="card-text text-dark">${s.staff_tel}</p>
							<p class="card-text text-dark">${s.staff_email}</p>
						</div>
					</div>
				</button>
			</c:forEach>
		</div>

		<!-- Calendar -->
		<div>
			<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
				<input type="text" id="tui-date-picker-target" id="booking_dt"
					name="booking_dt" aria-label="Date-Time" /> <span
					class="tui-ico-date"></span>
			</div>
			<div id="tui-date-picker-container" style="margin-top: -1px;"></div>

			<script
				src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
			<script>
    		var datepicker = new tui.DatePicker('#tui-date-picker-container', {
      		date: new Date(),
      		input: {
        	element: '#tui-date-picker-target',
        	format: 'yyyy-MM-dd'
      		}
    		});
  		</script>
		</div>

		<!-- BOOKING_TIME -->
		<div>
			<input type="radio" id="booking_time" name="booking_time" value="0100">9:00 <br> 
			<input type="radio" id="booking_time" name="booking_time" value="0200">10:00 <br>
			<input type="radio" id="booking_time" name="booking_time" value="0300">11:00 <br> 
			<input type="radio" id="booking_time" name="booking_time" value="0400">12:00 <br>
			<input type="radio" id="booking_time" name="booking_time" value="0500">13:00 <br> 
			<input type="radio" id="booking_time" name="booking_time" value="0600">14:00 <br>
			<input type="radio" id="booking_time" name="booking_time" value="0700">15:00 <br> 
			<input type="radio" id="booking_time" name="booking_time" value="0800">16:00 <br>
			<input type="radio" id="booking_time" name="booking_time" value="0900">17:00 <br>
		</div>

		<!-- <button type="button">이전</button> -->
		<button type="submit">다음</button>
	</form>
</body>
</html>
