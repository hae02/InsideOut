package com.example.InsideOut.dao;

import java.util.List;
import com.example.InsideOut.model.BoardBean;

public interface BoardDao {

	public void insertBoard(BoardBean n) throws Exception;

	
	  public List<BoardBean> getNoticeList(int page) throws Exception;
	  
	  public int getListCount() throws Exception;
	  
	  public BoardBean getBoardCont(int post_no) throws Exception;
	  
	  public void boardHit(int post_no) throws Exception;
	/*  
	  public void boardEdit(BoardBean b) throws Exception;
	*/  
	  public void boardDelete(int post_no) throws Exception;
	 
}