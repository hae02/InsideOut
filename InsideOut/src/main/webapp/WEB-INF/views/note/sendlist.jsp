<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<title>Chat Interface</title>

<!-- CSS styles -->

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


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap')
	;

body {
	font-size: 14px;
	font-weight: 300;
	color: rgb(58, 65, 111);
	background-image: linear-gradient(to right, rgba(238, 240, 248, 0.5),
		rgb(238, 240, 248), rgba(238, 240, 248, 0.5));
	font-family: 'Poppins', sans-serif !important;
	margin: 0px;
}

html body a {
	color: rgb(0, 115, 152);
	cursor: pointer;
	transition: all 0.2s linear 0s;
}

.container {
	padding-right: 0;
	padding-left: 0;
}

@media ( min-width : 1400px) {
	.container {
		max-width: 1320px !important;
	}
}

.card-stacked {
	display: flex;
	flex-flow: row wrap;
}

.chat {
	position: relative;
}

.chat .chat-user-detail {
	position: absolute;
	left: 0px;
	width: 0px;
	opacity: 0;
	z-index: -4;
}

.chat .chat-header {
	border-bottom: 1px solid rgb(225, 225, 227);
	background: rgb(255, 255, 255);
}

.margin-auto {
	margin-top: auto !important;
	margin-bottom: auto !important;
}

.btn.btn-light-light:not (:disabled ):not (.disabled ).active, .btn.btn-light-light:not
	 (:disabled ):not (.disabled ):active, .btn.btn-light:not (:disabled ):not
	 (.disabled ).active, .btn.btn-light:not (:disabled ):not (.disabled ):active,
	.show>.btn.btn-light-light.dropdown-toggle, .show>.btn.btn-light.dropdown-toggle
	{
	color: rgb(126, 130, 153);
	background-color: rgb(238, 240, 249);
	border-color: rgb(238, 240, 249);
}

.feather {
	color: rgb(61, 81, 167);
	fill: rgba(108, 124, 195, 0.15);
}

.avatar-xxl {
	width: 4rem;
	height: 4rem;
	font-size: 1.5rem;
	line-height: 4rem;
}

.badge-circle {
	width: 20px;
	height: 20px;
	line-height: 20px;
	font-size: 11px;
	border-radius: 50%;
	display: inline-block;
	text-align: center;
}

.badge-dot {
	width: 9px;
	height: 9px;
	line-height: 9px;
	font-size: 0px;
	border-radius: 50%;
	display: inline-block;
	text-align: center;
}

.margin-auto {
	margin-top: auto !important;
	margin-bottom: auto !important;
}

.card-stacked {
	display: flex;
	flex-flow: row wrap;
}

.chat {
	position: relative;
}

.chat .chat-user-detail {
	position: absolute;
	left: 0px;
	width: 0px;
	opacity: 0;
	z-index: -4;
}

.chat .chat-header {
	border-bottom: 1px solid rgb(225, 225, 227);
	background: rgb(255, 255, 255);
}

.margin-auto {
	margin-top: auto !important;
	margin-bottom: auto !important;
}

.btn.btn-light-light:not (:disabled ):not (.disabled ).active, .btn.btn-light-light:not
	 (:disabled ):not (.disabled ):active, .btn.btn-light:not (:disabled ):not
	 (.disabled ).active, .btn.btn-light:not (:disabled ):not (.disabled ):active,
	.show>.btn.btn-light-light.dropdown-toggle, .show>.btn.btn-light.dropdown-toggle
	{
	color: rgb(126, 130, 153);
	background-color: rgb(238, 240, 249);
	border-color: rgb(238, 240, 249);
}

.feather {
	color: rgb(61, 81, 167);
	fill: rgba(108, 124, 195, 0.15);
}

.avatar-xxl {
	width: 4rem;
	height: 4rem;
	font-size: 1.5rem;
	line-height: 4rem;
}

.badge-circle {
	width: 20px;
	height: 20px;
	line-height: 20px;
	font-size: 11px;
	border-radius: 50%;
	display: inline-block;
	text-align: center;
}

.badge-dot {
	width: 9px;
	height: 9px;
	line-height: 9px;
	font-size: 0px;
	border-radius: 50%;
	display: inline-block;
	text-align: center;
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

.bg-primary {
	background-color: rgb(38, 78, 128) !important;
}

.bg-dark-light {
	background-color: rgb(245, 247, 250);
}

.bg-light-light {
	background-color: rgb(248, 249, 252);
}

.border-light-light {
	border-color: rgb(238, 240, 249);
}

.nav-link {
	display: block;
	padding: .5rem 1rem;
	color: #fff;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: rgb(31, 69, 111);
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: rgb(31, 69, 111);
}

.sidebar-menu {
	padding-top: 15px;
}

.sidebar-menu ul li {
	margin-bottom: 5px;
}

.sidebar-menu ul li a {
	color: #454545;
	text-decoration: none;
	display: block;
	padding: 5px 0px;
	padding-left: 25px;
	transition: all 0.3s ease;
}

.sidebar-menu ul li a:hover {
	background-color: rgba(38, 78, 128, 0.3);
}

.sidebar-menu ul li ul.submenu {
	padding: 0px;
	display: none;
	transition: all 0.3s ease;
}

.sidebar-menu ul li:hover ul.submenu {
	display: block;
}

.sidebar-menu ul li ul.submenu li {
	margin-bottom: 5px;
	padding-left: 30px;
}

.navbar-light .navbar-nav .nav-link {
	color: rgba(255, 255, 255, .7);
}

.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover
	{
	color: rgba(255, 255, 255, .9);
}

.navbar-brand {
	padding-top: 0;
	padding-bottom: 0;
	height: 3.5rem;
	line-height: 2.5rem;
	font-size: 1.5rem;
	font-weight: bold;
	color: rgb(255, 255, 255);
}

.navbar-toggler {
	padding: .25rem .75rem;
	font-size: 1.25rem;
	line-height: 1;
	background-color: rgb(245, 247, 250);
	border: 1px solid rgb(245, 247, 250);
	border-radius: .25rem;
	color: rgb(38, 78, 128);
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba%28108%2c124%2c195%2c0.5%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

.navbar-light .navbar-toggler {
	border-color: rgb(245, 247, 250);
}

.bd-search {
	position: relative;
	flex: 1 1 auto;
}

.bd-search .form-control {
	position: relative;
	color: rgb(61, 81, 167);
	font-size: 0.875rem;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	background-color: rgba(255, 255, 255, 0.15);
	border: 0;
	border-radius: .25rem;
}

.bd-search .form-control::-webkit-input-placeholder {
	color: rgba(108, 124, 195, 0.5);
}

.bd-search .form-control::-moz-placeholder {
	color: rgba(108, 124, 195, 0.5);
}

.bd-search .form-control:-ms-input-placeholder {
	color: rgba(108, 124, 195, 0.5);
}

.bd-search .form-control::placeholder {
	color: rgba(108, 124, 195, 0.5);
}

.bd-search .form-control:focus {
	color: rgb(61, 81, 167);
	background-color: #fff;
	border-color: rgb(108, 124, 195);
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgb(108, 124, 195, 0.25);
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	color: rgba(108, 124, 195, 0.5);
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.nav-scroller .nav-link {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: .875rem;
	color: #454545;
}

.nav-scroller .nav-link:focus, .nav-scroller .nav-link:hover {
	color: #16181b;
}

.tab-content>.tab-pane {
	display: none;
}

.tab-content>.active {
	display: block;
}

.card-stacked {
	display: flex;
	flex-flow: row wrap;
}

.chat {
	position: relative;
}

.chat .chat-user-detail {
	position: absolute;
	left: 0px;
	width: 0px;
	opacity: 0;
	z-index: -4;
}

.chat .chat-header {
	border-bottom: 1px solid rgb(225, 225, 227);
	background: rgb(255, 255, 255);
}

.chat .chat-header .chat-header-user-detail {
	display: none;
}

.chat .chat-header .chat-header-user-detail.active {
	display: inline-block;
}

.chat .chat-header .chat-header-user-detail .chat-header-avatar {
	width: 2.2rem;
	height: 2.2rem;
	line-height: 2.2rem;
	border-radius: 50%;
	display: inline-block;
	text-align: center;
	font-size: 1rem;
}

.chat .chat-header .chat-header-user-detail .chat-header-avatar span {
	color: #fff;
	font-size: 1rem;
}

.chat .chat-body {
	padding: 1.5rem;
	overflow-y: auto;
	flex: 1 1 auto;
}

.chat .chat-body .chat-message .chat-message-content {
	background-color: rgb(245, 247, 250);
	border-radius: 1.5rem;
	padding: 0.75rem 1.25rem;
	font-size: 0.875rem;
	line-height: 1.5;
	display: inline-block;
}

.chat .chat-body .chat-message .chat-message-date {
	font-size: 0.75rem;
	color: rgb(153, 153, 153);
	margin-top: 0.25rem;
}

.chat .chat-footer {
	background-color: rgb(245, 247, 250);
	border-top: 1px solid rgb(225, 225, 227);
	padding: 1.25rem;
}

.chat .chat-footer .chat-input {
	border: none;
	border-radius: 0.5rem;
	background-color: #fff;
	padding: 0.75rem 1.25rem;
	font-size: 0.875rem;
	line-height: 1.5;
	width: 100%;
	resize: none;
}

.chat .chat-footer .chat-send {
	color: #fff;
	background-color: rgb(61, 81, 167);
	border-color: rgb(61, 81, 167);
	padding: 0.5rem 1.5rem;
	border-radius: 0.5rem;
	cursor: pointer;
	transition: all 0.2s linear 0s;
}

.chat .chat-footer .chat-send:hover {
	background-color: rgb(31, 51, 127);
	border-color: rgb(31, 51, 127);
}

.chat .chat-footer .chat-attachment {
	cursor: pointer;
	transition: all 0.2s linear 0s;
}

.chat .chat-footer .chat-attachment:hover {
	color: rgb(61, 81, 167);
}

.chat .chat-footer .chat-emoji {
	cursor: pointer;
	transition: all 0.2s linear 0s;
}

.chat .chat-footer .chat-emoji:hover {
	color: rgb(61, 81, 167);
}
</style>
</head>
<body>
	<!-- Your HTML content goes here -->
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
					<li><a href="#">회원정보 수정</a></li>
				</ul>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="chat">
							<div class="chat-body">

								<!-- Dynamic messages generated using server-side code -->
								<c:forEach var="send" items="${noteList}" varStatus="vs">
									<div class="chat-message-date">${send.snd_dt}</div>
									<div class="chat-message">
										<div class="chat-message-content">
											<a href="" id="message" data-bs-toggle="modal"
												data-bs-target="#noteModal${vs.index}">${send.message}
											</a>
										</div>
									</div>

									<!-- Modal -->
									<div class="modal fade" id="noteModal${vs.index}" tabindex="-1"
										aria-labelledby="resultModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5>받는이 ${send.recv_id}</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p>${send.message}</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-outline-primary" 
														onClick="location.href='notereplyform?send_id=${send.send_id}&recv_id=${send.recv_id}&note_No=${send.note_no}'">답장</button>
													<button type="button" class="btn btn-outline-danger"
														onClick="location.href='notedelete?note_No=${send.note_no}'">삭제</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>


							<!-- JavaScript code -->
							<script>
								// Paste your JavaScript code here, if any
							</script>
</body>
</html>
