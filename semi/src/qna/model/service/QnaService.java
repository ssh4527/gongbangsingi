package qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.Attachment;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

import static common.JDBCTemplate.*;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;
import qna.model.vo.QnaRe;


public class QnaService {

	// 1. 고객센터 리스트 조회
	public ArrayList<Qna> selectList() {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(conn);

		close(conn);

		return list;
	}

	// 2. 고객센터 글 작성
	public int insertQna(Qna q) {
		Connection conn = getConnection();
		int result = new QnaDao().insertQna(conn, q);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 3. 고객센터 상세보기 (조회수 증가)
	public Qna selectQna(String qno) {
		Connection conn = getConnection();
		QnaDao qDao = new QnaDao();

		int result = qDao.increaseCount(conn, qno);
		Qna q = null;

		if (result > 0) {
			q = qDao.selectQna(conn, qno);
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return q;
	}

	// 4. 고객센터 삭제
	public int deleteQna(String qno) {
		Connection conn = getConnection();

		int result = new QnaDao().deleteQna(conn, qno);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 5. 고객센터 수정 updateform
	public Qna selectNotice2(String qno) {
		Connection conn = getConnection();
		Qna q = new QnaDao().selectQna(conn, qno);
		close(conn);
		return q;
	}

	// 6. 고객센터 수정 update
	public int updateQna(Qna q) {
		Connection conn = getConnection();
		int result = new QnaDao().updateQna(conn, q);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 7. 고객센터 찾기  search
	public ArrayList<Qna> selectList(String search2, String searchCondition2) {
		Connection conn=getConnection();
		ArrayList<Qna> list=new QnaDao().selectList(conn,search2,searchCondition2);
		close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new QnaDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Qna> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();

		ArrayList<Qna> list = new QnaDao().selectList(conn, currentPage, boardLimit);

		close(conn);

		return list;
	}

	public int getReadStatus(ArrayList<Qna> qnalist) {
		Connection c = getConnection();
		int result=0;
		for(int i =0; i<qnalist.size();i++) {
			System.out.println(qnalist.get(i).getqNo());
			result +=  new QnaDao().getReadStatus(c,qnalist.get(i).getqNo());
		}
		
		close(c);
		return result;
	}

	public ArrayList<QnaRe> insertReply(QnaRe r) {
		Connection conn = getConnection();
		
		QnaDao qDao=new QnaDao();
		
		int result = qDao.insertReply(conn, r);
		
		ArrayList<QnaRe> rlist = null;
		
		if(result > 0) {
			commit(conn);
			rlist = qDao.selectReplyList(conn, r.getqNo());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return rlist;
	}
	



}
