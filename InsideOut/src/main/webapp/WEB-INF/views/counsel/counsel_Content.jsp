<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 내용 작성 폼</title>
</head>
<body>

	<form method="post" action="counsel_ContentOk">

		<input type="text" id="counsel_typeno" name="counsel_typeno" value="${counselType.counsel_typeno}">
		<input type="text" name="staff_no" value="${staff_no}" readonly>

		상담종류<input type="text" name="counsel_typename" value="${counselType.counsel_typename}" readonly> <br>
		예약일자<input type="text" name="booking_dt" value="${booking_dt}" readonly>
		예약시간<input type="text" name="booking_time" value="${booking_time}" readonly> <br> 
	<!-- 	성명<input type="text" name=""> 
		연락처<input type="text" name=""> 
		이메일<input type="text" name=""> -->

		<div>
			<textarea name="counsel_request_content"></textarea>
		</div>

		<button type="submit">예약</button>
		<button type="reset">취소</button>
	</form>

</body>
</html>