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

<div align="center">

<form method="post" action="askViewReply">
<input type="hidden"  name="post_no"  value="${askBoard.post_no}">
<input type="hidden"  name="board_re_ref"  value="${askBoard.board_re_ref}">
<input type="hidden"  name="up_post_no"  value="${askBoard.up_post_no}">

<table id=table2 border=1>
		<tr>
			<td>작성자ID</td>
			<td><input type=text name="writer_id" value="관리자" readonly="readonly"></td>
		</tr>
		<tr>
			<td>게시글제목</td>
			<td><input type=text name="post_title"></td>
		</tr>
		<tr>
			<td>게시글내용</td>
			<td><textarea rows="10" cols="50" name="post_content"></textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<input type="submit" value="답변">
				<input type=reset value="취소">
				<input type=button value="목록">				
			</td>
		</tr>
	</table>
</form>	
	
	</div>
</body>
</html>