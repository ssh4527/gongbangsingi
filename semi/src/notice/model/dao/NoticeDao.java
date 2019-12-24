package notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
				list.add(new Notice(rset.getString("n_no"), rset.getString("n_title"), rset.getString("n_content"),
						 rset.getInt("n_count"), rset.getDate("n_date")));
				
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
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, String nno) {
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("increaseCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nno);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectNotice(Connection conn, String nno) {
		Notice n=null;
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String sql=prop.getProperty("selectNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				n= new Notice(rset.getString("n_no"), rset.getString("n_title"), rset.getString("n_content"),
						rset.getInt("n_count"), rset.getDate("n_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int deleteNotice(Connection conn, String nno) {
		int result=0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteNotice");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		int result=0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> selectList(Connection conn, String search3, String searchCondition) {
		ArrayList<Notice> list=new ArrayList<>();
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String sql="";
		
		if(searchCondition.equals("title")) {
			sql=prop.getProperty("searchTitleList");
		}else {
			sql=prop.getProperty("searchContentList");
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,search3);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getString("n_no"), rset.getString("n_title"), rset.getString("n_content"),
						 rset.getInt("n_count"), rset.getDate("n_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount=0;
		Statement stmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("getListCount");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Notice> selectList3(Connection conn, int ncurrentPage, int nLimit) {
		ArrayList<Notice> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList3");

		try {
			pstmt = conn.prepareStatement(sql);


			int startRow = (ncurrentPage - 1) * nLimit + 1;
			int endRow = startRow + nLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Notice(rset.getString(2), rset.getString(3),
						rset.getString(4),rset.getDate(5),rset.getInt(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Notice> selectList(Connection conn, int currentPage, int boardLimit, String search3,
			String searchCondition) {
		ArrayList<Notice> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql="";
		
		if(searchCondition.equals("title")) {
			sql=prop.getProperty("searchTitleList");
		}else {
			sql=prop.getProperty("searchContentList");
		}
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3,search3);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new Notice(rs.getString("n_no"), rs.getString("n_title"), rs.getString("n_content"),
						 rs.getInt("n_count"), rs.getDate("n_date")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
		
	}

