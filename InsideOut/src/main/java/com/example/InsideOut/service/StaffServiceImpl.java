package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffDao;
import com.example.InsideOut.model.Staff;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffDao staffDao;

	@Override
	public List<Staff> getStaffList(Staff staff) {
	    return staffDao.getStaffList(staff);
	}


}
