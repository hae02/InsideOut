package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselTypeBean;

@Mapper
public interface CounselDao {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

}
