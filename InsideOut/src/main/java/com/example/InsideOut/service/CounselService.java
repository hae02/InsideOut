package com.example.InsideOut.service;

import java.util.List;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselTypeBean;

public interface CounselService {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public List<CounselBookingBean> getDt(String staff_no, String confirm_dt) throws Exception;

	public String getBooking(String booking_time) throws Exception;

}
