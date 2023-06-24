<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<table id=table2 border=1>
			<tr>
				<td>이름</td>
				<td>번호</td>
				<td>비밀번호</td>
				<td>비밀번호 잠김</td>
				<td>비밀번호 초기화</td>
				<td>비밀번호 변경일시</td>
				<td>최근로그인</td>
				<td>비밀번호 오류 횟수</td>
				<td>회원구분</td>
				<td>회원상태</td>
				<td>회원 수정</td>
				<td>회원 삭제</td>
			</tr>

		<c:forEach var="b" items="${memberlist }">			
			<tr>
				<td>${b.username }</td>
				<td>${b.mem_no }</td>
				<td>${b.password }></td>
				<td>${b.pw_lock }</td>
				<td>${b.pw_reset }</td>
				<td>${b.pw_redt }</td>
				<td>${b.recent_login }</td>
				<td>${b.pw_errorcount }</td>
				<td>${b.role }</td>
				<td>${b.mem_state}</td>
				<td><input type="button" value="회원 수정" onClick="updateMember('${b.mem_no }')"></td>
				<td><input type="button" value="회원 삭제" onClick="deleteMember('${b.mem_no }')"></td>
			</tr>
		</c:forEach>	

</body>
</html>