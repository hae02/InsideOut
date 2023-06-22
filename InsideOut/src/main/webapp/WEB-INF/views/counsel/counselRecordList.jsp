<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style>
    table, td, th {
        border: 1px solid black;
    }

    .active {
        font-weight: bold;
    }
</style>

<body>
    <div class="container">
        <form method="post">
            <h3>상담기록 리스트</h3>
            <table>
                <tr>
                    <th>학생번호</th>
                    <th>예약번호</th>
                    <th>상담내용</th>
                    <th>상담기록일시</th>
                </tr>
                <c:forEach items="${recordList}" var="r">
                    <tr>
                        <td><input type="text" name="student_no" value="${r.student_no}" readonly></td>
                        <td><input type="text" name="booking_no" value="${r.booking_no}" readonly></td>
                        <td><a href="counselRecordDetail?booking_no=${r.booking_no}&page=${page}">${r.counsel_content}</a></td>
                        <td><input type="text" name="counsel_record_dt" value="${r.counsel_record_dt}" readonly></td>
                    </tr>
                </c:forEach>
            </table>

            <div class="pagination">
                <c:choose>
                    <c:when test="${startpage > 1}">
                        <a href="?page=${startpage - 1}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a class="disabled">이전</a>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="${startpage}" end="${endpage}" step="1" varStatus="loop">
                    <c:choose>
                        <c:when test="${loop.index == page}">
                            <a class="active" href="?page=${loop.index}">${loop.index}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${loop.index}">${loop.index}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${endpage < maxpage}">
                        <a href="?page=${endpage + 1}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a class="disabled">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
