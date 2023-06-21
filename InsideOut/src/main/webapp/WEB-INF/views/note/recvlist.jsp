<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 메시지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

    <style>
        .bd-navbar {
            position: sticky;
            top: 0;
            z-index: 1071;
            min-height: 4rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0 rgba(0, 0, 0, .1);
        }

        .bd-sidebar {
            position: sticky;
            z-index: 1000;
            background: #fff;
            border-right: 1px solid rgba(0, 0, 0, .1);
            overflow-y: auto;
            min-width: 160px;
            max-width: 25% !important;
        }

        .bd-sidebar .nav {
            display: block;
            margin: 20px auto;
        }

        .bd-sidebar .nav>li>a {
            display: block;
            padding: .25rem 1.5rem;
            font-size: 120%;
        }
    </style>

    <script>
        // 받은 메세지
        function mytable1(recv_id) {
            alert(recv_id);
            location.href = "recvlist?recv_id=" + recv_id;
        }

        // 보낸 메세지
        function mytable2(send_id) {
            alert(send_id);
            location.href = "sendlist?send_id=" + send_id;
        }

        function msgchk() {
            alert("전체 메시지를 읽음처리합니다.");
            var checkboxes = document.getElementsByName("checked");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    var row = checkboxes[i].parentNode.parentNode;
                    var contentCell = row.cells[2];
                    contentCell.style.textDecoration = "none";
                }
            }
            document.getElementById("rdform").action = "msgchk";
            document.getElementById("rdform").submit();
        }

        function msgdel() {
            if (confirm("정말로 선택한 메시지를 삭제하시겠습니까?")) {
                document.getElementById("rdform").action = "msgdel";
                document.getElementById("rdform").submit();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row flex-nowrap">
            <div class="col-3 bd-sidebar">
                <ul class="nav">
                    <li><a href="#">상담 내역</a></li>
                    <li><a href="surveyList">만족도 조사</a></li>
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="recvlist?recv_id=${recv_id}">받은쪽지함</a></li>
                    <li><a href="sendlist?send_id=${recv_id}">보낸쪽지함</a></li>
                  	<li><a href="writenote?send_id=${recv_id}">쪽지작성</a></li>
                </ul>
            </div>
            <div class="col-9" style="margin-top: 20px;">
                <h4>받은쪽지함</h4>
                <form method="post" action="" name="rdform" id="rdform">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>보낸 사람</th>
                                <th>받은 사람</th>
                                <th>내용</th>
                                <th>시간</th>
                       <!--          <th>확인</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${noteList}" var="note">
                                <tr>
                                    <td style="width: 6%; text-align: center;">${note.note_no}</td>
                                    <td style="width: 15%; text-align: center;">${note.send_id}</td>
                                    <td style="width: 15%; text-align: center;">${note.recv_id}</td>
                                    <td style="width: 30%; text-align: center;"><a href="notercvview?cnt=${note.note_no}&amp;recv_id=${note.recv_id}">${note.message}</a></td>
                                    <td style="width: 16%; text-align: center;"><fmt:formatDate value="${note.rcv_dt}" pattern="yyyy.MM.dd" /></td>
<%--                                     <td style="width: 6%; text-align: center;"><input type="checkbox" id="checked" name="checked" value="${note.note_no}" style="width: 20px; height: 20px;"></td> --%>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    
                     <!-- 페이지 블록 -->
        <div class="pgn" style="text-align:center;">
            <a href="recvlist?page=1&recv_id=${recv_id}" style="text-decoration:none"> < </a>
            <c:if test="${startPage !=1 }">
                <a href="recvlist?page=${page }&recv_id=${recv_id}">이전</a>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <a href="recvlist?page=${i}&recv_id=${recv_id}"> [${i}]  </a>            
            </c:forEach>
            <c:if test="${endPage != pageCount}">
                <a href="recvlist?page=${page }&recv_id=${recv_id}">다음 </a>                       
            </c:if>
            <a href="recvlist?page=${pageCount }&recv_id=${recv_id}" style="text-decoration:none"> >  </a>             
        </div>

    </div>



			<!--  <div style="float: left;">
                        <button type="button" class="btn btn-primary" onclick="msgchk()">읽음</button>
                    </div> -->
			</form>
            </div>
        </div>
    </div>
</body>
</html>
