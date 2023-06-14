package com.example.InsideOut.service;

import com.example.InsideOut.model.CounselBooking;
import com.example.InsideOut.model.CounselType;

public interface CounselService {

	public CounselType getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBooking counselBooking) throws Exception;

//	public Staff getStaffList(String staff_no);

}
