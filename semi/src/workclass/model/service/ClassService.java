package workclass.model.service;

import workclass.model.dao.ClassDao;
import workclass.model.vo.ClassFile;
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

}
