<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 내용 작성 폼</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<form method="post" action="counsel_ContentOk">
	
		<input type="hidden" id="counsel_typeno" name="counsel_typeno" value="${counselType.counsel_typeno}"> <!-- 상담종류 번호 -->
		<input type="hidden" name="staff_no" value="${staff_no}"> <!-- 상담사번호 -->

		<div class="form-group row">
		<label for="counsel_typename" class="col-sm-2 col-form-label">상담종류</label>
			<div class="col-sm-4">
				<input type="text" id="counsel_typename" name="counsel_typename" value="${counselType.counsel_typename}" readonly>
			</div>
		<label for="staff_no" class="col-sm-2 col-form-label">상담사</label>
			<div class="col-sm-4">
				<input type="text" id="staff_no" name="staff_no" value="${staff.staff_name}" readonly>
			</div>
		</div>
		<div class="form-group row">
		<label for="booking_dt" class="col-sm-2 col-form-label">예약일정</label>
			<div class="col-sm-4">
				<input type="text" id="booking_dt" name="booking_dt" value="${booking_dt}" readonly>
			</div>	
		<label for="booking_time" class="col-sm-2 col-form-label">예약시간</label>
			<div class="col-sm-4">
				<input type="text" id="booking_time" name="booking_time" value="${booking_time}" readonly>
			</div>	
		</div>
		<div class="form-group row">
		<label for="counsel_typename" class="col-sm-2 col-form-label">성명</label>
			<div class="col-sm-4">
				<input type="text" id="" name="" value="가져와야됨" readonly>
			</div>
		<label for="counsel_typename" class="col-sm-2 col-form-label">학번</label>
			<div class="col-sm-4">
				<input type="text" id="c" name="" value="가져와야됨" readonly>
			</div>
		</div>
	
		<div class="form-group">
			<label for="exampleFormControlTextarea1">상담내용</label>
			<textarea class="form-control" id="counsel_request_content" placeholder="상담내용을 입력해주세요." rows="20"></textarea>
		</div>
		
		<button type="submit" class="btn btn-success">예약</button>
		<button type="reset" class="btn btn-success">취소</button>
	</form>
</div>
</body>
</html>