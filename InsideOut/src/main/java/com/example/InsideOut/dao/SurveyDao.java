package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.SurveyQuestionBean;

@Mapper
public interface SurveyDao {
	
	public List<SurveyQuestionBean> getQuestionList();
	
	public void insertMulti(int answer, int idx);
	
	public void insertSubj(String answer);
}
