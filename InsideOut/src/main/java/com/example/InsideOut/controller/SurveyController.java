package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.model.SurveyAnswerBean;
import com.example.InsideOut.model.SurveyBean;
import com.example.InsideOut.model.SurveyQuestionBean;
import com.example.InsideOut.model.SurveyResultBean;
import com.example.InsideOut.service.SurveyService;

@Controller
public class SurveyController {

	@Autowired
	private SurveyService service;

	// 만족도 조사 폼
	@RequestMapping("student/survey")
	public String survey(@RequestParam String booking_no, Model model) {
		List<SurveyQuestionBean> question = new ArrayList<SurveyQuestionBean>();
		question = service.getQuestionList();

		model.addAttribute("question", question);
		model.addAttribute("booking_no", booking_no);

		return "survey/survey_form";
	}

	// 만족도 조사 제출
	@RequestMapping("student/surveySubmit")
	public String surveySubmit(@ModelAttribute SurveyAnswerBean sab, @ModelAttribute SurveyResultBean srb,
			HttpServletRequest request, Model model) {
		int[] answer = new int[6];
		for (int i = 1; i <= 5; i++) {
			answer[i] = Integer.parseInt(request.getParameter("answer" + i));
		}
		String answer6 = request.getParameter("answer6");

		String booking_no = request.getParameter("booking_no");

		for (int i = 1; i <= 5; i++) {
			sab.setQuestion_no(i);
			sab.setAnswer_rating(answer[i]);
			service.insertMulti(sab);

			srb.setBooking_no(booking_no);
			srb.setQuestion_no(i);
			srb.setAnswer_no(sab.getAnswer_no());
			service.insertMultiResult(srb);
		}

		service.insertSubj();

		srb.setBooking_no(booking_no);
		srb.setAnswer_no(sab.getAnswer_no());
		srb.setAnswer_subj(answer6);
		service.insertSubjResult(srb);

		service.updateSurvey(booking_no);

		return "survey/survey_submitResult";
	}

	// 만족도 조사 리스트
	@RequestMapping("student/surveyList")
	public String surveyList(HttpServletRequest request, Model model) {
		String student_no = "1";

		int page = 1;
		int limit = 10;
		int listcount = 0;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		List<SurveyBean> surveyList = service.getSurveyList(student_no, page);
		listcount = service.getSurveyCount(student_no);

		// 총 페이지
		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * 10 + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage > maxpage)
			endpage = maxpage;
		
		int no = listcount - startpage + 1;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("surveyList", surveyList);
		model.addAttribute("no", no);

		return "survey/survey_list";
	}

	/*
	 * @GetMapping("getSurveyList")
	 * 
	 * @ResponseBody public List<SurveyBean> list() { String student_no = "1";
	 * List<SurveyBean> surveyList = service.getSurveyList(student_no);
	 * 
	 * System.out.println(surveyList);
	 * 
	 * return surveyList; }
	 */

}
