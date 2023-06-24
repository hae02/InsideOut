<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script>
	function updateMember(mem_no) {
		alert(mem_no);
		location.href = "updateMember?mem_no=" + mem_no;
	}

	function deleteMember(mem_no) {
		alert(mem_no);
		location.href = "deleteMember?mem_no=" + mem_no;
	}
</script>

</head>

<body>
<section id=content>

	<div>&nbsp;</div>
	<div id=title align="center">
		<h2>회원목록 조회 / 수정</h2>
	</div>
	<div align="center">
		<table id=table2 border=1>
			<tr>
				<td>이름</td>
				<td>번호</td>
				<td>비밀번호</td>
				<td>비밀번호 잠김</td>
				<td>비밀번호 초기화</td>
				<td>비밀번호 변경일시</td>
				<td>최근로그인</td>
				<td>비밀번호 오류 횟수</td>
				<td>회원구분</td>
				<td>회원상태</td>
				<td>회원 수정</td>
				<td>회원 삭제</td>
			</tr>

			<c:forEach var="b" items="${memberlist }">
				<tr>
					<td>${b.username }</td>
					<td>${b.mem_no }</td>
					<td>${b.password }</td>
					<td>${b.pw_lock }</td>
					<td>${b.pw_reset }</td>
					<td>${b.pw_redt }</td>
					<td>${b.recent_login }</td>
					<td>${b.pw_errorcount }</td>
					<td>${b.role }</td>
					<td>${b.mem_state}</td>
					<td><input type="button" value="회원 수정"
						onClick="updateMember('${b.mem_no }')"></td>
					<td><input type="button" value="회원 삭제"
						onClick="deleteMember('${b.mem_no }')"></td>
				</tr>
			</c:forEach>

		</table>
	</div>

	<!-- 컨트롤러의 search 로 맵핑되고, username, mem_no값을 매개값으로 넘긴다. 
	검색옵션은 작성자, 제목, 내용, 작성자+제목+내용으로 검색할 수 있도록 한다. -->

	<form name="form1" method="post" action="search">

		<select name="search_option">
			<option value="user_id"
				<c:if test="${map.search_option == 'username'}">selected</c:if>>아이디</option>

			<option value="all"
				<c:if test="${map.search_option == 'mem_no'}">selected</c:if>>회원번호</option>

		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
	</form>
	<!--  검색 시도중...-->
	
	<div class="page d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${listcount > 0}">
								<c:if test="${startpage > 10}">
									<li class="page-item"><a class="page-link"
										href="memberList?page=${startpage-10}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<li class="page-item"><a class="page-link"
										href="memberList?page=${a}">${a}</a></li>
								</c:forEach>

								<c:if test="${endpage < maxpage}">
									<li class="page-item"><a class="page-link"
										href="memberList?page=${startpage+10}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</c:if>
						</ul>
					</nav>
				</div>
				
	
	</body>

</section>
</html>