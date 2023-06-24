package com.example.InsideOut.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StudentMypageDao;
import com.example.InsideOut.model.StudentMypageModel;

@Service
public class StudentMypageService {

	@Autowired
	private StudentMypageDao studentMypageDao;

	public ArrayList<StudentMypageModel> studentBookingList(StudentMypageModel student) {

		return studentMypageDao.studentBookingList(student);
	}

	public int StudentListCount() {
		return studentMypageDao.StudentListCount();
	}
}
