<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/board.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
</head>

<body>
 <div id="boarddel_wrap">
  <h2 class="boarddel_title">게시물 삭제</h2>
  <form method="post" action="staff/notice_del_ok.do" 
  onsubmit="return del_check()">
  <input type="hidden" name="post_no" value="${bcont.post_no}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="boarddel_t">
    <tr>
     <th>
      <h2> 정말 삭제하시겠습니까? </h2>
     </th>
    </tr>
   </table>
   <div id="boarddel_menu">
    <input type="submit" value="삭제" class="input_button" />
   </div>
  </form>
 </div>
</body>
</html>
