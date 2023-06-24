package com.example.InsideOut.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffMypageDao;
import com.example.InsideOut.model.StaffMypageModel;

@Service
public class StaffMypageService {
	
	@Autowired
	private  StaffMypageDao staffMypageDao;

	public ArrayList<StaffMypageModel> staffBookingList(StaffMypageModel staff){
		return staffMypageDao.staffBookingList(staff);
	}

	public int confirmUpdate(StaffMypageModel smm) {
		// TODO Auto-generated method stub
		return staffMypageDao.confirmUpdate(smm);
	}

	public int StaffListCount() {
		return staffMypageDao.StaffListCount();
	}

	public List<StaffMypageModel> staffBookingList(int start) {
		return staffMypageDao.staffBookingList(start);
	}
}
