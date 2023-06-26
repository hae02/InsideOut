<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${role == 'ROLE_STUDENT'}">
		<c:import url="../studentHeader.jsp" />
	</c:if>
	<c:if test="${role == 'ROLE_STAFF'}">
		<c:import url="../staffHeader.jsp" />
	</c:if>
	<section id=content>
		<div>&nbsp;</div>
		<div id=title align="center">
			<h2>일대일문의</h2>
		</div>
		<div align="center">
			<table id=table2 border=1 width=800>
				<tr>

					<td>작성자ID</td>
					<td>게시글제목</td>
					<td>작성일자</td>

				</tr>

				<c:forEach var="msg" items="${askList }">
					<tr>
						<td>${msg.writer_id }</td>
						<td><c:if test="${msg.up_post_no != 0 }">
						[ ↳ ]
					</c:if> <a href="askView?post_no=${msg.post_no}">${msg.post_title}</a></td>
						<td><fmt:formatDate value="${msg.post_dt }"
								pattern="yyyy-MM-dd" /></td>

					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="asklist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location.href='ask_write'">
		</div>
	</section>
</body>
</html>