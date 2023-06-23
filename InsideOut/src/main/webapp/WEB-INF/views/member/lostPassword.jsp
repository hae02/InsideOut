<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/member/lostcheck.js"></script>
</head>
<body>
<form method="post" action="/lost" onsubmit="return check();">
<input type="hidden" name="mem_type" id="mem_type" value="${mem_type}">
	<div class="join_form">
		<label for="username">학 번</label> 
		<input id="username" name="username">
		<input type="button" value="학번 일치 확인" class="button" onclick="id_check()">
		<span id="idcheck"></span>
	</div>
	<c:if test="${mem_type == '0100'}">
		<div class="join_form">
			<label for="student_name">성 함</label> 
			<input id="student_name" name="student_name">
		</div>
		<div class="join_form">
			<label for="student_tel">휴대폰 번호</label> 
			<input id="student_tel" name="student_tel"> 
			<input type="button" id="phoneChk" value="인증번호 전송" /><br> 
			<input id="phone_certify" name="phone_certify"> 
			<input type="button" id="phoneChk2" value="인증하기"> 
			<span class="successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
			<input type="hidden" id="phoneDoubleChk" /> 
			<input type="hidden" id="phoneDoubleChk" />
		</div>
	</c:if>
	<c:if test="${mem_type == '0200'}">
		<div class="join_form">
			<label for="staff_name">성 함</label> 
			<input id="staff_name" name="staff_name">
		</div>
		<div class="join_form">
			<label for="staff_tel">휴대폰 번호</label> 
			<input id="staff_tel" name="staff_tel"> 
			<input type="button" id="phoneChk" value="인증번호 전송" /><br> 
			<input id="phone_certify" name="phone_certify"> 
			<input type="button" id="phoneChk2" value="인증하기"> 
			<span class="successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> 
			<input type="hidden" id="phoneDoubleChk" /> 
			<input type="hidden" id="phoneDoubleChk" />
		</div>
	</c:if>
	<button type="submit">비밀번호 변경</button>
</form>
</body>
</html>