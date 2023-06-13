<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족도조사</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<form method="post" action="surveySubmit">
			<c:forEach var="question" items="${question}" end="4">
				<div>Q. ${question.question_name}</div>
				<div class="btn-group btn-group-lg" role="group"
					aria-label="Basic radio toggle button group">
					<c:forEach var="i" begin="1" end="5">
						<input type="radio" class="btn-check"
							name="answer${question.question_no}"
							id="answer${question.question_no}${i}" value="${i}"
							onClick="change(${question.question_no}, ${i})">
						<label class="btn btn-outline-primary"
							for="answer${question.question_no}${i}">${i}</label>
					</c:forEach>
				</div>
			</c:forEach>

			<c:forEach var="question" items="${question}" begin="5">
				<div>Q. ${question.question_name}</div>
				<textarea name="answer${question.question_no}" id="answer${question.question_no}"></textarea>
			</c:forEach>

			<div>
				<input type="submit" class="btn btn-outline-primary" value="제출">
			</div>
		</form>
	</div>

	<script>
		function change(questionNo, value) {
			var radioButtons = document.getElementsByName("answer" + questionNo);
            for (var i = 0; i < radioButtons.length; i++) {
                radioButtons[i].checked = false;
            }
            $('input[name="answer' + questionNo + '"][value="' + value + '"]').prop('checked', true);
		}
	</script>
</body>
</html>