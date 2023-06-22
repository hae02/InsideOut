<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>쪽지 보내기</title>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
</style>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#recv_id").val() == "") {
				alert("받는 사람ID를 입력 하세요.");
				$("#recv_id").focus();
				return false;
			}
			if ($("#message").val() == "") {
				alert("쪽지 내용을 입력 하세요.");
				$("#message").focus();
				return false;
			}

		});
	});
</script>

</head>
<body>
	<c:import url="../header.jsp" />
	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="/api/v1/student/StudentList">상담 내역</a></li>
					<li><a href="/api/v1/student/surveyList">만족도 조사</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="/api/v1/user/recvlist?recv_id=${send_id}">받은쪽지함</a></li>
					<li><a href="/api/v1/user/sendlist?send_id=${send_id}">보낸쪽지함</a></li>
					<li><a href="/api/v1/user/writenote?send_id=${send_id}">쪽지작성</a></li>
					<li><a href="/api/v1/student/studentUpdateForm">회원정보 수정</a></li>
				</ul>
			</div>

			<div class="container" style="width: 90%; margin: 0 auto;">
				<form id="snote" method="post" action="sendnote">
					<input type="hidden" name="send_id" value="${sessionScope.send_id}">
					<input type="hidden" name="send_id" value="${sessionScope.recv_id}">
					받는 사람: <input type="text" id="recv_id" name="recv_id">
					<div class="form-group">
						<textarea class="form-control" id="message" cols="100" rows="10"
							name="message"></textarea>
					</div>
					<input type="submit" id=sendmsg class="btn btn-info btn-sm"
						value="보내기" style="font-size: 1.6rem;">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
