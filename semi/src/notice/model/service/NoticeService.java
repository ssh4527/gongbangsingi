package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	// 1. 공지사항 리스트 조회
	public ArrayList<Notice> selectList() {
		Connection conn=getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn);

		close(conn);

		return list;
	}
	
	// 2. 공지사항 글 작성
	public int insertNotice(Notice n) {
		Connection conn=getConnection();

		int result=new NoticeDao().insertNotice(conn,n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 3. 공지사항 상세보기
	public Notice selectNotice(int nno) {
		Connection conn=getConnection();
		
		int result=new NoticeDao().increaseCount(conn, nno);
		Notice n = null;
		
		if(result>0) {
			n=new NoticeDao().selectNotice(conn,nno);
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return n;
	}

	// 4. 공지사항 삭제
	public int deleteNotice(int nno) {
		Connection conn=getConnection();
		
		int result=new NoticeDao().deleteNotice(conn, nno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return  result;
	}

	// 5. 공지사항 수정 updateForm
	public Notice selectNotice2(int nno) {
		Connection conn=getConnection();
		Notice n=new NoticeDao().selectNotice(conn, nno);
		close(conn);
		return n;
	}

	// 6. 공지사항 수정 update
	public int updateNotice(Notice n) {
		Connection conn=getConnection();
		int result=new NoticeDao().updateNotice(conn,n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return  result;
	}



}
