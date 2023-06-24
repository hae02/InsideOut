package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.BoardDAOImpl;
import com.example.InsideOut.model.BoardBean;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAOImpl boardDao;

	// 첨부파일 없는 게시판 저장
	public void insertBoard(BoardBean b) throws Exception {
		boardDao.insertBoard(b);
	}

	// 첨부파일 저장
	public void insertFile(BoardBean board) throws Exception {
		boardDao.insertFile(board);

	}

	// 첨부파일 있는 게시판 저장

	public void insertFileboard(BoardBean board) {
		boardDao.insertFileboard(board);
	}

	// 게시글 갯수

	@Override
	public int getNoticeCount() throws Exception {
		return boardDao.getNoticeCount();
	}

	@Override
	public int getJobCount() throws Exception {
		return boardDao.getJobCount();
	}

	@Override
	public int getQnACount() throws Exception {
		return boardDao.getQnACount();
	}

	// 공지게시판 목록

	@Override
	public List getNoticeList(int page) throws Exception {
		return boardDao.getNoticeList(page);
	}

	@Override
	public List getJobList(int page) throws Exception {
		return boardDao.getJobList(page);
	}

	@Override
	public List getQnAList(int page) throws Exception {
		return boardDao.getQnAList(page);
	}

	// 조회수 증가

	@Override
	public void hit(int post_no) throws Exception {
		boardDao.boardHit(post_no);
	}

	// 상세정보

	@Override
	public BoardBean board_cont(int post_no) throws Exception {

		BoardBean board = boardDao.getBoardCont(post_no);

		return board;
	}

	// 게시글 수정

	@Override
	public void edit(BoardBean b) throws Exception {
		boardDao.boardEdit(b);

	}

	// 게시글 수정
	@Override
	public void editFile(BoardBean board) throws Exception {
		boardDao.editFile(board);
	}

	public void edit_fileBoard(BoardBean board) throws Exception {
		boardDao.editFileBoard(board);

	}

	// 게시글 삭제

	@Override
	public void del_ok(int post_no) throws Exception {
		boardDao.boardDelete(post_no);
	}

	public List<BoardBean> getAskBoardList() throws Exception {
		return boardDao.getAskBoardList();
	}

	public BoardBean getAskView(int post_no) {
		return boardDao.getAskView(post_no);
	}

	public BoardBean getReplyAsk(int post_no) {
		return boardDao.getReplyAsk(post_no);
	}

	public void deleteAskView(int post_no) {
		boardDao.deleteAskView(post_no);
	}

	public void askViewReply(BoardBean BoardBean) {
		boardDao.askViewReply(BoardBean);

	}

}
