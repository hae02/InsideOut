<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

* {
font-family: 'Roboto', sans-serif;}

body {
  padding:1.5em;
  background: #fff
}

table {
  border: 1px #a39485 solid;
  font-size: 1.1em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 50%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #000;
  background: #8CD790;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  }
</style>

<script>
	
	function deleteAskView(post_no) {
		var result = confirm("삭제 하시겠습니까?");
		if(result){
			location.href = "deleteAskView?post_no=" + post_no;
		}
	}
</script>
</head>
<body>
<h1></h1>

<div align="center">
<table id=table2 border=1>

		<tr>
			<td>작성자ID</td>
			<td>${askBoard.writer_id }</td>
		</tr>
		<tr>
			<td>게시글제목</td>
			<td>${askBoard.post_title}</td>
		</tr>
		<tr>
			<td>게시글내용</td>
			<td><textarea rows="10" cols="50"> ${askBoard.post_content }</textarea></td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td>${askBoard.post_dt }</td>
		</tr>

		<tr>
			<td colspan=2 align=center>
				<input type="button" value="글 삭제" onClick="deleteAskView('${askBoard.post_no }')">
				<input type="button" value="답변" 
					onClick="location.href='replyAsk?post_no=${askBoard.post_no }' ">
			</td>
		</tr>
	</table>
	</div>
</body>
</html>