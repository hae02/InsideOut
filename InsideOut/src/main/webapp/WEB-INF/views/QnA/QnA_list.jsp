 <%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.InsideOut.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA 게시판 목록</title>
<link rel="stylesheet" href="./css/bbs.css" type="text/css">
</head>
<body>
<c:import url="../header.jsp" />
<div id="noticelist_wrap">
		<h2 class="noticelist_title"> <QnA> </h2>
		<div id="noticelist_c">글 개수 : ${noticelistcount}</div>

		<table class = "table" id="noticelist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">작성자</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
					<div align="center">날짜</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">조회수</div>
				</td>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${noticelistcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${noticelist}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">								
						
					<!-- 제목 출력 부분 -->	
					<a href="board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=notice"> ${b.post_title}
					</a>
					<%-- 시큐리티 머지하고 쓸것
					<a href="<sec:authorize access="hasAnyRole('ROLE_STAFF','ROLE_ADMIN')">staff/</sec:authorize>board_cont?post_no=${b.post_no}&page=${page}&state=cont&board_name=notice">
							 --%>
					</div>
				</td>

				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.writer_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
						<fmt:formatDate value="${b.post_dt}" pattern="yyyy-MM-dd"/>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.post_readcount}</div>
				</td>
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->			
		</table>
		

		<div id="noticelist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="notice_list?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="notice_list?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="notice_list?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="noticelist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='staff/board_write?page=${page}&board_name=notice'">
				
		</div>
		
	</div>
</body>
</html>