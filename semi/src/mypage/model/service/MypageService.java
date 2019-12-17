package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MypageDao;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

public class MypageService {

	// 예약 목록 가져오기
	public ArrayList<Reservation> selectList(String uId) {
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new MypageDao().selectList(uId,conn);
		
		close(conn);
		return list;
	}
	
	// 후기 내역 가져오기
	public ArrayList<Review> selectReviewList(String uId) {
		Connection conn = getConnection();
		
		ArrayList<Review> relist = new MypageDao().selectReviewList(uId,conn);
		
		close(conn);
		return relist;
	}

	public ArrayList<Qna> selectQnaList(String uId) {
		Connection conn = getConnection();
		
		ArrayList<Qna> qlist = new MypageDao().selectQnaList(uId,conn);
		
		close(conn);
		return qlist;
	}
	
	

}
