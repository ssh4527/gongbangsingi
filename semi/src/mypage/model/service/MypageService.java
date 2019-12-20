package mypage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
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

	public Member updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updateMember = null;
		// 1. 비밀번호 변경
		int result = new MypageDao().updatePwd(conn, userId, userPwd, newPwd);
		// 2. updateMember select 해오기
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return updateMember;
	}

	public int showMyLevel(String uId) {
		Connection conn = getConnection();
		
		int result = new MypageDao().showMyLevel(uId,conn);
		
		close(conn);
		return result;
	}
	
	
	// 공방 번호 가져오기
	public String selectWsNo(String userId) {
		Connection conn = getConnection();
		String wsNo = new MypageDao().selectWsNo(userId,conn);
		close(conn);
		return wsNo;
	}
	

}
