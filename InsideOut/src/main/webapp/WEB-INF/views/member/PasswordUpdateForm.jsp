<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css" 
integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" 
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous"> -->
		<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">
		
		

<style>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>

<style>
.container-fluid {
	width: 1400px !important;
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
	color: navy;
	font-weight: bold;
}
</style>

</head>

<body>


	
	
<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>


<%-- 	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<c:if test="${role == 'ROLE_STUDENT'}">
						<li><a href="/api/v1/student/StudentList" class="text-info">상담 내역</a></li>
						<li><a href="/api/v1/student/surveyList" class="text-info">만족도 조사</a></li>
					</c:if>
					<c:if test="${role == 'ROLE_STAFF'}">
						<li><a href="/api/v1/staff/StaffList" class="text-info">상담 내역</a></li>
						<li><a href="/api/v1/staff/surveyList" class="text-info">만족도 조사</a></li>
					</c:if>
					<li><a href="#" class="text-info">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${send_id}" class="text-info">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${send_id}" class="text-info">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${send_id}" class="text-info">쪽지작성</a></li>
					<c:if test="${role == 'ROLE_STUDENT'}">
						<li><a href="/api/v1/student/studentUpdateForm" class="text-info">회원정보 수정</a></li>
					</c:if>
					<c:if test="${role == 'ROLE_STAFF'}">
						<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보 수정</a></li>
					</c:if>
					<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info">비밀번호 수정</a></li>
				</ul>
			</div> --%>

<div class="container">
  <form action="./PasswordUpdate" method="post" class="form-inline">
    <div class="form-group">
      <label class="sr-only" for="inputPassword">새로운 비밀번호 입력</label>
      <input type="password" name="newPassword" class="form-control" id="inputPassword" placeholder="새로운 비밀번호 입력" required>
    </div>
    <button type="submit" class="btn btn-primary">비밀번호 업데이트</button>
  </form>
</div>

</body>
</html>
