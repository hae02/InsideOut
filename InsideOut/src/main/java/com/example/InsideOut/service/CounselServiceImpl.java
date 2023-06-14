package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.CounselDao;
import com.example.InsideOut.model.CounselBooking;
import com.example.InsideOut.model.CounselType;

@Service
public class CounselServiceImpl implements CounselService {
	
	@Autowired
	private CounselDao counselDao;
	
	@Override
	public CounselType getCounselType(String counsel_typeno) throws Exception {
		// TODO Auto-generated method stub
		CounselType counselType = counselDao.getCounselType(counsel_typeno);
		return counselType;
	}

	@Override
	public int insertCounsel(CounselBooking counselBooking) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.insertCounsel(counselBooking);
	}



}
