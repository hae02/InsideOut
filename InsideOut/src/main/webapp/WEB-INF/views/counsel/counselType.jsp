<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"
	integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css">
<link rel="shortcut icon" href="/images/floo3.ico" type="image/x-icon">
</head>
<style>
.btn {
	margin-right: 0.7%;
	margin-bottom: 2%;
	align-items: center;
	justify-content: center;
	width: 24%;
	height: 350px;
}

.button {
	/* align-items: center; */
	/* justify-content: center; */
	display: /* margin-top: 70px; */
	/* height: 100vh; */
}

.button h3 {
	color: #fff;
}

td {
	display: table-cell;
	vertical-align: inherit;
	width: 30%;
}

td.title {
	display: table-cell;
	vertical-align: inherit;
	width: 50%;
}
</style>
<body>
	<c:import url="../studentHeader.jsp" />
	<br>
	<br>
	<div class="container">
		<input type="hidden" id="student_no" name="student_no"
			value="${student_no}">
		<!-- <h3 class="card-header">상담예약</h3> -->
		<h3>상담예약</h3>
		<div class="d-grid gap-2">
			<div class="button" align="center">
				<button class="btn btn-success" type="button" name="counsel_typeno"
					onclick="location.href='counselBooking?counsel_typeno=0101'">
					<img src="/images/people-fill.svg" width="100px">
					<h3>대학생활</h3>
				</button>
				<button class="btn btn-info" type="button" name="counsel_typeno"
					onclick="location.href='counselBooking?counsel_typeno=0102'">
					<img src="/images/briefcase-fill.svg" width="100px">
					<h3>취업/진로</h3>
				</button>
				<button class="btn btn-warning" type="button" name="counsel_typeno"
					onclick="location.href='counselBooking?counsel_typeno=0103'">
					<img src="/images/mortarboard-fill.svg" width="100px">
					<h3>학사</h3>
				</button>
				<button class="btn btn-danger" type="button" name="counsel_typeno"
					onclick="location.href='counselBooking?counsel_typeno=0104'">
					<img src="/images/person-check-fill.svg" width="100px">
					<h3>개인고민</h3>
				</button>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-md-6">
				<h3 class="card-header">공지사항</h3>
				<ul class="list-group list-group-flush">
					<c:forEach var="b" items="${noticelist}" varStatus="loop">
						<c:if test="${loop.index < 5}">
							<li class="list-group-item">
								<table style="margin-bottom: 0;">
									<tr>
										<td class="title"><a
											href="${pageContext.request.contextPath}/api/v1/user/board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=notice">
												${b.post_title} </a></td>
										<%-- <td>
											<div>${b.writer_id}</div>
										</td> --%>
										<td>
											<div>
												<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd" />
											</div>
										</td>
									</tr>
								</table>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-6">
				<h3 class="card-header">취업정보</h3>
				<ul class="list-group list-group-flush">
					<c:forEach var="b" items="${joblist}" varStatus="loop">
						<c:if test="${loop.index < 5}">
							<li class="list-group-item">
								<table style="margin-bottom: 0;">
									<tr>
										<td class="title"><a
											href="${pageContext.request.contextPath}/api/v1/user/board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=job">
												${b.post_title} </a></td>
										<%-- <td>
											<div>${b.writer_id}</div>
										</td> --%>
										<td>
											<div>
												<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd" />
											</div>
										</td>
									</tr>
								</table>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>