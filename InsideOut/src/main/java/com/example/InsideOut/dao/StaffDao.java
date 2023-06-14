package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.Staff;

@Mapper
public interface StaffDao {
	
	public List<Staff> getStaffList(Staff staff);

}
