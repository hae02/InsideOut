package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.InsideOut.model.CounselBooking;
import com.example.InsideOut.model.CounselType;
import com.example.InsideOut.model.Staff;
import com.example.InsideOut.service.CounselService;
import com.example.InsideOut.service.StaffService;

@Controller
public class CounselController {

	@Autowired
	private CounselService counselService;
	@Autowired
	private StaffService staffService;
	
	// 상담 종류 선택
	@RequestMapping("counsel_Type")
	public String counsel_Type() throws Exception {
		
		System.out.println("counsel_Type");
		
		return "counsel/counsel_Type";
	}
	
	// 상담사 및 일정 선택
	@RequestMapping("counsel_Booking")
	public String counselBooking(@RequestParam("counsel_typeno") String counsel_typeno,
								Staff staff, Model model) throws Exception {
	    System.out.println("counselBooking");
	    System.out.println("counsel_typeno: " + counsel_typeno);

	    // 상담 타입 가져오기
	    CounselType counselType = counselService.getCounselType(counsel_typeno);
	    model.addAttribute("counselType", counselType);
	    System.out.println("counselType: " + counselType);

	    // 상담사 리스트 가져오기
	    model.addAttribute("staffList", staffService.getStaffList(staff));
	    
	    // 상담사 일정 뿌려주기
	    
	    
		System.out.println("staff: "+staffService.getStaffList(staff));

	    return "counsel/counsel_Booking";
	}

	
	// 상담 내용 작성 폼
	@RequestMapping("counsel_Content")
	public String counsel_Content(@RequestParam("counsel_typeno") String counsel_typeno, 
								  @RequestParam("booking_dt") String booking_dt, 
								  @RequestParam("booking_time") String booking_time, 
								  @RequestParam("staff_no") int staff_no, Model model) throws Exception {
		
		System.out.println("counsel_Content");
		System.out.println("booking_dt: "+booking_dt);
		
		Staff staff = staffService.getStaff(staff_no);
		System.out.println("staff: "+staff);
		
		CounselType counselType = counselService.getCounselType(counsel_typeno);
		model.addAttribute("counselType", counselType); // 상담 타입
		model.addAttribute("booking_dt", booking_dt); // 예약 날짜
		model.addAttribute("booking_time", booking_time); // 예약 시간
		model.addAttribute("staff_no", staff_no); // 상담사
		model.addAttribute("staff", staff); // 상담사
		
		
		return "counsel/counsel_Content";
	}
	
	// 상담 내용 작성 저장
	@RequestMapping("counsel_ContentOk")
	public String counsel_ContentOk(@ModelAttribute CounselBooking counselBooking, Model model) throws Exception {
		
		
		int result = counselService.insertCounsel(counselBooking);
		if(result == 1) System.out.println("입력성공");
		model.addAttribute("result", result);
		
		return "counsel/counsel_Type";
	}
}
