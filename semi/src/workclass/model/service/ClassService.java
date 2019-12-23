package workclass.model.service;

import workclass.model.dao.ClassDao;
import workclass.model.vo.ClassFile;
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import qna.model.vo.Qna;
import qna.model.vo.QnaRe;
import review.model.vo.Review;


public class ClassService {

	// 클래스 Insert 
	public int insertWorkClass(Workclass wc) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertWorkClass(conn,wc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
	
		
		return result;
	}

	// 클래스 WcNo 가져오기 이름으로 비교
	public String selectWcNo(String wcName) {
		Connection conn = getConnection();
		
		String wcNo = new ClassDao().selectWcNo(conn,wcName);
		
		close(conn);
		
		
		return wcNo;
	}
	
	// 클래스 시간 넣는 부분ㅇ
	public int insertClassTime(ClassTime ct) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertClassTime(conn,ct);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 클래스에 맞는 파일 넣는 부분입니다
	public int insertFile(ArrayList<ClassFile> fileList) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertFile(conn,fileList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 리뷰 넣는 메소드
	public int insertReview(Review review) {
		Connection conn = getConnection();
		
		int result = new ClassDao().insertReview(conn,review);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	// 리뷰에 파일넣기
	public int insertReviewFile(ArrayList<ClassFile> fileList, String rNo) {
		Connection conn = getConnection();
		int result = new ClassDao().insertReviewFile(conn,fileList,rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
				
		close(conn);
		
		return result;
	}

	public String selectRNo(String title, String wcNo) {
		Connection conn = getConnection();
		String rNo = new ClassDao().selectRNo(conn,title,wcNo);
		close(conn);
		
		return rNo;
	}

	// 워크클래스 select 
	public Workclass selectWorkClass(String wcNo) {
		Connection conn = getConnection();
		
		Workclass wc = new ClassDao().selectWorkClass(conn,wcNo);
		close(conn);
		
		return wc;
	}

	// 클래스에 맞는 파일 select
	public ArrayList<ClassFile> selectClassFile(String wcNo) {
		Connection conn = getConnection();
		
		ArrayList<ClassFile> cfList = new ClassDao().selectClassFile(conn,wcNo);
		close(conn);
		return cfList;
	}

	public ClassTime selectClassTime(String wcNo) {
		Connection conn = getConnection();
		
		ClassTime ct = new ClassDao().selectClassTime(conn,wcNo);
		close(conn);
		return ct;
	}

	// 찜체크
	public int JJimCheck(String wcNo, String cId) {
		Connection conn = getConnection();
		
		int result = new ClassDao().JJimCheck(wcNo,cId,conn);
		close(conn);
		return result;
	}

	// 찜 하기
	public int selectJJim(String wcNo, String cId) {
		Connection conn = getConnection();
		
		int result = new ClassDao().selectJJim(wcNo,cId,conn);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 찜 해제 성공
	public int deleteJJim(String wcNo, String cId) {
		Connection conn = getConnection();
		
		int result = new ClassDao().deleteJJim(wcNo,cId,conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	// 클래스 승인안된거 가져오기 ssh
	public ArrayList<String[]> selectCheckClassList() {
		Connection c = getConnection();
		
		ArrayList<String[]> list = new ClassDao().selectCheckClassList(c);
		close(c);
		return list;
	}
	// 클래스 승인하기 ssh
	public int changeAuth(String id) {
		Connection c= getConnection();
		
		int result = new ClassDao().changeAuth(c,id);
		if(result>0) {
			commit(c);
		}else {
			rollback(c);
		}
		close(c);
		
		return result;
	}

	// 리뷰가져오기
	public ArrayList<Review> selectReview(String wcNo) {
		Connection conn = getConnection();
		
		ArrayList<Review> rList = new ClassDao().selectReview(wcNo,conn);
		
		close(conn);
		
		return rList;
	}

	// 리뷰 파일 가져오기
	public ArrayList<ClassFile> selectReviewFile(String rNo) {
		Connection conn = getConnection();
		
		ArrayList<ClassFile> rfList = new ClassDao().selectReviewFile(rNo,conn);
		
		close(conn);
		
		return rfList;
	}

	// 리뷰 삭제
	public int deleteReview(String rNo) {
		Connection conn = getConnection();
		
		int result = new ClassDao().deleteReview(rNo,conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 리뷰파일 삭제
	public int deleteReviewFile(String rNo) {
		Connection conn = getConnection();
		
		int result = new ClassDao().deleteReviewFile(rNo,conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 리뷰 수정
	public int updateReview(Review review) {
		Connection conn = getConnection();
		int result = new ClassDao().updateReview(review,conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 리뷰 하나만 가져오김
	public Review selectReviewOne(String rNo) {
		Connection conn = getConnection();
				
		Review review = new ClassDao().selectReviewOne(rNo,conn);
		close(conn);
		return review;
	}

	// 해당 클래스 공방 번호 가져오는부분
	public String selectWsNo(String wcNo) {
		Connection conn = getConnection();
		
		String WsNo = new ClassDao().selectWsNo(wcNo,conn);
		
		
		close(conn);
		return WsNo;
	}

	// 클래스 QnA 작성 by.jh
	public int insertClassQna(Qna q) {
	
			Connection conn = getConnection();
			
			int result = new ClassDao().insertClassQna(q,conn);
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;

	}

	
	// QnA 가져오는부분
	public ArrayList<Qna> selectQna(String wcNo) {
		Connection conn = getConnection();
		
		ArrayList<Qna> qList = new ClassDao().selectQna(wcNo,conn);
			close(conn);
		return qList;
	}

	public String selectOrnerId(String wcNo) {
		Connection conn = getConnection();
		String id = new ClassDao().selectOrnerId(wcNo,conn);
		close(conn);
		return id;
	}
	
	
	// Qna 하나만 가져오기
	public Qna selectQnaOne(String qno) {
		Connection conn = getConnection();
		Qna q = new ClassDao().selectQnaOne(qno,conn);
		close(conn);
		return q;
	}

	// Qna 수정
	public int updateQna(Qna q) {
		Connection conn = getConnection();
		int result = new ClassDao().updateQna(q,conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	// Qna 삭제
	public int deleteQna(String qno) {
		Connection conn = getConnection();
		int result = new ClassDao().deleteQna(qno,conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// Qna 시크릿인지 가져옴
	public String selectSecret(String qno) {
		Connection conn = getConnection();
		String secret = new ClassDao().selectSecret(qno,conn);
		close(conn);
		return secret;
	}

	public int insertClassQnaRe(QnaRe q) {
		Connection conn = getConnection();
		int result = new ClassDao().insertClassQnaRe(conn,q);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// qNo에 맞는 qNaList 가져옴
	public QnaRe selectQnaRe(String qno) {
		Connection conn = getConnection();
		QnaRe qr = new ClassDao().selectQnaRe(conn,qno);
		close(conn);
		return qr;
	}

	public int deleteQnaRe(String rqNo) {
		Connection conn = getConnection();
		int result = new ClassDao().deleteQnaRe(conn,rqNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 조회수증가
	public int CountUp(String wcNo) {
		Connection conn = getConnection();
		int result = new ClassDao().Countup(conn,wcNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public void upCountReview(String rNo) {
		Connection conn = getConnection();
		int result = new ClassDao().upCountReview(conn,rNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
	}

	
	
}
