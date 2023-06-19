package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselTypeBean;

@Mapper
public interface CounselDao {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public List<CounselBookingBean> getDt(String staff_no, String booking_dt) throws Exception;

}
