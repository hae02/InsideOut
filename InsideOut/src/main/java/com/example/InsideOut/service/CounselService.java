package com.example.InsideOut.service;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselTypeBean;

public interface CounselService {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

//	public Staff getStaffList(String staff_no);

}
