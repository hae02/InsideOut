package com.example.InsideOut.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StudentMypageModel;

@Mapper
public interface StudentMypageDao {

	public ArrayList<StudentMypageModel> studentBookingList(StudentMypageModel student);

	public int StudentListCount();

}
