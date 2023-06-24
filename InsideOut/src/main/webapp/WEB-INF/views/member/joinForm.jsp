<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/member/joincheck.js?ver=1"></script>
</head>
<body>
	<form action="/join" method="post" onsubmit="return check();">
		<input type="hidden" name="mem_type" id="mem_type" value="${mem_type}">
		<c:if test="${mem_type == '0100'}">
			<input type="hidden" name="dept_type" value="학과">
		</c:if>
		<c:if test="${mem_type == '0200'}">
			<input type="radio" id="dept_type1" name="dept_type" value="학과">학과 
			<input type="radio" id="dept_type2" name="dept_type" value="부서">부서
				</c:if>
		<c:if test="${mem_type == '0100'}">
			<div class="join_form">
				<label for="username">* 학 번
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="username" name="username"> 
				<input type="button" value="중복확인" class="button" onclick="id_check()">
				<span id="idcheck"></span>
			</div>
		</c:if>
		<c:if test="${mem_type == '0200'}">
			<div class="join_form">
				<label for="username">* 교직원 번호
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="username" name="username"><input type="button" value="중복확인" class="button" onclick="id_check()">
				<span id="idcheck"></span>
			</div>
		</c:if>
		<div class="join_form">
			<label for="password">* 비밀번호
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="password" id="password" name="password"> 
			<span id="alert_ruleS" style="color: green;">사용 가능한 비밀번호 입니다.</span> 
			<span id="alert_ruleF" style="color: red;">영문자, 숫자,
				특수문자(~!@#$%\^&*()+=) 포함 8~16자로 설정</span>
		</div>
		<div class="join_form">
			<label for="passwd2">* 비밀번호 확인
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
				type="password" id="password2" name="password2"> <span
				id="alert_success" style="color: green;">비밀번호가 일치합니다.</span> <span
				id="alert_fail" style="color: red;">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="join_form">
			<c:if test="${mem_type == '0100'}">
				<div class="join_form">
					<label for="student_name">* 성 함</label> <input type="text"
						id="student_name" name="student_name">
				</div>
			</c:if>
			<c:if test="${mem_type == '0200'}">
				<label for="staff_name">* 성 함</label>
				<input type="text" id="staff_name" name="staff_name">
			</c:if>
		</div>
		<c:if test="${mem_type == '0100'}">
			<div class="join_form">
				<label for="student_tel">* 휴대폰 번호</label> <input id="student_tel"
					name="student_tel"> <input type="button" id="phoneChk"
					value="인증번호 전송" /><br> <input id="phone_certify"
					name="phone_certify"> <input type="button" id="phoneChk2"
					value="인증하기"> <span class="successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> <input
					type="hidden" id="phoneDoubleChk" />
			</div>
		</c:if>
		<c:if test="${mem_type == '0200'}">
			<div class="join_form">
				<label for="staff_tel">* 휴대폰 번호</label> <input id="staff_tel"
					name="staff_tel"> <input type="button" id="phoneChk"
					value="인증번호 전송" /><br> <input id="phone_certify"
					name="phone_certify"> <input type="button" id="phoneChk2"
					value="인증하기"> <span class="successPhoneChk">휴대폰 번호는 '-' 없이 번호만 입력하세요.</span> <input
					type="hidden" id="phoneDoubleChk" /> <input type="hidden"
					id="phoneDoubleChk" />
			</div>
		</c:if>

		<div class="join_form">
			이메일
			<c:if test="${mem_type == '0100'}">
				<input type="email" id="student_email" name="student_email">
			</c:if>
			<c:if test="${mem_type == '0200'}">
				<input type="email" id="staff_email" name="staff_email">
			</c:if>
		</div>
		<c:if test="${mem_type == '0100'}">
		<div>학과/부서명</div>
			<select name="dept_name" id="dept_name">
				<option value="" disabled="disabled" selected="selected">선택</option>
				<option value="경영학과">경영학과</option>
				<option value="경제학과">경제학과</option>
				<option value="컴퓨터공학과">컴퓨터공학과</option>
				<option value="기계과">기계과</option>
				<option value="메카트로닉스과">메카트로닉스과</option>
			</select>
		</c:if>
		<div id="dept_select">학과/부서명</div>
		<c:if test="${mem_type == '0200'}">
			<select name="dept_name" id="dept_name2">
				<option value="" disabled="disabled" selected="selected">학과 선택</option>
				<option value="경영학과">경영학과</option>
				<option value="경제학과">경제학과</option>
				<option value="컴퓨터공학과">컴퓨터공학과</option>
				<option value="기계과">기계과</option>
				<option value="메카트로닉스과">메카트로닉스과</option>
			</select>
				
			<select name="dept_name" id="dept_name3">
				<option value="" disabled="disabled" selected="selected">부서 선택</option>
				<option value="학생상담센터">학생상담센터</option>
				<option value="학사과">학사과</option>
			</select>
		</c:if>
		<button type="submit">회원가입</button>
		<button type="button" onclick="history.go(-1)">취소</button>
	</form>
</body>
</html>