package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffDAO;
import com.example.InsideOut.model.StaffBean;

@Service
public class StaffServiceImpl implements StaffService{
	
	@Autowired
    private StaffDAO staffDAO;

	@Override
	public StaffBean getStaffByMemNo(String username) {
		// TODO Auto-generated method stub
		return staffDAO.getStaffByMemNo(username);
	}

	@Override
	public int updateStaff(StaffBean staff) {
		// TODO Auto-generated method stub
		return staffDAO.updateStaff(staff);
	}
	
	

}
