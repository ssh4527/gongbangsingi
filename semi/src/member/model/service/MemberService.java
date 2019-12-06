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
	
}
