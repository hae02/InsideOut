<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">


<style>
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
	margin-top: 4rem; /* Adjust the top margin if needed */
	padding-right: 0; /* Remove right padding */
	padding-left: 0; /* Remove left padding */
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
	color: green;
	font-weight: bold;
}

.bd-sidebar .nav>li>a.text-info {
	color: #28a745; /* Change text color to green */
}

/* Increase the vertical spacing */
.bd-sidebar {
	margin-top: 1rem;
}

.container {
	margin-top: 2rem; /* Increase container spacing */
	margin-left: 0;
	margin-right: 0;
}

.row .col-3 .nav>li>a:hover {
	text-decoration: none;
	color: #D3D3D3;
	background-color: #D3D3D3; /* Add background color for hover effect */
}

.note-form-container {
	max-width: 500px;
	margin: 0 auto;
}

.note-form {
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
}

.note-form label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

.note-form input[type="text"], .note-form textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
}

.note-form textarea {
	margin-bottom: 10px;
	/* Add spacing between the note content and the textarea */
}
</style>

<script>
	$(function() {
		$("form").submit(function() {
			if ($("#recv_id").val() == "") {
				alert("받는 사람ID를 입력하세요.");
				$("#recv_id").focus();
				return false;
			}
			if ($("#message").val() == "") {
				alert("쪽지 내용을 입력하세요.");
				$("#message").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>

	<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>

	<div class="row">
		<div class="col-3 bd-sidebar">
			<ul class="nav">
				<c:if test="${role == 'ROLE_STUDENT'}">
					<li><a href="/api/v1/student/StudentList" class="text-info">상담
							내역</a></li>
					<li><a href="/api/v1/student/surveyList" class="text-info">만족도
							조사</a></li>
				</c:if>
				<c:if test="${role == 'ROLE_STAFF'}">
					<li><a href="/api/v1/staff/StaffList" class="text-info">상담
							내역</a></li>
					<li><a href="/api/v1/staff/surveyList" class="text-info">만족도
							조사</a></li>
				</c:if>
				<li><a href="/api/v1/user/AskList" class="text-info">1:1 문의</a></li>
				<li><a href="/api/v1/user/recvlist?recv_id=${send_id}"
					class="text-info">받은쪽지함</a></li>
				<li><a href="/api/v1/user/sendlist?send_id=${send_id}"
					class="text-info">보낸쪽지함</a></li>
				<li><a href="/api/v1/user/writenote?send_id=${send_id}"
					class="text-info">쪽지작성</a></li>
				<c:if test="${role == 'ROLE_STUDENT'}">
					<li><a href="/api/v1/student/studentUpdateForm"
						class="text-info">회원정보 수정</a></li>
				</c:if>
				<c:if test="${role == 'ROLE_STAFF'}">
					<li><a href="/api/v1/staff/staffUpdateForm" class="text-info">회원정보
							수정</a></li>
				</c:if>
				<li><a href="/api/v1/user/PasswordUpdateForm" class="text-info">비밀번호
						수정</a></li>
			</ul>
		</div>

		<div class="col-9">
			<div class="container note-form-container">
				<form class="note-form" id="snote" method="post" action="sendnote">
					<label for="recv_id">받는 사람:</label> <input type="text" id="recv_id"
						name="recv_id"> <br>
					<div class="form-group">
						<label for="message">쪽지 내용:</label>
						<textarea class="form-control" id="message" cols="100" rows="10"
							name="message"></textarea>
					</div>

					<div class="d-grid gap-2">
						<button class="btn btn-lg btn-primary" type="submit" id="sendmsg"
							class="btn btn-info btn-sm">보내기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
