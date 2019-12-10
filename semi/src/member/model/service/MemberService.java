package member.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member LoginMember(String id, String pwd) {
		// TODO Auto-generated method stub
		Connection c= getConnection();
		Member m = new MemberDao().LoginMember(id,pwd,c);
		
		
		
		close(c);
		return m;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int insertMember(Member m) {
		Connection c= getConnection();
		int result = new MemberDao().insertMember(c , m );
		if(result>0) {
			commit(c);
		}else {
			rollback(c);
		}
		close(c);
		return result;
	}

	public Member checkEmail(String findEmail, String findPhone) {
		Connection conn = getConnection();
		Member result = new MemberDao().checkEmail(conn, findEmail, findPhone);
		
		close(conn);
		
		return result;
		
	}

	public int findPwd(Member m) {
		Connection c= getConnection();
		int result = new MemberDao().findPwd(c, m);
				
				
		close(c);
		return result;
	}

	public int changePwd(String id, String pwd) {
		Connection c= getConnection();
		int result = new MemberDao().changePwd(c,id,pwd);
		
		if(result>0) {
			commit(c);
		}else {
			rollback(c);
		}
		close(c);
		return result;
	}

	
	
}
