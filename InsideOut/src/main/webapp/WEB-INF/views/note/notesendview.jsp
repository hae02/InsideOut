<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
    function mytable1(recv_id) {
        alert(recv_id);
        location.href = "recvlist?recv_id=" + recv_id;
    }

    function mytable2(send_id) {
        document.rdform.action = "sendlist?send_id=" + send_id;
        document.rdform.submit();
    }

    function viewMessage(note_no) {
        // 메시지 보기 동작 구현
        alert("메시지 보기: note_no = " + note_no);
        // location.href = "viewMessage?note_no=" + note_no;
    }

    function deleteNote() {
        // 삭제하기 동작 구현
        alert("삭제하기");
        location.href = "notedelete?note_No=${note.note_no}";
    }
</script>

</head>
<body>
    <div>
        <input type="button" value="받은 메시지" onclick="mytable1('${recv_id}')" class="btn btn-info" style="font-size: 1.6rem;">
        <input type="button" value="보낸 메시지" onclick="mytable2('${send_id}')" class="btn btn-outline-light text-dark" style="font-size: 1.6rem;">
    </div>

    <table class="table" align="center" width="600" border="1">
        <c:forEach var="note" items="${sentNotes}">
            <tr>
                <td width="100" align="center">보낸 이</td>
                <td>${rcv.recv_id}</td>
            </tr>
            <tr>
                <td height="200" align="center">내용</td>
                <td>${rcv.message}</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="답장하기" onclick="location.href='notereplyform?send_id=${rcv.send_id}&recv_id=${rcv.recv_id}&note_No=${rcv.note_no}'">
                    <input type="button" value="삭제하기" onclick="deleteNote()">
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
