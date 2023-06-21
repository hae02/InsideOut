package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.MemberDao;
import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;

	@Override
	public void stuInsert(StudentBean stu) {
		memberDao.stuInsert(stu);
	}

	@Override
	public void staInsert(StaffBean sta) {
		memberDao.staInsert(sta);
	}

	@Override
	public void memInsert(MemberBean member) {
		memberDao.memInsert(member);
	}

	@Override
	public void deptInsert(DeptBean dept) {
		memberDao.deptInsert(dept);
	}

	@Override
	public String getPasswd(String username) {
		return memberDao.getPasswd(username);
	}

	@Override
	public String getUsername(String username) {
		return memberDao.getUsername(username);
	}
	
	
}
