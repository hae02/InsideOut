<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	index.jsp -->
	 <script type="text/javascript">
//		location.href = "mypage/start";
//		location.href = "mypage/writenote";
//		location.href = "writenote";
//		location.href = "sendlist";
//		location.href = "joinSelect";
		location.href = "loginform";
	</script>
	
	
	
	
	
	
	
 <%-- <button onclick="redirectTo('mypage/start')">Start 페이지로 이동</button>
<button onclick="redirectTo('writenote')">쪽지 작성 페이지로 이동</button>

 <%
	session.setAttribute("sender", "sender");
	session.setAttribute("test", "test");
%>
<!--  --%>
<!-- <button onclick="mytable1('test')">받은 쪽지함으로 이동</button>
<button onclick="mytable2('sender')" >보낸 쪽지함으로 이동</button>

<script>

//받은 메세지
function mytable1(recv_id) {
		alert(recv_id);
        location.href = "recvlist?recv_id="+recv_id;
}
// 보낸 메세지
function mytable2(send_id) {
	alert(send_id);
	location.href = "sendlist?send_id="+send_id;
}
</script> 



 <button onclick="redirectTo('notercvview')">쪽지 보기 페이지로 이동</button>

<script type="text/javascript">
    function redirectTo(url) {
        location.href = url;
    }
</script>  --> -->
	
	
</body>
</html>