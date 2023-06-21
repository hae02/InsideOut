package com.example.InsideOut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.model.StudentMypageModel;
import com.example.InsideOut.service.StudentMypageService;

@Controller
public class StudentMypageController {
	@Autowired
	private StudentMypageService StudentMS;

	@RequestMapping("/StudentList")
	public String showMypage(Model model) {
		//System.out.println("controller in");
		List<StudentMypageModel> bookings = StudentMS.studentBookingList();
		//System.out.println("bookings: " + bookings);

		model.addAttribute("bookings", bookings); // 모델에 속성 추가

		return "Mypage/StudentList";
	}

}
