package review.model.service;

import java.sql.Connection;

import review.model.dao.ReviewDao;

import static common.JDBCTemplate.*;


public class ReviewService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount= new ReviewDao().getListCount(con);
		close(con);
		return listCount;
	}

}
