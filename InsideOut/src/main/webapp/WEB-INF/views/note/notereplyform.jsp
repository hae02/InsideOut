<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function send() {
	/* 	if ($("#nsubject").val() == "") {
			alert("제목을 입력하세요");
			$("#msubject").focus();
			return false;
		} */
		if ($("#message").val() == "") {
			alert("내용을 입력하세요");
			$("#message").focus();
			return false;
		}
		//	});	
	/* 	document.myform.action = "/notereply";
		document.myform.submit(); */
//		self.close();
	}
</script>
</head>
<body>

<div class="container" style="width:90%; margin:0 auto;">
  <form id="snote" method="post"  action="sendnote">
    <input type="hidden" name="send_id" value="${sessionScope.send_id}">
           받는 사람: <input type="text" id="recv_id" name="recv_id">
    <div class="form-group">
      <textarea class="form-control" id="message" cols="100" rows="10" name="message"></textarea>
    </div>
    <input type="submit" id=sendreply class="btn btn-info btn-sm" value="답장" style="font-size:1.6rem;">
  </form>
</div>  



<%-- <div class="notetitle">
    <h1>답장하기</h1>
</div>
<form name="myform" id="myform">
    <input type="hidden" id="send_id" name="send_id" value="${send_id}">
    <input type="hidden" id="recv_id" name="recv_id" value="${recv_id}">

    보내는 이: ${recv_id} <br>
    받는 이: ${send_id}<br>
    <br>
    <textarea name="message" id="message" cols="40" rows="10"
        style="resize: none;" placeholder="내용을 입력하세요."></textarea>
    <br>
    <input type="button" value="답장 보내기" onClick="send()">
</form> --%>





 <%-- <div class="notetitle"><h1>답장하기</h1></div>
	<form name="myform" id="myform">
	<input type="hidden" id="send_id" name="send_id" value="${send_id}">
	<input type="hidden" id="recv_id" name="recv_id" value="${recv_id}">
		
		보내는 이 : ${recv_id} <br>
		받는 이 : ${send_id}<br>
		<br>
		<textarea name="message" id="message" cols="40" rows="10"
			style="resize: none;" placeholder="내용을 입력하세요."></textarea>
		<br> <input type="button" value="답장 보내기" onClick="send()">
	</form> 
 --%>
</body>
</html>