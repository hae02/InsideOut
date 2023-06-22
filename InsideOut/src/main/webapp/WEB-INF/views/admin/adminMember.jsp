<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

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
	<div>
		<section id=content>
			<div>&nbsp;</div>
			<div id=title align="center">
				<h2>회원목록 조회 / 수정</h2>
			</div>
			<div align="center">
				<table class="table" id="table2">
					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>비밀번호 잠김 여부</td>
						<td>비밀번호 초기화 여부</td>
						<td>비밀번호 변경일시</td>
						<td>최근로그인</td>
						<td>비밀번호 오류 횟수</td>
						<td>회원구분</td>
						<td>회원상태</td>
						<td>비밀번호 잠금 초기화</td>
						<td>회원 삭제</td>
					</tr>

					<c:forEach var="list" items="${memberlist }">
						<tr>
							<td>${list.mem_no }</td>
							<td>${list.username }</td>
							<td>${list.password }></td>
							<td>${list.pw_lock }</td>
							<td>${list.pw_reset }</td>
							<td><fmt:formatDate value="${list.pw_redt }"
									pattern="yyyy-MM-dd" /></td>
							<td>${list.recent_login }</td>
							<td>${list.pw_errorcount }</td>
							<td>${list.role }</td>
							<td>${list.mem_state}</td>
							<td><input type="button" value="잠금 해제"
								onClick="updateMember('${b.mem_no }')"></td>
							<td><input type="button" value="회원 삭제"
								onClick="deleteMember('${b.mem_no }')"></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div class="fl-search-container">
				<form align="center">
					<!-- 검색 기능 폼-->
					<input type="hidden" name="pageNum" value="1">
					<!-- 페이지(1)와 search, keyword가지고 list로 이동 -->
					<!-- 컨트롤러에서 pageNum값 전달 안 될 경우 1로 설정했기 때문에 여기서 따로 설정 안 해도 됨  -->
					<%-- <select name="search" class="fl-search-select">
					<option value="username"
						<c:if test="${search=='username'}">selected="selected" </c:if>>작성자</option>
					</select>  --%>
					<input type="text" placeholder="검색어를 입력해 주세요!" name="keyword"
						required>
					<!-- 사용자가 입력한 검색어(keyword)를 list로 가져감 -->
					<input type="submit" class="fl-search-btn" value="확인">
				</form>
			</div>

			<div class="page d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${listcount > 0 && keyword == null}">
							<c:if test="${startpage > 10}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${startpage-10}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${a}">${a}</a></li>
							</c:forEach>

							<c:if test="${endpage < maxpage}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${startpage+10}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</c:if>

						<c:if test="${keyword != null}">
							<c:if test="${startpage > 10}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${startpage-10}&keyword=${keyword}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${a}&keyword=${keyword}">${a}</a></li>
							</c:forEach>

							<c:if test="${endpage < maxpage}">
								<li class="page-item"><a class="page-link"
									href="adminMember?page=${startpage+10}&keyword=${keyword}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</c:if>
					</ul>
				</nav>
			</div>
		</section>
	</div>
</body>
</html>