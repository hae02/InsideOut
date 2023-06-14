package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.CounselBooking;
import com.example.InsideOut.model.CounselType;

@Mapper
public interface CounselDao {

	public CounselType getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBooking counselBooking) throws Exception;

}
