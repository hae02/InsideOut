package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StaffBean;



@Mapper
public interface StaffDAO {
	
	StaffBean getStaffByMemNo(String mem_no);

	int updateStaff(StaffBean staff);


}
