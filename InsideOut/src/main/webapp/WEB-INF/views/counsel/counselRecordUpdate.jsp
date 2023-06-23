<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담기록 수정</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<c:import url="../staffHeader.jsp" />
	<div class="container">
		<form method="post" action="counselRecordUpdateOk">

			<input type="hidden" id="booking_no" name="booking_no" value="${record.booking_no}">
			<input type="hidden" name="page" value="${page}">
			<%-- <input type="hidden" id="counsel_record_dt" name="counsel_record_dt" value="${record.counsel_record_dt}"> --%>
			<%-- <input type="hidden" id="student_no" name="student_no" value="${record.student_no}"> --%>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">상담기록</label>
				<textarea class="form-control" id="counsel_content"
					name="counsel_content" placeholder="상담내용을 입력해주세요." rows="20">${record.counsel_content}</textarea>
			</div>

			<button type="reset" class="btn btn-success">취소</button>
			<button type="submit" class="btn btn-success">수정</button>
		</form>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	</div>
</body>
</html>