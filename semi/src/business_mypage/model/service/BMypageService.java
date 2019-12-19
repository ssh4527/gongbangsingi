package business_mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MypageDao;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

public class BMypageService {
	// 예약 목록 가져오기
		public ArrayList<Reservation> selectList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Reservation> list = new MypageDao().selectList(wNo,conn);
			
			close(conn);
			return list;
		}
		
		// 후기 내역 가져오기
		public ArrayList<Review> selectReviewList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Review> relist = new MypageDao().selectReviewList(wNo,conn);
			
			close(conn);
			return relist;
		}

		public ArrayList<Qna> selectQnaList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Qna> qlist = new MypageDao().selectQnaList(wNo,conn);
			
			close(conn);
			return qlist;
		}

		public int deleteMember(String uId) {
			Connection conn = getConnection();
			
			int result = new MypageDao().deleteMember(uId,conn);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
}
