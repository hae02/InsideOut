package com.example.InsideOut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselRecordBean;
import com.example.InsideOut.model.CounselTypeBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.service.CounselService;
import com.example.InsideOut.service.StaffService;


//@RequestMapping("api/v1/user/")
@Controller
public class CounselController {

	@Autowired
	private CounselService counselService;
	@Autowired
	private StaffService staffService;
	
	// 상담 종류 선택
	@RequestMapping("counselType")
	public String counselType() throws Exception {
		
		System.out.println("counselType");
		
		return "counsel/counselType";
	}
	
	// 상담사 및 일정 선택
	@RequestMapping("counselBooking")
	public String counselBooking(@RequestParam("counsel_typeno") String counsel_typeno,
								CounselBookingBean cBookingBean,
								StaffBean staff, Model model) throws Exception {
	   
		System.out.println("counselBooking");
	    System.out.println("counsel_typeno: " + counsel_typeno);

	    // 상담 타입 가져오기
	    CounselTypeBean counselTypeBean = counselService.getCounselType(counsel_typeno);
	    model.addAttribute("counselType", counselTypeBean);
	    System.out.println("counselType: " + counselTypeBean);

	    // 상담사 리스트 가져오기
	    model.addAttribute("staffList", staffService.getStaffList(staff));
		System.out.println("staff: "+staffService.getStaffList(staff));

	    return "counsel/counselBooking";
	}

	
	// 상담 내용 작성 폼
	@RequestMapping("counselContent")
	public String counselContent(@RequestParam("counsel_typeno") String counsel_typeno, 
								  @RequestParam("booking_dt") String booking_dt, 
								  @RequestParam("booking_time") String booking_time, 
								  @RequestParam("staff_no") String staff_no, 
								  Model model) throws Exception {
//								  StaffBean staff, Model model) throws Exception {
		
		System.out.println("booking_time: "+ booking_time);
		System.out.println("counsel_Content");
		System.out.println("booking_dt: "+booking_dt);
		
		StaffBean staff = staffService.getStaff(staff_no);
		System.out.println("staff: "+staff);
		
		String cd_nm = counselService.getBooking(booking_time);
		System.out.println("cd_nm: "+cd_nm);
		
		CounselTypeBean counselTypeBean = counselService.getCounselType(counsel_typeno);
		model.addAttribute("counselType", counselTypeBean); // 상담 타입
		model.addAttribute("booking_dt", booking_dt); // 예약 날짜
		model.addAttribute("booking_time", booking_time); // 예약 시간
		model.addAttribute("staff_no", staff_no); // 상담사
		model.addAttribute("staff", staff); // 상담사
		model.addAttribute("cd_nm", cd_nm); // 공통코드 시간
		
		return "counsel/counselContent";
	}
	
	// 상담 내용 작성 저장
	@RequestMapping("counselContentOk")
	public String counselContentOk(@ModelAttribute CounselBookingBean counselBookingBean, 
									Model model) throws Exception {
		
		int result = counselService.insertCounsel(counselBookingBean);
		if(result == 1) System.out.println("입력성공");
		model.addAttribute("result", result);
		
		return "counsel/counselType";
	}
	
	// 확정 시간 처리
	@ResponseBody
	@RequestMapping("getDt")
	public List<CounselBookingBean> getDt(String booking_dt, String staff_no) throws Exception {
		
		return counselService.getDt(staff_no, booking_dt);
	}
	
	// 상담기록 작성
	@RequestMapping("counselRecord")
	//public String counselRecode(String student_no, String booking_no, Model model) throws Exception {
	public String counselRecord(@ModelAttribute CounselBookingBean counselBookingBean, 
								Model model) throws Exception {
			
		//model.addAttribute("student_no", student_no);
		CounselBookingBean cBookingBean = counselService.getCounsel(counselBookingBean);
		model.addAttribute("cBookingBean", cBookingBean);
			
		return "counsel/counselRecord";
	}
	
	// 상담기록 저장
	@RequestMapping("counselRecordOk")
	public String counselRecordOk(@ModelAttribute CounselRecordBean counselRecordBean, 
								  Model model) throws Exception {
		
		int result = counselService.insertRecord(counselRecordBean);
		if(result == 1) System.out.println("입력성공");
		model.addAttribute("result", result);
		
		return "counsel/counselRecordList";
	}
	
	// 상담기록 리스트
	@RequestMapping("counselRecordList")
	public String counselRecordList(CounselRecordBean counselRecordBean, 
			Model model) throws Exception {
		
		model.addAttribute("recordList", counselService.getRecordList(counselRecordBean));
		
		return "counsel/counselRecordList";
	}
	
	// 상담기록 상세페이지
	@RequestMapping("counselRecordDetail")
	public String counselRecordDetail(String booking_no, int page, Model model) throws Exception {
		
		CounselRecordBean cRecordBean = counselService.getDetail(booking_no);
		model.addAttribute("record", cRecordBean);
		model.addAttribute("page", page);
		
		return "counsel/counselRecordDetail";
	}
	
	// 상담기록 수정
	@RequestMapping("counselRecordUpdate")
	public String counselRecordUpdate(String booking_no, int page, Model model) throws Exception {
		
		CounselRecordBean cRecordBean = counselService.getDetail(booking_no);
		model.addAttribute("record", cRecordBean);
		model.addAttribute("page", page);
		
		return "counsel/counselRecordUpdate";
	}
	
	// 상담기록 수정 저장
	@RequestMapping("counselRecordUpdateOk")
	public String counselRecordUpdateOk(@ModelAttribute CounselRecordBean counselRecordBean, 
									   Model model) throws Exception {
			
			int result = counselService.updateRecord(counselRecordBean);
			if(result == 1) System.out.println("입력성공");
			model.addAttribute("result", result);
			
			return "counsel/counselRecordList";
		}
		
		// 상담기록 삭제
		@RequestMapping("counselRecordDelete")
		public String counselRecordDelete(String booking_no, Model model) throws Exception {
			
			int result = counselService.recordDelete(booking_no);
			model.addAttribute("result", result);
			
			return "counsel/counselRecordList";
		}	
}
