package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.CounselDao;
import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselTypeBean;

@Service
public class CounselServiceImpl implements CounselService {
	
	@Autowired
	private CounselDao counselDao;
	
	@Override
	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception {
		// TODO Auto-generated method stub
		CounselTypeBean counselTypeBean = counselDao.getCounselType(counsel_typeno);
		return counselTypeBean;
	}

	@Override
	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.insertCounsel(counselBookingBean);
	}

	@Override
	public List<CounselBookingBean> getDt(String staff_no, String booking_dt) throws Exception {		
		return counselDao.getDt(staff_no, booking_dt);
	}

}
