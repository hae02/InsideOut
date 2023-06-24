<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

			<c:forEach var="msg" items="${askBoardList }">
				<tr>
					<td>${msg.writer_id }</td>
					<td>
					<c:if test="${msg.up_post_no != 0 }">
						[ ↳ ]
					</c:if>					
				
					<a href="/api/v1/user/askView?post_no=${msg.post_no}">${msg.post_title}</a>
					
					</td>
					<td><fmt:formatDate value="${msg.post_dt }" pattern="yyyy-MM-dd"/></td>
					
				</tr>
			</c:forEach>
		</table>
	</div>
</section>
</body>
</html>