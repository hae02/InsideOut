package com.example.InsideOut.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.InsideOut.auth.PrincipalDetails;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.NoteBean;
import com.example.InsideOut.service.MemberService;
import com.example.InsideOut.service.NoteService;

//@RequestMapping("/mypage")
@Controller
 @RequestMapping("api/vi/user") 
public class NoteController {

	@Autowired
	private NoteService noteService;

			

	// 쪽지 작성창으로
//	 @GetMapping("/writenote") 
//	 @RequestMapping("/writenote") 
//	public String writenote(@RequestParam("recv_id") String recv_id, Model model) {
	/*
	 * public String writenote(MemberBean member,
	 * 
	 * @RequestParam(value = "recv_id", defaultValue = "test") String recv_id,
	 * HttpSession session, Model model) { session.setAttribute("recv_id",
	 * member.getUsername()); session.setAttribute("send_id", member.getUsername());
	 * 
	 * 
	 * System.out.println("writenote in");
	 * 
	 * // session.setAttribute("send_id", "sender"); model.addAttribute("send_id",
	 * member.getUsername()); model.addAttribute("recv_id", member.getUsername());
	 * 
	 * return "note/writenote"; }
	 */
	 
	 
	@GetMapping("/writenote")
	public String writenote(Authentication authentication, Model model) {
	    if (authentication != null) {
	        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();

	        String username = principalDetails.getUser().getUsername();
	        return "note/writenote";
	        
	    } else {
	        throw new NullPointerException("authentication is null");
	    }
	}


	@PostMapping("/sendnote")
	public String sendnote(Authentication authentication, @ModelAttribute NoteBean note, Model model) {
	    if (authentication != null) {
	    	
	        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	        String username = principalDetails.getUser().getUsername();
	        
	        note.setSend_id(username);
	        
	        int result1 = noteService.sendNote(note);
	        System.out.println("쪽지1 보내기 성공");
	        
	        int note_no = noteService.getNoteno();
	        System.out.println("note_no:" + note_no);
	        note.setNote_no(note_no);
	        
	        model.addAttribute("note", note);
	        
//	        int result2 = noteService.usersendNote(note); // user_note테이블에 쪽지 저장
//			if (result2 == 1)
//				System.out.println("쪽지2 보내기 성공");

			model.addAttribute("recv_id", note.getRecv_id());
			model.addAttribute("result", result1);
	        
	        return "note/noteresult";
	    } else {
	        throw new NullPointerException("authentication is null");
	    }
	}

	 
	 

	// 쪽지 전송
//	 @PostMapping("/sendnote") 
	/*
	 * @RequestMapping("/sendnote") public String sendnote(HttpSession
	 * session, @ModelAttribute NoteBean note, MemberBean member, Model model) {
	 * 
	 * session.setAttribute("recv_id", member.getUsername());
	 * session.setAttribute("send_id", member.getUsername());
	 * 
	 * model.addAttribute("send_id", member.getUsername());
	 * model.addAttribute("recv_id", member.getUsername());
	 * 
	 * 
	 * System.out.println("전송 진입:" + member.getUsername());
	 * 
	 * int result1 = noteService.sendNote(note); // note테이블에 쪽지 저장 if (result1 == 1)
	 * System.out.println("쪽지1 보내기 성공");
	 * 
	 * // note테이블의 note_no의 가장 마지막 번호 구하기 int note_no = noteService.getNoteno();
	 * System.out.println("note_no:" + note_no);
	 * 
	 * note.setNote_no(note_no);
	 * 
	 * 
	 * 
	 * int result2 = noteService.usersendNote(note); // user_note테이블에 쪽지 저장 if
	 * (result2 == 1) System.out.println("쪽지2 보내기 성공");
	 * 
	 * model.addAttribute("recv_id", note.getRecv_id());
	 * model.addAttribute("result", result1);
	 * 
	 * return "note/noteresult"; }
	 */

	// 쪽지닫음
	@GetMapping("/noteclose")
	public String noteclose() {
		return "note/noteclose";
	}

	// 받은 쪽지함
//	 @GetMapping("/recvlist") 
	 @RequestMapping("/recvlist") 
	public String recvlist(Authentication authentication,
			@RequestParam("recv_id") String recv_id, 
			/*@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {*/
			HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		 PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     recv_id = principalDetails.getUser().getUsername();
		 
//		 String recv_id = (String) session.getAttribute("recv_id");
//		 
//		System.out.println("recv_id:" + recv_id);
//
//		if (recv_id == null || recv_id.equals("")) {
//			recv_id = (String) session.getAttribute("sender");
//			System.out.println("recv_id:" + recv_id);
//		}

		int startRow = (page - 1) * 10;
		int endRow = 10;

		NoteBean noteParam = new NoteBean();
		noteParam.setRecv_id(recv_id);
		noteParam.setStartRow(startRow);
		noteParam.setEndRow(endRow);

		int cnt = noteService.getReceivedCount(recv_id);
		System.out.println("받은 데이터 cnt:" + cnt);
		List<NoteBean> receivedNotes = noteService.getReceivedList(noteParam);
		System.out.println("receivedNotes:" + receivedNotes);

		int pageCount = cnt / 10 + ((cnt % 10 == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		model.addAttribute("cnt", cnt);
		model.addAttribute("noteList", receivedNotes);
//		model.addAttribute("send_id", send_id);
		model.addAttribute("recv_id", recv_id);

		return "note/recvlist";
	}

	// 보낸 쪽지함
	/* @GetMapping("/sendlist") */
	 @RequestMapping("/sendlist") 
	public String sendlist(/*@RequestParam("send_id") String send_id,
			@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {*/
			Authentication authentication,
			HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		 PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     String send_id = principalDetails.getUser().getUsername();
		 System.out.println("username:"+ send_id);
		 
//		String send_id = (String) session.getAttribute("send_id");
//			
//		System.out.println("sendlist controller in");
//		System.out.println("send_id0:" + send_id);
//
//		if (send_id == null || send_id.equals("")) {
//			send_id = (String) session.getAttribute("sender");
//			System.out.println("send_id1:" + send_id);
//		}
		
		int startRow = (page - 1) * 10;
		int endRow = 10;

		NoteBean noteParam = new NoteBean();
		noteParam.setSend_id(send_id);
		noteParam.setStartRow(startRow);
		noteParam.setEndRow(endRow);

		int cnt = noteService.getSentCount(send_id);
		System.out.println("보낸메세지 cnt:" + cnt);
		List<NoteBean> sentNotes = noteService.getSentList(noteParam);
		System.out.println("보낸메세지 sentNotes:" + sentNotes);

		int pageCount = cnt / 10 + ((cnt % 10 == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		model.addAttribute("cnt", cnt);
		model.addAttribute("noteList", sentNotes);
		model.addAttribute("send_id", send_id);

		return "note/sendlist";
	}

	// 쪽지 답장 작성 폼
	/* @GetMapping("notereplyform") */
	 @RequestMapping("/notereplyform") 
	public String notereplyform(@RequestParam String send_id, @RequestParam String recv_id,
			NoteBean note, Model model,
			HttpSession session) {
		 
	//  session.setAttribute("send_id", "username"); 
	//  session.setAttribute("recv_id", "username"); 
		 
		 session.setAttribute("send_id", send_id);
		 session.setAttribute("recv_id", recv_id);
	
		 model.addAttribute("send_id", send_id);
		 model.addAttribute("recv_id", recv_id);

		return "note/notereplyform";
	}

	// 쪽지 답장 작성
	/* @PostMapping("notereply") */
	 @RequestMapping("/notereply") 
	public String notereply(@RequestParam String send_id, @RequestParam String recv_id, HttpSession session,
			@ModelAttribute("note") NoteBean note, Model model) {

		System.out.println("sender:" + note.getSend_id());
		System.out.println("receiver:" + note.getRecv_id());

		int result = noteService.insertReply(note);
		System.out.println("result:" + result);

		model.addAttribute("send_id", send_id);
		model.addAttribute("recv_id", recv_id);
		model.addAttribute("result", result);

		return "note/notereply";
	}

	// 보낸 쪽지 상세 페이지(안됨) 
	/* @GetMapping("notesendview") */
	 @RequestMapping("/notesendview") 
	/* public String notesendview(int cnt, Model model) */
	public String notesendview(Authentication authentication,@RequestParam("send_id") String send_id, @RequestParam("cnt") int cnt,
			@RequestParam(defaultValue = "1") int page, Model model) {
		 
		 PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     send_id = principalDetails.getUser().getUsername();

		NoteBean note = noteService.getSentNoteDetail(cnt);
		model.addAttribute("note", note);
		  model.addAttribute("send_id", send_id); // send_id 값을 모델에 추가
		  model.addAttribute("message", note.getMessage()); // message 값을 모델에 추가
		// model.addAttribute("note", cnt)

		return "note/notesendview";
	}

	// 받은 쪽지 상세 페이지
	/* @GetMapping("notercvview") */
	 @RequestMapping("/notercvview") 
	public String notercvview(Authentication authentication,@RequestParam("recv_id") String recv_id, @RequestParam("cnt") int cnt,
			@RequestParam(defaultValue = "1") int page, Model model) {
		 

		 PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		 recv_id = principalDetails.getUser().getUsername();

		NoteBean note = noteService.getReceivedNoteDetail(cnt);
		System.out.println("받은 쪽지함  DTO:"+ note);
		
		model.addAttribute("note", note);
		 model.addAttribute("recv_id", recv_id); 
		  model.addAttribute("message", note.getMessage()); // message 값을 모델에 추가

		return "note/notercvview";
	}

	// 쪽지 삭제
	/* @GetMapping("notedelete") */
	 @RequestMapping("/notedelete") 
	public String notedelete(Authentication authentication,int note_No, String page, Model model, HttpSession session) {
		
		 PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     String recv_id = principalDetails.getUser().getUsername();
	     String send_id = principalDetails.getUser().getUsername();
		 
		 
		 int result = noteService.deleteNoteById(note_No);

//		String recv_id = (String) session.getAttribute("send_id");

		model.addAttribute("result", result);
		model.addAttribute("page", page);
		model.addAttribute("recv_id", recv_id);
		model.addAttribute("send_id", send_id);

		return "note/deleteresult";

	}
}
