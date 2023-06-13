package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.SurveyDao;
import com.example.InsideOut.model.SurveyQuestionBean;

@Service
public class SurveyService {
	
	@Autowired
	private SurveyDao dao;
	
	public List<SurveyQuestionBean> getQuestionList() {
		return dao.getQuestionList();
	}
	
	public void insertMulti(int answer, int idx) {
		dao.insertMulti(answer, idx);
	}
	
	public void insertSubj(String answer) {
		dao.insertSubj(answer);
	}
}
