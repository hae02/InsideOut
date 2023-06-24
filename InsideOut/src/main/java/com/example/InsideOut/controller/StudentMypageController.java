package com.example.InsideOut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.StudentMypageModel;
import com.example.InsideOut.service.StudentMypageService;

@Controller
@RequestMapping("api/v1/student")
public class StudentMypageController {
	@Autowired
	private StudentMypageService StudentMS;

	@RequestMapping("/StudentList")
	public String showMypage(HttpServletRequest request, Authentication authentication, Model model) {
		// System.out.println("controller in");
		PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();

		String student_no = principalDetailis.getUser().getUsername();

		int page = 1;
		int limit = 10;

		// 한화면 출력할 항목 수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 데이터 갯수
		int StudentListCount = StudentMS.StudentListCount();
		System.out.println("StudentListCount:" + StudentListCount);

		int start = (page - 1) * 10; // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		StudentMypageModel student = new StudentMypageModel();
		student.setStudent_No(student_no);
		student.setStart(start);

		List<StudentMypageModel> bookings = StudentMS.studentBookingList(student);
		System.out.println("bookings:" + bookings);

		// 총 페이지
		int maxpage = StudentListCount / limit + ((StudentListCount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("StudentListCount", StudentListCount);
		model.addAttribute("bookings", bookings);
		model.addAttribute("student_no", student_no);
		return "Mypage/StudentList";
	}

}
