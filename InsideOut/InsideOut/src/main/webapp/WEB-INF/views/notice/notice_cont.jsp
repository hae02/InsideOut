<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>

<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<body>
	<div id="noticecont_wrap">
		<h2 class="noticecont_title">게시물 내용보기</h2>
		<table id="noticecont_t">
			<tr>
				<th>제목</th>
				<td>${bcont.post_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bcont.writer_id}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${bcont.post_readcount}</td>
			</tr>
			<br>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${!empty bcont.save_file_nm}">
						<img src="./upload/${bcont.save_file_nm }" width="200"
							height="100">
					</c:if></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>${bcont.htmlPost_content}</td>
			</tr>
		</table>
		<br>
		<div id="boardcont_menu">
			<input type="button" value="목록" class="input_button"
				onclick="location='notice_list.do?page=${page}&board_name=notice'" />
			<input type="button" value="삭제" class="input_button"
				onclick="location='board_cont.do?post_no=${bcont.post_no}&page=${page}&state=del&board_name=notice'" />
		</div>
	</div>

</body>
</html>