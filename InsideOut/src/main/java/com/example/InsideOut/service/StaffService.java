package com.example.InsideOut.service;

import java.util.List;

import com.example.InsideOut.model.StaffBean;

public interface StaffService {

	public List<StaffBean> getStaffList(StaffBean staff);

	public StaffBean getStaff(int staff_no);

}
