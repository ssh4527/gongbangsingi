package notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeDao {
	private Properties prop = new Properties();

	public NoticeDao() {
		String fileName = Notice.class.getResource("/sql/notice/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 1. 공지사항 리스트 조회
	public ArrayList<Notice> selectList(Connection conn) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Notice(rset.getInt("nno"), rset.getString("ntitle"), rset.getString("ncontent"),
						rset.getString("nwriter"), rset.getInt("ncount"), rset.getDate("ndate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 2. 공지사항 글 작성
	public int insertNotice(Connection conn, Notice n) {
		int result=0;
		
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("insertNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnWriter());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, int nno) {
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("increaseCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectNotice(Connection conn, int nno) {
		Notice n=null;
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String sql=prop.getProperty("selectNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				n= new Notice(rset.getInt("nno"), rset.getString("ntitle"), rset.getString("ncontent"),
						rset.getString("nwriter"), rset.getInt("ncount"), rset.getDate("ndate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int deleteNotice(Connection conn, int nno) {
		int result=0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteNotice");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}



}
