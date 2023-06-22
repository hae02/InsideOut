package com.example.InsideOut.service;

import com.example.InsideOut.model.StaffBean;

public interface StaffService {

	StaffBean getStaffByMemNo(String username);

	int updateStaff(StaffBean staff);
	
	
}
