<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="UTF-8">
  <title>쪽지 보내기</title>
  
  <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
  
  <script>
    $(function() {	
      $("form").submit(function() {
    	if($("#recv_id").val()==""){
         	alert("받는 사람ID를 입력 하세요.");
         	$("#recv_id").focus();
         	return false;
       	}  
       	if($("#message").val()==""){
       		alert("쪽지 내용을 입력 하세요.");
       		$("#message").focus();
       		return false;
       	}
    	  
      });
    });
  </script>
  
</head>
<body>
<div class="container" style="width:90%; margin:0 auto;">
  <form id="snote" method="post"  action="sendnote">
    <input type="hidden" name="send_id" value="${sessionScope.send_id}">
    <input type="hidden" name="send_id" value="${sessionScope.recv_id}">
           받는 사람: <input type="text" id="recv_id" name="recv_id">
    <div class="form-group">
      <textarea class="form-control" id="message" cols="100" rows="10" name="message"></textarea>
    </div>
    <input type="submit" id=sendmsg class="btn btn-info btn-sm" value="보내기" style="font-size:1.6rem;">
  </form>
</div>  
</body>  
</html>
