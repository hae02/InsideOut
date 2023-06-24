package com.example.InsideOut.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StaffMypageModel;

@Mapper
public interface StaffMypageDao {

	public ArrayList<StaffMypageModel> staffBookingList(StaffMypageModel staff);

	public int confirmUpdate(StaffMypageModel smm);

	public int StaffListCount();

	public List<StaffMypageModel> staffBookingList(int start);

}