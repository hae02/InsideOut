package com.example.InsideOut.dao;

import java.util.List;
import com.example.InsideOut.model.BoardBean;

	public interface BoardDao {

	public void insertBoard(BoardBean n) throws Exception;

	
	  public List<BoardBean> getNoticeList(int page) throws Exception;
	  
	  public List<BoardBean> getJobList(int page) throws Exception;
	  
	  public List<BoardBean> getQnAList(int page) throws Exception;
	  
	  public int getNoticeCount() throws Exception;
	  
	  public int getJobCount() throws Exception;
	  
	  public int getQnACount() throws Exception;

	  
	  public BoardBean getBoardCont(int post_no) throws Exception;
	  
	  public void boardHit(int post_no) throws Exception;
	  
	 
	  public void boardEdit(BoardBean b) throws Exception;
	  
	  public void editFile(BoardBean board) throws Exception;
	  
	  public void editFileBoard(BoardBean b) throws Exception;

	  public void boardDelete(int post_no) throws Exception;




	 
}