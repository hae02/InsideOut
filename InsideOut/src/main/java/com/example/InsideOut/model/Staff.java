package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("staff") // DTO클래스 Alias 설정
public class Staff {
	
	private String staff_no; // 교직원번호
	private String staff_name; // 성명
	private String staff_tel; // 연락처
	private String staff_email; // 이메일
	private String mem_no; // 회원번호
	private String dept_cd; // 부서코드

}
