package com.example.InsideOut.service;

import java.util.List;

import com.example.InsideOut.model.Staff;

public interface StaffService {

	public List<Staff> getStaffList(Staff staff);

	public Staff getStaff(int staff_no);

}
