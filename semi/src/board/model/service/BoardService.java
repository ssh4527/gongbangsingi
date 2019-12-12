package board.model.service;

import board.model.dao.BoardDao;
import board.model.vo.Board;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

public class BoardService {

	// 1. 게시글 입력
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn);

		close(conn);

		return list;
	}

}
