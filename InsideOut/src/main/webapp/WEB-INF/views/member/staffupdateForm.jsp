<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교직원 정보 수정</title>
</head>
<body>
    <h1>교직원 정보 수정</h1>
    <form action="/api/v1/staff/updateStaff" method="POST">
    <input type="hidden" name="staff_no" value="${staff.staff_no}"> <!-- 추가 -->
    <label for="staffName">이름:</label>
    <input type="text" id="staffName" name="staff_name" value="${staff.staff_name}" required><br>

    <label for="staffTel">전화번호:</label>
    <input type="text" id="staffTel" name="staff_tel" value="${staff.staff_tel}" required><br>

    <label for="staffEmail">이메일:</label>
    <input type="email" id="staffEmail" name="staff_email" value="${staff.staff_email}" required><br>

    <input type="submit" name="submit" value="수정">
</form>

</body>
</html>
