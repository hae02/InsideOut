package com.example.InsideOut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.model.StaffMypageModel;
import com.example.InsideOut.service.StaffMypageService;

@Controller
@RequestMapping("/StaffCalendar")
public class StaffMypageController {
	@Autowired
	private StaffMypageService SMS;

	@GetMapping(params = "method=list")
	public String list() {
		return "Mypage/StaffCalendar";
	}

	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("list", SMS.staffBookingList());
		return "pageJsonReport";
	}

	@GetMapping("/StaffList")
	public String staffList(Model model) {
		System.out.println("controller in");
		List<StaffMypageModel> bookings = SMS.staffBookingList();
		System.out.println("bookings: " + bookings);
		model.addAttribute("bookings", bookings);
		return "Mypage/StaffList";
	}
	
	@GetMapping("/ConfirmList")
	public String confirmlist(Model model) {
		System.out.println("controller in");
		List<StaffMypageModel> bookings = SMS.staffBookingList();
		System.out.println("bookings: " + bookings);
		model.addAttribute("bookings", bookings);
		return "Mypage/ConfirmList";
	}
	
	@GetMapping("/confrim")
	public String confirm(StaffMypageModel smm) {
		
		int result = SMS.confirmUpdate(smm);
		if(result == 1) System.out.println("수정완료");
		
		return "redirect:StaffList";
	}
}

/*
 * @RequestMapping("/Mypage") public String staffcalendar(Model model) { //
 * 예약데이터조회
 * 
 * List<StaffMypageModel> bookings = SMS.staffBookingList();
 * System.out.println("list:" + bookings);
 * 
 * // 모델에 예약 데이터 추가 model.addAttribute("list", bookings);
 * 
 * return "Mypage/StaffCalendar"; }
 */
