<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>QnA</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- 보기 편하게 CSS 추가해주었습니다. -->
<style>
* {
	text-align: center;
}

#formgroup {
	border: 1px solid;
	width: 70%;
	margin: 0 auto;
}

#editor {
	/* border: 1px solid; */
	width: 50%;
	margin: 0 auto;
}
/* !!여기!! 새로운 div태그 스타일 추가해줬습니다. */
#post_content {
	width: 50%;
	height: 100px;
	margin: 30px auto;
	border: 1px solid;
}
</style>

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<h1>QnA 입력</h1>
	<form method="post" action="board_write_ok" enctype="multipart/form-data">
	<input Type = hidden name= board_name value="notice"/>
	<input Type = hidden name= board_no value="500"/>
		<div class="formgroup">
			<label for="post_title">글제목: &nbsp;&nbsp;</label> <input
				name="post_title" id="post_title" size="60" class="input_box" />
		</div>
		<table border=0 width=400 align=center>
			<tr>
				<th>파일</th>
				<td><input type="file" name="nFile"></td>
			</tr>
		</table> 
		<br>
		<!-- TOAST UI Editor가 들어갈 div태그 -->
		<div id="editor" class="editor-container"></div>
		<!-- !!여기!! 에디터 내용을 받을 input 태그-->
		<textarea name="post_content" id="post_content" style="display: none;"></textarea>
		<!-- !!여기!! HTML 형식의 내용을 받을 input 태그-->
		<input type="hidden" name="htmlPost_content" id="htmlPost_content" />
		<!-- TOAST UI Editor CDN URL(JS) -->
		<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

		<!-- TOAST UI Editor 생성 JavaScript 코드 -->
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				const editor = new toastui.Editor({
					el : document.querySelector('#editor'),
					height : '400px',
					initialEditType : 'wysiwyg',
					previewStyle : 'vertical',
					language : 'ko-KR'
				});

				const form = document.querySelector('form');
				const postContent = document.querySelector('#post_content');
				const htmlPostContent = document.querySelector('#htmlPost_content');

				form.addEventListener('submit', function(event) {
					event.preventDefault();
					const markdownValue = editor.getMarkdown();
					const htmlValue = editor.getHTML();
					postContent.value = markdownValue;
					htmlPostContent.value = htmlValue; // HTML 형식의 내용을 추가
					form.submit();
				});

				// 에디터에서 입력되는 내용을 Markdown 형식으로 받아오기
				editor.on('change', function() {
					const markdownValue = editor.getMarkdown();
					console.log(markdownValue); // Markdown 형식의 입력 내용 출력
				});
				editor.removeToolbarItem('image');
			});
		</script>


		<div id="postwrite_menu">
			<input type="submit" value="등록" class="input_button" /> <input
				type="reset" value="취소" class="input_button"
				onclick="$('#post_title').focus();" />
		</div>
	</form>
</body>
</html>
