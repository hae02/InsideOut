<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<c:import url="../staffHeader.jsp" />
	<div class="container">
		<form method="post" action="counselRecordOk">

			<!-- 상담종류 번호 -->
			<input type="text" id="booking_no" name="booking_no"
				value="${cBookingBean.booking_no}">
			<input type="text" id="student_no" name="student_no"
				value="${cBookingBean.student_no}">
			
			<!-- 기록일자 -->
			<%-- <input type="hidden" id="counsel_record_dt" name="counsel_record_dt" value="${counsel_record_dt}"> --%>

			<!-- <div class="form-group row">
		<label for="counsel_typename" class="col-sm-2 col-form-label">학번</label>
			<div class="col-sm-4">
				<input type="text" id="student_no" name="student_no" value="${student_no}">
			</div>
		</div> -->

			<div class="form-group">
				<label for="exampleFormControlTextarea1">상담기록</label>
				<textarea class="form-control" id="counsel_content"
					name="counsel_content" placeholder="상담내용을 입력해주세요." rows="20"></textarea>
			</div>

			<button type="reset" class="btn btn-success">취소</button>
			<button type="submit" class="btn btn-success">기록</button>
		</form>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	</div>
</body>
</html>