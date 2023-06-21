<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</head>

<body>
	<c:import url="../header.jsp" />
	<div id="boarddel_wrap" class="container">
		<h2 class="boarddel_title">게시물 삭제</h2>
		<form method="post" action="staff/notice_del_ok.do">
			<input type="hidden" name="post_no" value="${bcont.post_no}" /> <input
				type="hidden" name="page" value="${page}" />
			<table id="boarddel_t">
				<tr>
					<th>
						<h2>정말 삭제하시겠습니까?</h2>
					</th>
				</tr>
			</table>
			<div id="boarddel_menu">
				<input type="submit" value="삭제" class="input_button" />
			</div>
		</form>
	</div>
</body>
</html>
