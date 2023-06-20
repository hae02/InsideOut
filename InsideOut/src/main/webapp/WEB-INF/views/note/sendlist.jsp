<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    
    <meta charset="UTF-8">
    <title>보낸 메시지</title>
    
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
   
</head>
<body>
    <div class="container" style="width:90%; margin:0 auto;">
    
    <div class="container">
        <div class="row flex-nowrap">
            <div class="col-3 bd-sidebar">
                <ul class="nav">
                    <li><a href="#">상담 내역</a></li>
                    <li><a href="surveyList">만족도 조사</a></li>
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="recvlist?recv_id=${send_id}">받은쪽지함</a></li>
                    <li><a href="sendlist?send_id=${send_id}">보낸쪽지함</a></li>
                    <li><a href="writenote?send_id=${send_id}">쪽지작성</a></li>
                </ul>
            </div>
            <div class="col-9" style="margin-top: 20px;">
                <form method="post" action="" name="rdform" id="rdform">
                    <table class="table"> 
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>보낸 사람</th>
                                <th>받은 사람</th>
                                <th>내용</th>
                                <th>시간</th>
                              <!--   <th>확인</th> -->
                            </tr>
                        </thead>
    
    
        <div class="title"><h4>보낸쪽지함</h4></div>

        <form name="sdform" id="sdform" method="post">
        <input type="hidden" name="send_id" value="${send_id}">
           <%--  <div style="float:right; font-size:1.4rem;">총 메시지 : ${cnt }</div> --%>
            <input type="hidden" name="page" value="${page }">

 <!--            <table class="table" border=1 align=center> -->
           <!--      <tr style="text-align:center;">
                
                    <th width="10%">보낸사람</th>
                    <th width="10%">받은사람</th>
                    <th width="70%">내용</th>
                    <th width="10%">날짜</th>
                </tr> -->

                <c:if test="${empty noteList }">
                    <tr>
                        <td colspan="5">보낸 쪽지가 없습니다</td>
                    </tr>
                </c:if>
                <c:if test="${not empty noteList }">
                    <c:forEach var="send" items="${noteList }">
                        <tr style="text-align:center">
                           <td >${send.note_no}</td>
                            <td>${send.send_id }</td>
                            <td>${send.recv_id }</td>
                            <td>
<a href="notesendview?cnt=${send.note_no}&send_id=${send.send_id}">${send.message}</a>
<%-- <a href="notesendview?cnt=${rcv.note_no}&amp;send_id=${rcv.send_id}" onclick="showMessage(event)">
${rcv.message}</a> --%>

                            </td>
                            <td><fmt:formatDate value="${send.snd_dt }" pattern="yyyy.MM.dd"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            
            <%--  <div style="float:right; font-size:1.4rem;">총 메시지 : ${cnt }</div> --%>
        </form>

        <!-- 페이지 블록 -->
        <div class="pgn" style="text-align:center;">
            <a href="sendlist?page=1&send_id=${send_id}" style="text-decoration:none"> < </a>
            <c:if test="${startPage !=1 }">
                <a href="sendlist?page=${page }&send_id=${send_id}">이전</a>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <a href="sendlist?page=${i}&send_id=${send_id}"> [${i}]  </a>            
            </c:forEach>
            <c:if test="${endPage != pageCount}">
                <a href="sendlist?page=${page }&send_id=${send_id}">다음 </a>                       
            </c:if>
            <a href="sendlist?page=${pageCount }&send_id=${send_id}" style="text-decoration:none"> >  </a>             
        </div>

    </div>

    <script>
        function muldel() {
            console.log("muldel");
            $("#sdform").attr("action", "./muldel.do?num=0").submit();
            return false;
        }

        function pagin(value) {
            var url = "./sendlist.do?mem_no=${mem_no}&page=";
            console.log(value);
            location.href = url + value;
        }

        function table(value) {
            if (value == 1)
                location.href = './recvlist.do?recv_id=${recv_id}';
            else
                location.href = './sendlist.do?send_id=${send_id}';
        }

        $(function() {
            $("#allchk").click(function() {
                if ($("#allchk").is(":checked")) 
                    $("input[name=chk]").prop("checked", true);
                else 
                    $("input[name=chk]").prop("checked", false);
            });

            $("#mdel").click(function() {
                if ($("input:checkbox[name=chk]:checked").length < 1) {
                    alert("쪽지를 체크해주세요");
                    return false;
                }
                if ($("input:checkbox[name=chk]:checked").length >= 1) {
                    var del = confirm("삭제하시겠습니까?");
                    if (del) 
                        muldel();
                    else 
                        return false;
                }
            });
        });
    </script>
</body>

</html>
