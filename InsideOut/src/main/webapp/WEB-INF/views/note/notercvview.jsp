<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</script>


</head>
<body>

	<div>
		<input type="button" value="받은 메시지" onclick="mytable1('${recv_id }')"
			class="btn btn-info" style="font-size: 1.6rem;"> 
			<input type="button" value="보낸 메시지" onclick="mytable2('${send_id}')"
			class="btn btn-outline-light text-dark" style="font-size: 1.6rem;">		
	<!-- 	<li class="list-group-item active"><input type="submit"></li> -->
	</div>



	<table class="table" align=center width=600 border=1>
		<tr>
			<td width=100 align=center>보낸 이</td>
			<td>${note.recv_id}</td>
		</tr>
		<%-- <tr>
							<td align=center>받는 이</td>
							<td>${note.send_id}</td>
						
						</tr> --%>
		<%-- <tr>
							<td align=center>보낸 날짜</td>
							<td><fmt:formatDate value="${note.snd_dt}"
					  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr> --%>

		<%-- 	<tr>
							<td align=center>제목</td>
							<td>${note.nsubject}</td>
						</tr> --%>

		<tr>
			<td height=200 align=center>내용</td>
			<td>${note.message}</td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<%-- 		<input type="button" value="답장하기" onClick="message('${note.send_id}','${note.recv_id}')">  --%>
				<%-- 	<input type="button" value="답장하기" 
					onclick="location.href='notereplyform?note_No=${note.note_no}'">  --%>

				<input type="button" value="답장하기"
				onclick="location.href='notereplyform?send_id=${note.send_id}&recv_id=${note.recv_id}&note_No=${note.note_no}'">


				<%-- 		<input type="button" value="삭제하기"
					onclick="location.href='notedelete?cnt=${note.cnt }&note.page=${note.page}'"> --%>


				<input type="button" value="삭제하기"
				onclick="location.href='notedelete?note_No=${note.note_no}'">


				<%-- <a href="notedelete?note_No=${note.note_No}&recv_id=${note.recv_id}">삭제하기</a> --%>


			</td>
		</tr>
	</table>

</body>
</html>