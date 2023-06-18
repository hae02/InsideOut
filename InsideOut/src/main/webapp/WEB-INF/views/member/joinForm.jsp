<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action="/join" method="post">
		<input type="hidden" name="mem_type" value="${mem_type }">
		<c:if test="${mem_type == '0100'}'">
			<input type="hidden" name="dept_type" value="학과">
		</c:if>
		<table border="1" align="center">
			<tr>
				<c:if test="${mem_type == '0200'}">
					<td colspan="2"><input type="radio" id="dept_type"
						name="dept_type" value="학과">학과 <input type="radio"
						id="dept_type" name="dept_type" value="부서">부서</td>
				</c:if>
			</tr>
			<tr>
				<td><c:if test="${mem_type == '0100'}">학번</c:if> <c:if
						test="${mem_type == '0200'}">교직원 번호</c:if></td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><c:if test="${mem_type == '0100'}">
						<input type="text" name="student_name">
					</c:if> <c:if test="${mem_type == '0200'}">
						<input type="text" name="staff_name">
					</c:if></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><c:if test="${mem_type == '0100'}">
						<input type="text" name="student_tel">
					</c:if> <c:if test="${mem_type == '0200'}">
						<input type="text" name="staff_tel">
					</c:if></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><c:if test="${mem_type == '0100'}">
						<input type="email" name="student_email">
					</c:if> <c:if test="${mem_type == '0200'}">
						<input type="email" name="staff_email">
					</c:if></td>
			</tr>
			<tr>
				<td>학과/부서명</td>
				<td><c:if test="${mem_type == '0100'}">
						<select name="dept_name">
							<option value="" disabled="disabled" selected="selected">선택</option>
							<option value="경영학과">경영학과</option>
							<option value="경제학과">경제학과</option>
							<option value="컴퓨터공학과">컴퓨터공학과</option>
							<option value="기계과">기계과</option>
							<option value="메카트로닉스과">메카트로닉스과</option>
						</select>
					</c:if> <c:if test="${mem_type == '0200'}">
						<select name="dept_name">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="" disabled="disabled">교원</option>
								<option value="경영학과">경영학과</option>
								<option value="경제학과">경제학과</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="기계과">기계과</option>
								<option value="메카트로닉스과">메카트로닉스과</option>
								<option value="" disabled="disabled">----------------------</option>
								<option value="" disabled="disabled">직원</option>
								<option value="학생상담센터">학생상담센터</option>
								<option value="대학일자리본부">대학일자리본부</option>
								<option value="산학협력단">산학협력단</option>
						</select>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">회원가입</button>
					<button type="button" onclick="history.go(-1)">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>