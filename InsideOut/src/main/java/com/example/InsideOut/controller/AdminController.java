package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.service.AdminService;
import com.example.InsideOut.service.PagingPgm;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@RequestMapping("/main")
	public String adminPage() {
		return "admin/adminMain";
	}

	@RequestMapping("/adminMessage")
	public String adminMessagePage() {
		return "admin/adminMessage";
	}

	// 회원 목록 조회
	@GetMapping("/adminMember")
	public String getAllMembers(HttpServletRequest request, Model model) {
		List<MemberBean> memberlist = new ArrayList<MemberBean>();
		
		int pageNum = 1;
		int limit = 10;
		int listcount = 0;
		String keyword = null;
		
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		if (request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}
		
		if (keyword == null) {
			listcount = service.getTotal();
			memberlist = service.getAllMembers(pageNum);			
		} else {
			listcount = service.getSearchTotal(keyword);
			memberlist = service.getSearchMembers(keyword);
		}
		
		// 총 페이지
        int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

        int startpage = ((pageNum - 1) / 10) * 10 + 1; 		// 1, 11, 21..
        int endpage = startpage + 10 - 1; 			   		// 10, 20, 30..

        if (endpage > maxpage)
            endpage = maxpage;

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("listcount", listcount);
        model.addAttribute("memberlist", memberlist);
        model.addAttribute("keyword", keyword);

		return "admin/adminMember";
	}

	// 수정 만드려다 (안됨)
	@RequestMapping("updateMember")
	public String userupdate(int mem_no, Model model) {
		System.out.println("mem_no:" + mem_no);

		MemberBean member = service.updateMembers(mem_no);
		System.out.println("member:" + member);

		model.addAttribute("member", member);

		return "admin/updateForm";
	}

	// 삭제
	@RequestMapping("deleteMember")
	public String userdelete(int mem_no) {
		System.out.println("mem_no:" + mem_no);

		service.deleteMembers(mem_no);

		return "redirect:adminMember";
	}

	//
//	@GetMapping("search")
//	public String searchMembers(@RequestParam("keyword") String keyword, Model model) {
//		List<MemberBean> searchResults = service.searchMembers(keyword);
//		model.addAttribute("searchResults", searchResults);
//		return "admin/adminMember";
//	}

	// 리스트 페이징
//		@RequestMapping("memberList")
//		public String memberList(HttpServletRequest request, Model model) {
//			String student_no = "1";
//
//			int page = 1;
//			int limit = 10;
//			int listcount = 0;
//
//			if (request.getParameter("page") != null) {
//				page = Integer.parseInt(request.getParameter("page"));
//			}
//
//			List<MemberBean> surveyList = service.getMemberList(student_no, page);
//			listcount = service.getMemberCount(student_no);
//
//			// 총 페이지
//			int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);
//
//			int startpage = ((page - 1) / 10) * 10 + 1; // 1, 11, 21..
//			int endpage = startpage + 10 - 1; // 10, 20, 30..
//
//			if (endpage > maxpage)
//				endpage = maxpage;
//			
//			int no = listcount - startpage + 1;
//
//			model.addAttribute("page", page);
//			model.addAttribute("startpage", startpage);
//			model.addAttribute("endpage", endpage);
//			model.addAttribute("maxpage", maxpage);
//			model.addAttribute("listcount", listcount);
//			model.addAttribute("surveyList", surveyList);
//			model.addAttribute("no", no);
//			
//
//
//			return "adminMember";
//		}

	// 리스트 + 검색
//	@RequestMapping("searchMember")
//	public String study_mozip(String pageNum, MemberBean memberBean, Model model) {
//
//		final int rowPerPage = 10; // 한 페이지 당 출력할 개수
//
//		if (pageNum == null || pageNum.equals("")) {
//			pageNum = "1";
//		}
//		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
//
//		int total = service.getTotal(memberBean); // 총 개수 구하기
//		System.out.println("total:" + total);
//
//		int startRow = (currentPage - 1) * rowPerPage + 1;
//		int endRow = startRow + rowPerPage - 1;
//
//		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
//		memberBean.setStartRow(startRow);
//		memberBean.setEndRow(endRow);
//
//		int no = total - startRow + 1; // 화면 출력 번호
//		List<MemberBean> memberlist = service.list(memberBean);
//		System.out.println("memberlist:" + memberlist); // 확인차 출력
//
//		model.addAttribute("pp", pp);
//		model.addAttribute("no", no); // num
//		model.addAttribute("memberlist", memberlist); // list
//
//		// 검색 기능
//		model.addAttribute("search", memberBean.getSearch());
//		model.addAttribute("keyword", memberBean.getKeyword());
//
//		return "admin/adminMember";
//	}

}
