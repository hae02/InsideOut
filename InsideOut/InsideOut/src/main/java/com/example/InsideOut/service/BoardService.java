package com.example.InsideOut.service;

import java.util.List;
import com.example.InsideOut.model.BoardBean;

public interface BoardService {

	public void insertBoard(BoardBean n) throws Exception;
	
	public void hit(int post_no) throws Exception;
	
	public BoardBean board_cont(int post_no) throws Exception;
	
	public void edit(BoardBean n) throws Exception;
	
	public void editFile(BoardBean board) throws Exception;

	public void del_ok(int post_no) throws Exception;
	
	public List getNoticeList(int page) throws Exception;
	
	public int getNoticeCount() throws Exception;
	
	public List getJobList(int page) throws Exception;
	
	public int getJobCount() throws Exception;
	
	public List getQnAList(int page) throws Exception;
	
	public int getQnACount() throws Exception;


	
}
