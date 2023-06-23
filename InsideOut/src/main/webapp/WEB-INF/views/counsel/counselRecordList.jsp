<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
table, td, th {
	border: 1px solid black;
}

.active {
	font-weight: bold;
}
</style>

<body>
<%@ include file="/WEB-INF/header.jsp"%>
	<div class="container">
		<form method="post">
			<h3>상담기록 리스트</h3>
			<table class="table table-bordered">
				<tr>
					<th>학생번호</th>
					<th>예약번호</th>
					<th>상담내용</th>
					<th>상담기록일시</th>
				</tr>
				<c:forEach items="${recordList}" var="r">
					<tr>
						<td><input type="text" name="student_no" value="${r.student_no}" readonly></td>
                        <td><input type="text" name="booking_no" value="${r.booking_no}" readonly></td>
                        <%--<td><a href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}">${r.counsel_content}</a></td>
                        <td><input type="text" name="counsel_record_dt" value="${r.counsel_record_dt}" readonly></td> --%>
						<td><a
							href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}">${r.counsel_content}</a></td>
						<td>${r.counsel_record_dt}</td>
					</tr>
				</c:forEach>
			</table>
			<nav aria-label="Page navigation example" align="center">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${startpage > 1}">
							<li class="page-item"><a class="page-link"
								href="?page=${startpage - 1}" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								aria-hidden="true">&laquo;</span></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${startpage}" end="${endpage}" step="1"
						varStatus="loop">
						<c:choose>
							<c:when test="${loop.index == page}">
								<li class="page-item active"><span class="page-link">${loop.index}</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${loop.index}">${loop.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${endpage < maxpage}">
							<li class="page-item"><a class="page-link"
								href="?page=${endpage + 1}" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><span class="page-link"
								aria-hidden="true">&raquo;</span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
	</div>
	</form>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
