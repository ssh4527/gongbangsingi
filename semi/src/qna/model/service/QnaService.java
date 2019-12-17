package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;

public class QnaService {

	// 1. 고객센터 리스트 조회
	public ArrayList<Qna> selectList() {
		Connection conn=getConnection();
		ArrayList<Qna> list=new QnaDao().selectList(conn);
		
		close(conn);

		return list;
	}

	// 2. 고객센터 글 작성
	public int insertQna(Qna q) {
		Connection conn=getConnection();
		int result=new QnaDao().insertQna(conn, q);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 3. 고객센터 상세보기 (조회수 증가)
	public Qna selectQna(String qno) {
		Connection conn=getConnection();
		QnaDao qDao=new QnaDao();
		
		int result=qDao.increaseCount(conn,qno);
		
		Qna q=null;
		
		if(result>0) {
			commit(conn);
			q=qDao.selectQna(conn,qno);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return q;
	}


}
