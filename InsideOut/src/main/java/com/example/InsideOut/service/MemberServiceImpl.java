package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.MemberDao;
import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;

	@Override
	public void stuInsert(StudentBean stu) {
		System.out.println("stuInsert");
		memberDao.stuInsert(stu);
	}

	@Override
	public void staInsert(StaffBean sta) {
		System.out.println("staInsert");
		memberDao.staInsert(sta);
	}

	@Override
	public void memInsert(MemberBean member) {
		System.out.println("memInsert");
		memberDao.memInsert(member);
	}

	@Override
	public void deptInsert(DeptBean dept) {
		System.out.println("deptInsert");
		memberDao.deptInsert(dept);
	}
	
	
}
