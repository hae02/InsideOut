package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.SurveyDao;
import com.example.InsideOut.model.SurveyAnswerBean;
import com.example.InsideOut.model.SurveyQuestionBean;
import com.example.InsideOut.model.SurveyResultBean;

@Service
public class SurveyService {
	
	@Autowired
	private SurveyDao dao;
	
	public List<SurveyQuestionBean> getQuestionList() {
		return dao.getQuestionList();
	}
	
	public void insertMulti(SurveyAnswerBean sab) {
		dao.insertMulti(sab);
	}
	
	public void insertMultiResult(SurveyResultBean srb) {
		dao.insertMultiResult(srb);
	}
	
	public void insertSubj() {
		dao.insertSubj();
	}
	
	public void insertSubjResult(SurveyResultBean srb) {
		dao.insertSubjResult(srb);
	}
	
	public void updateSurvey() {
		dao.updateSurvey();
	}
}
