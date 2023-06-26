<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 메시지</title>
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
	integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH"
	crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css" 
integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK" crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

<!-- 파비콘  -->
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">


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

<!-- <style>
.pg-wrapper {
	margin-top: 20px;
	text-align: center;
}

.pg-wrapper .pgn {
	display: inline-block;
}
</style> -->

<style>
.pg-wrapper {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pg-wrapper .pgn {
	display: inline-block;
}
</style>


<script>
	// 받은 메세지
	function mytable1(recv_id) {
		alert(recv_id);
		location.href = "recvlist?recv_id=" + recv_id;
	}

	// 보낸 메세지
	function mytable2(send_id) {
		alert(send_id);
		location.href = "sendlist?send_id=" + send_id;
	}
</script>

<style>
/* .table-hover tbody tr.table-secondary:hover { */
.table-hover tbody tr. {
	background-color: #f5f5f5;
	cursor: pointer;
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

	<div class="container">
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
			</div>
			
			<%-- <div class="col-9" style="margin-bottom: 20px;">
				<!-- 페이징 처리  -->
				<div class="pg-wrapper">
					<ul class="pagination pagination-sm">
						<a class="page-link" a href="recvlist?page=1&recv_id=${recv_id}"
							style="text-decoration: none">&laquo;</a>
						<c:if test="${startPage != 1}">
							<a href="recvlist?page=${page}&recv_id=${recv_id}">&laquo;</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item active"><a class="page-link"
								href="recvlist?page=${i}&recv_id=${recv_id}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage != pageCount}">
							<a class="page-link"
								href="recvlist?page=${page}&recv_id=${recv_id}">&raquo;</a>
						</c:if>
						<a class="page-link"
							href="recvlist?page=${pageCount}&recv_id=${recv_id}"
							style="text-decoration: none">&raquo;</a>
					</ul>
				</div> --%>

				<div class="container" style="max-width: 1400px;">
					<form method="post" action="" name="rdform" id="rdform">
						<div class="table-hover">
							<table class="table">
								<thead>
									<tr>
										<th style="width: 5%;">No.</th>
										<th style="width: 25%;">보낸 사람</th>
										<th style="width: 15%;">받은 사람</th>
										<th style="width: 35%;">내용</th>
										<th style="width: 20%;">시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noteList}" var="note" varStatus="vs">
							<!-- 			<tr class="table-secondary" style="background-color: pink;"> -->
										<tr>
											<td>${note.note_no}</td>
											<td><c:choose>
													<c:when test="${not empty note.send_nm}">
													${note.send_nm}
												</c:when>
													<c:otherwise>
													${note.send_id}
												</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${not empty note.recv_nm}">
													${note.recv_nm}
												</c:when>
													<c:otherwise>
													${note.recv_id}
												</c:otherwise>
												</c:choose></td>
											<td><a href="" id="message" data-bs-toggle="modal"
												data-bs-target="#noteModal${vs.index}"> ${note.message}
											</a> </td>
											<td><fmt:formatDate value="${note.rcv_dt}"
													pattern="yyyy.MM.dd" /></td>
										</tr>
										<div class="modal fade" id="noteModal${vs.index}"
											tabindex="-1" aria-labelledby="resultModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5>
															보낸이
															<c:choose>
																<c:when test="${not empty note.send_nm}">
																${note.send_nm}
															</c:when>
																<c:otherwise>
																${note.send_id}
															</c:otherwise>
															</c:choose>
														</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<button type="button" class="btn btn-link"
															style="white-space: pre-line; text-decoration: none;">
															${note.message}</button>
													</div>

													<div class="modal-footer">
														<button type="button" class="btn btn-outline-primary"
															onClick="location.href='notereplyform?send_id=${note.send_id}&recv_id=${note.recv_id}&note_No=${note.note_no}'">답장</button>
														<button type="button" class="btn btn-outline-danger"
															onClick="location.href='notedelete?note_No=${note.note_no}'">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
					
					<%-- <div class="col-9" style="margin-bottom: 20px;">
				<div class="pg-wrapper text-center">
					<ul class="pagination pagination-sm">
						<a class="page-link" a href="recvlist?page=1&recv_id=${recv_id}"
							style="text-decoration: none">&laquo;</a>
						<c:if test="${startPage != 1}">
							<a href="recvlist?page=${page}&recv_id=${recv_id}">&laquo;</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="page-item active"><a class="page-link"
								href="recvlist?page=${i}&recv_id=${recv_id}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage != pageCount}">
							<a class="page-link"
								href="recvlist?page=${page}&recv_id=${recv_id}">&raquo;</a>
						</c:if>
						<a class="page-link"
							href="recvlist?page=${pageCount}&recv_id=${recv_id}"
							style="text-decoration: none">&raquo;</a>
					</ul>
				</div> --%>
				
				<div class="col-9" style="margin-bottom: 20px;">
	<div class="pg-wrapper text-center">
		<ul class="pagination pagination-sm">
			<li class="page-item"><a class="page-link" href="recvlist?page=1&recv_id=${recv_id}" style="text-decoration: none">&laquo;</a></li>
			<c:if test="${startPage != 1}">
				<li class="page-item"><a class="page-link" href="recvlist?page=${page}&recv_id=${recv_id}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="page-item active"><a class="page-link" href="recvlist?page=${i}&recv_id=${recv_id}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage != pageCount}">
				<li class="page-item"><a class="page-link" href="recvlist?page=${page}&recv_id=${recv_id}">&raquo;</a></li>
			</c:if>
			<li class="page-item"><a class="page-link" href="recvlist?page=${pageCount}&recv_id=${recv_id}" style="text-decoration: none">&raquo;</a></li>
		</ul>
	</div>
</div>
				
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
