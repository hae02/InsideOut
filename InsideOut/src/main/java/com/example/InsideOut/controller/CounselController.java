package com.example.InsideOut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CounselController {

	// 상담예약 종류 선택 페이지로 이동
	// 상담예약 일정 및 상담사 선택 페이지로 이동
	// 학생 정보 및 상담 내용 작성 폼
	// 전송 후 다시 상담 예약 첫 페이지로 이동
	
	@RequestMapping("counsel_Booking")
	public String counsel_Booking() {
		return "counsel/counsel_Booking";
	}
}
