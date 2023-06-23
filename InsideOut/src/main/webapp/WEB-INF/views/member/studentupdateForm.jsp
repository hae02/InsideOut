<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>
</head>
<body>
	<h1>학생 정보 수정</h1>
	<form action="/api/v1/student/updateStudent" method="POST">
		<input type="hidden" name="student_no" value="${student.student_no}">
		<!-- 추가 -->
		<label for="studentName">이름:</label> <input type="text"
			id="studentName" name="student_name" value="${student.student_name}"
			required><br> <label for="studentTel">전화번호:</label> <input
			type="text" id="studentTel" name="student_tel"
			value="${student.student_tel}" required><br> <label
			for="studentEmail">이메일:</label> <input type="email" id="studentEmail"
			name="student_email" value="${student.student_email}" required><br>

		<input type="submit" name="submit" value="수정">
	</form>

</body>
</html>
