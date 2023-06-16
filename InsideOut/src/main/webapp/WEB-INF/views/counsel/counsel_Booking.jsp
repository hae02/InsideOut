<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<style>
.container {
  	justify-content: center;
  	align-items: center;
}
.calendar {
	width: 50%;
}
.calendar th {
	text-align: center;
	padding: 15px;
}
.calendar td {
	cursor: pointer;
	text-align: center;
	padding: 30px;
	border: 1px solid #ccc;
}
.calendar td.weekend {
  background-color: #F2F2F2;
  color: red;
}
.calendar td.weekend:last-child {
  color: #0000ff; /* 토요일 텍스트 색상 설정 */
}
.calendar table {
	width: 100%;
}
.calendar .selected {
	background-color: #E0F5DF;
}
.calendar .prev, .calendar .next {
	cursor: pointer;
}
.calendar-container {
    display: flex;
    justify-content: space-between;
}

.btn {
	display: inline-block;
}
.staff .btn.active {
    background-color: #E0F5DF;
    color: #fff;
}
.staff .btn[value:"checked"] {
    background-color: #E0F5DF;
    color: #fff;
}



.booking_time td {
	text-align: center;
	padding: 8px;
	border: 1px solid #ccc;
}

.booking_time th {
	text-align: center;
	padding: 15px;
	width: 500px;
}

.staff .btn {
	height: 150px;
	width: 400px;
	margin-right: 30px;
	margin-top: 20px;
	text-align: left;
	padding: 1.375rem 1rem !important; /* 컨텐트 세로 가운데 정렬 */
	border: 1px solid #ccc;
} 

.day th:first-child {
  color: #ff0000; /* 일요일 텍스트 색상 설정 */
}

.day th:last-child {
  color: #0000ff; /* 토요일 텍스트 색상 설정 */
}

.btn {
	display: inline-block;
}
</style>

<body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<div class="container">
		<form method="post" action="counsel_Content">
			<input type="hidden" id="counsel_typeno" name="counsel_typeno" value="${counselType.counsel_typeno}"> 
			<input type="hidden" id="booking_dt" name="booking_dt" value="">
			
			<h1>${counselType.counsel_typename}</h1>
			<p>${counselType.counsel_typedetail}</p>
			<br>
			<hr>
			<br><br>
			<h3>상담사</h3>
			
			<!-- 교직원 프로필 -->
			<div class="btn-group-toggle staff" data-toggle="buttons">
				<c:forEach items="${staffList}" var="s">
					<label class="btn" for="staff_no">
						<div class="row">
							<div class="col">
								<img src="images/6735382.png" width="100px">
							</div>
							<div class="col-8">
								<input class="btn" type="radio" id="staff_no" name="staff_no" value="${s.staff_no}">
								<h5 class="card-title text-dark" >${s.staff_name}</h5>
								<p class="card-text text-dark">${s.staff_tel}</p>
								<p class="card-text text-dark">${s.staff_email}</p>
							</div>
						</div>
					</label>
				</c:forEach>
			</div>
			<br><br><br><br>
			
			<!-- Calendar -->
			<h3>일정선택</h3><br>
			<div class="calendar-container">
				<div class="calendar col-9">
					<table>
						<thead>
							<tr>
								<!-- <th class="prev">&lt;</th> -->
								<th class="prev"><img src="images/caret-left-fill.svg" width="30px"></th>
								<th colspan="5" class="month-year"></th>
								<th class="next"><img src="images/caret-right-fill.svg" width="30px"></th>
<!-- 								<th class="next">&gt;</th> -->
							</tr>
							<tr class="day">
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				
				<!-- BOOKING_TIME -->
				<div class="booking_time">
					<table>
						<tr>
						<th colspan="2">&nbsp;</th>
						</tr>
						<tr>
						<th>선택</th>
						<th>시간</th>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0100"></td>
						<td>9:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0200"></td>
						<td>10:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0300"></td>
						<td>11:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0400"></td>
						<td>12:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0500"></td>
						<td>13:00</td>
						</tr>	
						<tr>	
						<td><input type="radio" id="booking_time" name="booking_time" value="0600"></td>
						<td>14:00</td>
						</tr>
						<tr>
							<td><input type="radio" id="booking_time" name="booking_time" value="0700"></td>
							<td>15:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0800"></td>
						<td>16:00</td>
						</tr>
						<tr>
						<td><input type="radio" id="booking_time" name="booking_time" value="0900"></td>
						<td>17:00</td>
						</tr>
					</table>
					</div>
	</div>

	<script>
	var booking_dt = ''; // 예약 날짜를 담을 변수

	// 달력 업데이트 함수
	function updateCalendar(year, month) {
	  var calendarBody = document.querySelector('.calendar tbody');
	  calendarBody.innerHTML = '';

	  var currentDate = new Date(year, month);
	  var currentYear = currentDate.getFullYear();
	  var currentMonth = currentDate.getMonth();
	  var firstDay = new Date(currentYear, currentMonth, 1).getDay();
	  var lastDay = new Date(currentYear, currentMonth + 1, 0).getDate();

	  var date = 1;
	  for (var i = 0; i < 6; i++) {
	    var row = document.createElement('tr');

	    for (var j = 0; j < 7; j++) {
	      var cell = document.createElement('td');
	      if (i === 0 && j < firstDay) {
	        // 빈 셀 추가
	      } else if (date > lastDay) {
	        // 날짜 범위를 초과한 경우 종료
	        break;
	      } else {
	        cell.textContent = date;

	        // 주말인 경우 클래스 추가하여 스타일링
	        if (isWeekend(currentYear, currentMonth, date)) {
	          cell.classList.add('weekend');
	        } else {
	          // 선택 가능한 날짜에 클릭 이벤트 리스너 추가
	          cell.addEventListener('click', selectDate);
	        }

	        date++;
	      }

	      row.appendChild(cell);
	    }

	    calendarBody.appendChild(row);
	  }

	  var monthYearLabel = document.querySelector('.calendar .month-year');
	  monthYearLabel.textContent = getFormattedMonthYear(currentMonth, currentYear);
	}

	// 주말인지 확인하는 함수
	function isWeekend(year, month, date) {
	  var day = new Date(year, month, date).getDay();
	  return day === 0 || day === 6; // 일요일(0)이나 토요일(6)인 경우 주말로 판단
	}

	// 선택된 날짜 처리 함수
	function selectDate() {
	  var calendarCells = document.querySelectorAll('.calendar td');
	  calendarCells.forEach(function(cell) {
	    cell.classList.remove('selected');
	  });
	  this.classList.add('selected');
	  var selectedDate = this.textContent;
	  var selectedYearMonth = currentYear + (currentMonth + 1).toString().padStart(2, '0');
	  var selectedDateFull = selectedYearMonth + selectedDate.toString().padStart(2, '0');

	  booking_dt = selectedDateFull; // 선택된 날짜를 booking_dt 변수에 할당
	  console.log('booking_dt:', booking_dt);
	  /* document.write(booking_dt); // 웹페이지에 변수 값 출력 */

	  $("#booking_dt").val(booking_dt); // booking_dt 변수에 저장
	}

	// 월과 연도를 포맷팅하는 함수
	function getFormattedMonthYear(month, year) {
	  var monthNames = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	  return monthNames[month] + ' ' + year;
	}

	var currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var currentMonth = currentDate.getMonth();

	updateCalendar(currentYear, currentMonth);

	var prevButton = document.querySelector('.calendar .prev');
	var nextButton = document.querySelector('.calendar .next');

	prevButton.addEventListener('click', function() {
	  currentMonth--;
	  if (currentMonth < 0) {
	    currentMonth = 11;
	    currentYear--;
	  }
	  updateCalendar(currentYear, currentMonth);
	});

	nextButton.addEventListener('click', function() {
	  currentMonth++;
	  if (currentMonth > 11) {
	    currentMonth = 0;
	    currentYear++;
	  }
	  updateCalendar(currentYear, currentMonth);
	});
		</script>

		<br><br><br>
		<!-- <button type="button">이전</button> -->
		<button type="submit" class="btn btn-success">다음</button>
	</form>
</div>
</body>
</html>
