<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	function deleteAskView(post_no) {
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			location.href = "/api/v1/user/deleteAskView?post_no=" + post_no;
		}
	}
</script>
</head>
<body>

<h1 align ="center">문의 답변</h1>
<div align="center">
<table id=table2 border=1>

		<tr>
			<td>작성자ID</td>
			<td>${askBoard.writer_id }</td>
		</tr>
		<tr>
			<td>게시글제목</td>
			<td>${askBoard.post_title}</td>
		</tr>
		<tr>
			<td>게시글내용</td>
			<td><textarea rows="10" cols="50"> ${askBoard.post_content }</textarea></td>
		</tr>

		<tr>
			<td colspan=2 align=center>
				<input type="button" value="글 삭제" onClick="deleteAskView('${askBoard.post_no }')">
				<input type="button" value="답변" 
					onClick="location.href='/api/v1/admin/replyAsk?post_no=${askBoard.post_no }' ">
			</td>
		</tr>
	</table>
	</div>
</body>
</html>