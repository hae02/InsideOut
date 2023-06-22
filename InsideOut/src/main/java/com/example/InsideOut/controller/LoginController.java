package com.example.InsideOut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.service.MemberServiceImpl;

@Controller
public class LoginController {
	
	@Autowired
	private MemberServiceImpl memberService; 
	
    @GetMapping("/select/role")
    public String loginsuccess(Authentication authentication) {
       PrincipalDetails principalDetailis = (PrincipalDetails) authentication.getPrincipal();
       // username = 학번/교직원번호
       String username = principalDetailis.getUser().getUsername();
       
       String role = memberService.getUserRole(username);
       
       if(role.equals("ROLE_STUDENT")) {
    	   return "redirect:/api/v1/student/StudentList";
       }else if(role.equals("ROLE_STAFF")) {
    	   return "redirect:/api/v1/staff/StaffList";
       }else if(role.equals("ROLE_ADMIN")) {
    	   return "redirect:/api/v1/admin/adminMain";
       }else {
    	   return "redirect:/logout";
       }
    }

}
