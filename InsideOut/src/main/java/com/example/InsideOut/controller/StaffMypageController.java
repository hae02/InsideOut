package com.example.InsideOut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.StaffMypageModel;
import com.example.InsideOut.service.StaffMypageService;

@Controller
@RequestMapping("api/v1/staff")
public class StaffMypageController {
	@Autowired
	private StaffMypageService SMS;

	@RequestMapping("/StaffList")
	public String staffList(HttpServletRequest request,Authentication authentication, Model model) {
		System.out.println("controller in");
		
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();

		String staff_no = principalDetailis.getUser().getUsername();
		
		int page = 1;
		int limit = 10;

		// 한화면 출력할 항목 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 데이터 갯수
		int StaffListCount = SMS.StaffListCount();
		System.out.println("StaffListCount:" + StaffListCount);
		
		int start = (page - 1) * 10; // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		StaffMypageModel staff = new StaffMypageModel();
		staff.setStaff_No(staff_no);
		staff.setStart(start);
		
		List<StaffMypageModel> bookings = SMS.staffBookingList(staff);
		System.out.println("bookings:" + bookings);

		// 총 페이지
		int maxpage = StaffListCount / limit + ((StaffListCount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("StaffListCount", StaffListCount);
		model.addAttribute("bookings", bookings);
		model.addAttribute("staff_no", staff_no);
		return "Mypage/StaffList";
	}
	
	@GetMapping("/ConfirmList")
	public String confirmlist(HttpServletRequest request,Authentication authentication, Model model) {
		System.out.println("controller in");
		
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
		String staff_no = principalDetailis.getUser().getUsername();
		
		int page = 1;
		int limit = 10;

		// 한화면 출력할 항목 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 데이터 갯수
		int StaffListCount = SMS.StaffListCount();
		System.out.println("StaffListCount:" + StaffListCount);
		
		int start = (page - 1) * 10; // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		StaffMypageModel staff = new StaffMypageModel();
		staff.setStaff_No(staff_no);
		staff.setStart(start);
		
		List<StaffMypageModel> bookings = SMS.staffBookingList(staff);
		System.out.println("bookings:" + bookings);

		// 총 페이지
		int maxpage = StaffListCount / limit + ((StaffListCount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("StaffListCount", StaffListCount);
		model.addAttribute("bookings", bookings);
		model.addAttribute("staff_no", staff_no);
		return "Mypage/ConfirmList";
	}
	
	@GetMapping("/confrim")
	public String confirm(StaffMypageModel smm) {
		
		int result = SMS.confirmUpdate(smm);
		if(result == 1) System.out.println("수정완료");
		
		return "redirect:StaffList";
	}
}

