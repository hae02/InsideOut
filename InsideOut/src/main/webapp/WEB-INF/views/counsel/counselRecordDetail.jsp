<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록 상세페이지</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
table, td, th {
	border: 1px solid black;
}
;
</style>
<body>
<%@ include file="/WEB-INF/header.jsp"%>
	<div class="container">
	<h3>상담기록</h3>
	
		<table class="table table-bordered">
			<tr>
				<th>학생번호</th>
				<td>${record.student_no}</td>
				<th>상담번호</th>
				<td>${record.booking_no}</td>
			</tr>
			<tr>
				<th>상담기록일</th>
				<td colspan="3">${record.counsel_record_dt}</td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td colspan="3">${record.counsel_content}</td>

			</tr>
			<!-- 기록일자 -->
		</table>
		<br>
<!-- 			<input type="hidden" name="booking_no" value="목록"> -->
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordList?page=${page}'" value="목록">
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordUpdate?booking_no=${record.booking_no}&page=${page}'" value="수정">
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordDelete?booking_no=${record.booking_no}&page=${page}'" value="삭제">
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
</body>
</html>