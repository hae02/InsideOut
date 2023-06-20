package com.example.InsideOut.service;

import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

public interface MemberService {
	
	void stuInsert(StudentBean stu);
	
	void staInsert(StaffBean sta);
	
	void memInsert(MemberBean member);
	
	void deptInsert(DeptBean dept);
	
	String getPasswd(String username);
	
	String getUsername(String username);
}
