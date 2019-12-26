package business_mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import business_mypage.model.dao.BMypageDao;
import mypage.model.dao.MypageDao;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

public class BMypageService {
	// 예약 목록 가져오기
		public ArrayList<Reservation> selectList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Reservation> list = new BMypageDao().selectList(wNo,conn);
			
			close(conn);
			return list;
		}
		
		// 후기 내역 가져오기
		public ArrayList<Review> selectReviewList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Review> relist = new BMypageDao().selectReviewList(wNo,conn);
			
			close(conn);
			return relist;
		}

		public ArrayList<Qna> selectQnaList(String wNo) {
			Connection conn = getConnection();
			
			ArrayList<Qna> qlist = new BMypageDao().selectQnaList(wNo,conn);
			
			close(conn);
			return qlist;
		}

		public int deleteMember(String uId) {
			Connection conn = getConnection();
			
			int result = new BMypageDao().deleteMember(uId,conn);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
		// 공방 번호 가져오기
		public String selectWsNo(String userId) {
			Connection conn = getConnection();
			String wsNo = new BMypageDao().selectWsNo(userId,conn);
			close(conn);
			return wsNo;
		}
		public int showMyLevel(String wsNo) {
			Connection conn = getConnection();
			
			int result = new BMypageDao().showMyLevel(wsNo,conn);
			
			close(conn);
			return result;
		}

		public int selectProgress(String wsNo) {
			Connection conn = getConnection();
			
			int prog = new BMypageDao().selectProgress(wsNo,conn);
			
			close(conn);
			return prog;
		}
		
		public int updateAddress(String wsNo, String naddr) {
			Connection conn = getConnection();
			
			int result = new BMypageDao().updateAddress(wsNo,naddr,conn);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}
}
