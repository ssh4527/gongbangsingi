package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import review.model.dao.ReviewDao;
import review.model.vo.Review;

import static common.JDBCTemplate.*;


public class ReviewService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount= new ReviewDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<Review> selectList(int currentPage, int boardLimit) {
		Connection con = getConnection();
		ArrayList<Review> list = new ReviewDao().selectList(con, currentPage, boardLimit);

		close(con);

		return list;
	}

}
