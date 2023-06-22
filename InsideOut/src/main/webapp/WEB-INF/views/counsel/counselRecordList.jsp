<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container">
		<form method="post">
			<h3>상담기록 리스트</h3>
			<c:forEach items="${recordList}" var="r">
				<table>
					<tr>
						<th>학생번호</th>
						<th>예약번호</th>
						<th>상담내용</th>
						<th>상담기록일시</th>
					</tr>
					<tr>
						<td><input type="text" name="student_no"
							value="${r.student_no}"></td>
						<td><input type="text" name="booking_no"
							value="${r.booking_no}"></td>
						<td><a
							href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}"><input
								type="text" name="counsel_content" value="${r.counsel_content}"></a></td>
						<td><input type="text" name="counsel_record_dt"
							value="${r.counsel_record_dt}"></td>
					</tr>
				</table>
			</c:forEach>
		</form>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>