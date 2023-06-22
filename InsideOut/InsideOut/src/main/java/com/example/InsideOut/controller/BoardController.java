package com.example.InsideOut.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.InsideOut.model.BoardBean;
import com.example.InsideOut.service.BoardServiceImpl;

@Controller
//@RequestMapping(value = "api/v1")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@RequestMapping("test")
	public String test() {
		System.out.println("컨트롤러 on");
		
		return "board/test";
	}
	
	/*  게시글 작성 -교직원만 */
	
	@RequestMapping(value = "/staff/board_write")
	public String board_write(@RequestParam("board_name") String board_name) {
		return board_name+"/" +board_name+"_write";
	}
	
	/*게시글 저장 -교직원만*/
	@RequestMapping(value = "/staff/board_write_ok", method = RequestMethod.POST)
	public String notice_write_ok(@RequestParam("nFile") MultipartFile mf,
								  HttpServletRequest request,
								  @ModelAttribute BoardBean board,
								  @RequestParam("board_name") String board_name) throws Exception {
		
		System.out.println("글작성 진입");
		System.out.println("board_no:"+ board.getBoard_no());
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		String path = request.getRealPath("upload");
		System.out.println(path);
		String newfilename = "";
		String file[] = new String[2];
		int result=0;

		
		if(size > 0) {
			
			String extension = filename.substring(filename.lastIndexOf("."),
			filename.length()); UUID uuid = UUID.randomUUID(); newfilename =
			uuid.toString() + extension;
			 
			
			// 전달확인
			System.out.println("FileName=" + filename); 
			System.out.println("FileSize=" + size);
			System.out.println("Path=" + path);
		
			mf.transferTo(new File(path + "/" + newfilename));
			board.setReal_file_nm(filename);
			board.setSave_file_nm(newfilename);
			board.setFile_size(size);
			board.setFile_path(path);
			
			boardService.insertFile(board); 
			boardService.insertFileboard(board); 
		}else {
			boardService.insertBoard(board); 
		}
		
		return "redirect:/"+board_name+"_list";
		
		
	}
	
	
	  
	  // 교직원 게시글 상세페이지 
	  @RequestMapping(value = "/board_cont")
	  public String notice_cont(@RequestParam("post_no") int post_no,
	                            @RequestParam("page") String page,
	                            @RequestParam("state") String state,
	                            @RequestParam("board_name") String board_name,
	                            Model model) throws Exception {
	      System.out.println("매퍼로 이동");
	      if (state.equals("cont")) { // 내용 보기
	          boardService.hit(post_no); // 조회수 증가
	      }
	      
	      System.out.println("조회수 증가 완");
	      BoardBean board = boardService.board_cont(post_no);
	      System.out.println("content sql완료"+board);

	      model.addAttribute("bcont", board);
	      model.addAttribute("page", page);

	          String post_cont = board.getPost_content().replace("\n", "<br>");
	          model.addAttribute("post_cont", post_cont);

	          return board_name+"/" +board_name+"_"+ state;
	  }
	      
	  // 교직원 게시글 상세페이지  -> 수정 삭제 폼 이동 ( 교직원 용이라 쪼개지는 거)
	  @RequestMapping(value = "/staff/board_cont")
	  public String notice_contStaff(@RequestParam("post_no") int post_no,
	                            @RequestParam("page") String page,
	                            @RequestParam("state") String state,
	                            @RequestParam("board_name") String board_name,
	                            Model model) throws Exception {
		  
	      BoardBean board = boardService.board_cont(post_no);
	      model.addAttribute("bcont", board);
	      model.addAttribute("page", page);
	    
	      return board_name+"/" +board_name+"_"+ state;
	  }
	 
	// 게시글 수정 - 교직원 
	  
		 @RequestMapping(value = "/staff/board_edit_ok", method = RequestMethod.POST)
		 public String edit_ok(@RequestParam("post_no") int post_no,
				 					  @RequestParam("page") int page,
				 					  @RequestParam("board_name") String board_name,
				 					  @RequestParam("nFile") MultipartFile mf,
									  HttpServletRequest request,
									  @ModelAttribute BoardBean board, Model model) throws Exception{
		
			System.out.println("board_name:"+board_name);	 

			 BoardBean b = boardService.board_cont(post_no);
			 String oldFileName = b.getReal_file_nm();
			 String filename = mf.getOriginalFilename();
			 int size = (int)mf.getSize();
			 
			 if(size > 0) {
					String path = request.getRealPath("upload");
					System.out.println(path);
					String newfilename = "";
					String file[] = new String[2];
					
					String extension = filename.substring(filename.lastIndexOf("."),
					filename.length()); UUID uuid = UUID.randomUUID(); 
					newfilename =uuid.toString() + extension;
					 
					
					// 전달확인
					System.out.println("FileName=" + filename); 
					System.out.println("FileSize=" + size);
					System.out.println("Path=" + path);
				
					mf.transferTo(new File(path + "/" + newfilename));
					board.setReal_file_nm(filename);
					board.setSave_file_nm(newfilename);
					board.setFile_size(size);
					board.setFile_path(path);
					
					boardService.editFile(board); 
					boardService.edit_fileBoard(board); 
			}else {
					boardService.edit(board);
			}
			 
			return "redirect:/"+board_name+"_list?page=" + page;
			 
		 } 
	  
	 // 게시글 삭제 - 교직원 
	 @RequestMapping(value = "/staff/board_del_ok", method = RequestMethod.POST)
	 public String notice_del_ok(@RequestParam("post_no") int post_no,
			 					 @RequestParam("page") int page,
			 					@RequestParam("board_name") String board_name,
			 					 Model model) throws Exception{
		 BoardBean board = boardService.board_cont(post_no);
		 
		 
		 
		 
		 boardService.del_ok(post_no);
		
		return "redirect:/"+board_name+"_list?page=" + page;
	
		 
	 }
	 
	 
	 //공지사항 목록- 모두
	 
	 @RequestMapping(value = "/notice_list") 
	 public String Nooticelist(HttpServletRequest request, Model model) throws Exception{
		 
		 List<BoardBean> noticelist = new ArrayList<BoardBean>();
		 
		 int page = 1; int limit = 10;
		 
		 // 한화면 출력할 항목 수
		 
		 if (request.getParameter("page") != null) { page =
				 Integer.parseInt(request.getParameter("page")); }
		 
		 // 데이터 갯수 
		 int noticelistcount = boardService.getNoticeCount();
		 System.out.println("noticeList:"+noticelist);
		 
		 int start = (page - 1) * 10 ;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		 
		 noticelist = boardService.getNoticeList(start); 
		 
		 
		 //총 페이지 
		 int maxpage= noticelistcount / limit + ((noticelistcount % limit == 0) ? 0 :1);
		 
		 int startpage = ((page-1)/10)* limit + 1; 
		 int endpage = startpage +10 -1;
		 
		 if (endpage> maxpage) endpage = maxpage;
		 
		 model.addAttribute("page", page); model.addAttribute("startpage", startpage);
		 model.addAttribute("endpage", endpage); model.addAttribute("maxpage",maxpage); 
		 model.addAttribute("noticelistcount", noticelistcount);
		 model.addAttribute("noticelist", noticelist);
				  
				 return "notice/notice_list";
				 
	 }
	 
	//취업게시판  목록- 모두
	 
		 @RequestMapping(value = "/job_list") 
		 public String Joblist(HttpServletRequest request, Model model) throws Exception{
			 
			 List<BoardBean> joblist = new ArrayList<BoardBean>();
			 
			 int page = 1; int limit = 10;
			 
			 // 한화면 출력할 항목 수
			 
			 if (request.getParameter("page") != null) { page =
					 Integer.parseInt(request.getParameter("page")); }
			 
			 // 데이터 갯수 
			 int joblistcount = boardService.getJobCount();
			 System.out.println("jobList:"+joblist);
			 
			 int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
			 
			 joblist = boardService.getJobList(start); 
			 
			 
			 //총 페이지 
			 int maxpage= joblistcount / limit + ((joblistcount % limit ==
					 0) ? 0 :1);
			 
			 int startpage = ((page-1)/10)* limit + 1; int endpage = startpage +10 -1;
			 
			 if (endpage> maxpage) endpage = maxpage;
			 
			 model.addAttribute("page", page); model.addAttribute("startpage", startpage);
			 model.addAttribute("endpage", endpage); model.addAttribute("maxpage", maxpage); 
			 model.addAttribute("joblistcount", joblistcount);
			 model.addAttribute("joblist", joblist);
					 
 
			 return "job/job_list";
					 
		 }
		 
		//QnA 목록- 모두
		 
		 @RequestMapping(value = "/QnA_list") 
		 public String list(HttpServletRequest request, Model model) throws Exception{
			 
			 List<BoardBean> QnAlist = new ArrayList<BoardBean>();
			 
			 int page = 1; int limit = 10;
			 
			 // 한화면 출력할 항목 수
			 
			 if (request.getParameter("page") != null) { page =
					 Integer.parseInt(request.getParameter("page")); }
			 
			 // 데이터 갯수 
			 int QnAlistcount = boardService.getQnACount();
			 System.out.println("QnAList:"+QnAlist);
			 
			 int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
			 
			 QnAlist = boardService.getQnAList(start); 
			 
			 
			 //총 페이지 
			 int maxpage= QnAlistcount / limit + ((QnAlistcount % limit ==
					 0) ? 0 :1);
			 
			 int startpage = ((page-1)/10)* limit + 1; int endpage = startpage +10 -1;
			 
			 if (endpage> maxpage) endpage = maxpage;
			 
			 model.addAttribute("page", page); model.addAttribute("startpage", startpage);
			 model.addAttribute("endpage", endpage); model.addAttribute("maxpage",maxpage); 
			 model.addAttribute("QnAlistcount", QnAlistcount);
			 model.addAttribute("QnAlist", QnAlist);
					 
 
			 return "QnA/QnA_list";
					 
		 }
}
