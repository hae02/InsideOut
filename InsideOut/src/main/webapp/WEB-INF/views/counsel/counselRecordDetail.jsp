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

.active {
	font-weight: bold;
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
	color: green;
	font-weight: bold;
}
</style>
<body>
<%@ include file="/WEB-INF/header.jsp"%>
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
			<form>
	<input type="hidden" id="staff_no" name="staff_no" value="${staff_no}">
	
	<h3>상담기록</h3>
		
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td>${record.student_name}</td>
				<th>학번</th>
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
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordList?page=${page}'" value="목록">
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordUpdate?booking_no=${record.booking_no}&page=${page}'" value="수정">
			<input type="button" class="btn btn-success" onclick="location.href='counselRecordDelete?booking_no=${record.booking_no}&page=${page}'" value="삭제">
			</form>
<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	</div>
	</div>
</body>
</html>