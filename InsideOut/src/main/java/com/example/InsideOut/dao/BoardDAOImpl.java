package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.InsideOut.model.BoardBean;

@Repository
public class BoardDAOImpl implements BoardDao {

	@Autowired
	private SqlSession session;

	// 게시판 저장 - 첨부파일 X
	@Override
	public void insertBoard(BoardBean b) throws Exception {
		session.insert("boardns.board_insert", b);
	}

	// 게시판 저장 - 첨부파일 있을 때
	public void insertFileboard(BoardBean bo) {
		session.insert("boardns.fileboard_insert", bo);
	}

	// 첨부파일 저장
	public void insertFile(BoardBean board) {
		session.insert("boardns.file_insert", board);
	}

	// 공지 리스트
	@Override
	public List<BoardBean> getNoticeList(int page) throws Exception {
		List<BoardBean> list = session.selectList("boardns.notice_list", page);

		return list;
	}

	// 취업 리스트
	@Override
	public List<BoardBean> getJobList(int page) throws Exception {
		List<BoardBean> list = session.selectList("boardns.job_list", page);

		return list;
	}

	// QnA 리스트
	@Override
	public List<BoardBean> getQnAList(int page) throws Exception {
		List<BoardBean> list = session.selectList("boardns.QnA_list", page);

		return list;
	}

	// 공지게시판 총갯수
	@Override
	public int getNoticeCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("boardns.notice_count")).intValue();

		return count;
	}

	// 취업게시판 총갯수
	@Override
	public int getJobCount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("boardns.job_count")).intValue();

		return count;
	}

	// QnA게시판 총갯수
	@Override
	public int getQnACount() throws Exception {
		int count = 0;
		count = ((Integer) session.selectOne("boardns.QnA_count")).intValue();

		return count;
	}

	// 게시판 글 내용 보기
	@Override
	public BoardBean getBoardCont(int post_no) throws Exception {
		return (BoardBean) session.selectOne("boardns.board_cont", post_no);
	}

	// 게시판 조회수 증가
	@Override
	public void boardHit(int post_no) throws Exception {
		session.update("boardns.board_hit", post_no);
	}

	// 게시물 수정
	@Override
	public void boardEdit(BoardBean b) throws Exception {
		session.update("boardns.board_edit", b);

	}

	// 게시물 수정
	@Override
	public void editFile(BoardBean board) throws Exception {
		session.update("boardns.edit_file", board);
	}

	// 게시물 수정
	public void editFileBoard(BoardBean board) throws Exception {
		session.update("boardns.fileboard_edit", board);

	}

	// 게시물 삭제
	@Override
	public void boardDelete(int post_no) throws Exception {
		session.delete("boardns.board_del", post_no);

	}

	@Override
	public List<BoardBean> getAskBoardList() {
		List<BoardBean> list = session.selectList("boardns.getAskBoardList");

		return list;
	}

	@Override
	public BoardBean getAskView(int post_no) {
		return (BoardBean) session.selectOne("boardns.getAskView", post_no);
	}

	@Override
	public void deleteAskView(int post_no) {
		session.delete("boardns.deleteAskView", post_no);

	}

	@Override
	public BoardBean getReplyAsk(int post_no) {
		return (BoardBean) session.selectOne("boardns.getReplyAsk", post_no);
	}

	@Override
	public void askViewReply(BoardBean board) {
		session.insert("boardns.askViewReply", board);

	}

}
