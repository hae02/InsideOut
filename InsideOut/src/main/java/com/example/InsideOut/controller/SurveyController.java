package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.InsideOut.model.SurveyAnswerBean;
import com.example.InsideOut.model.SurveyQuestionBean;
import com.example.InsideOut.model.SurveyResultBean;
import com.example.InsideOut.service.SurveyService;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyService service;

	// 만족도조사
	@RequestMapping("student/survey")
	public String survey(Model model) {
		List<SurveyQuestionBean> question = new ArrayList<SurveyQuestionBean>();
		question = service.getQuestionList();
		
		model.addAttribute("question", question);
		
		return "survey/survey_form";
	}
	
	// 만족도조사 제출
	@RequestMapping("student/surveySubmit")
	public String surveySubmit(@ModelAttribute SurveyAnswerBean sab, @ModelAttribute SurveyResultBean srb, 
								HttpServletRequest request, Model model) {
		int[] answer = new int[6];
		for (int i = 1; i <= 5; i++) {
			answer[i] = Integer.parseInt(request.getParameter("answer" + i));
		}
		String answer6 = request.getParameter("answer6");
		
		for (int i = 1; i <= 5; i++) {
			sab.setQuestion_no(i);
			sab.setAnswer_rating(answer[i]);
			service.insertMulti(sab);
			
			srb.setQuestion_no(i);
			srb.setAnswer_no(sab.getAnswer_no());
			
			service.insertMultiResult(srb);
		}
		
		service.insertSubj();
		
		srb.setAnswer_no(sab.getAnswer_no());
		srb.setAnswer_subj(answer6);
		service.insertSubjResult(srb);
		
		service.updateSurvey();
		
		return "survey/survey_form";
	}
}
