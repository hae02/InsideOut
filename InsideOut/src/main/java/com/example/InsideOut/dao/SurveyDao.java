package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.SurveyAnswerBean;
import com.example.InsideOut.model.SurveyQuestionBean;
import com.example.InsideOut.model.SurveyResultBean;

@Mapper
public interface SurveyDao {
	
	public List<SurveyQuestionBean> getQuestionList();
	
	public void insertMulti(SurveyAnswerBean sab);
	
	public void insertMultiResult(SurveyResultBean srb);
	
	public void insertSubj();
	
	public void insertSubjResult(SurveyResultBean srb);
	
	public void updateSurvey();
}
