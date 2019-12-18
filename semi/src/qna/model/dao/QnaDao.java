package qna.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import qna.model.vo.Qna;

public class QnaDao {
	private Properties prop = new Properties();

	public QnaDao() {
		String fileName = Qna.class.getResource("/sql/qna/qna-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Qna> selectList(Connection conn) {
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Qna(rs.getString("q_no"),
						rs.getString("c_id"),
						rs.getString("q_title"),
						rs.getString("q_content"), rs.getDate("q_ent_date"), rs.getString("q_secret"),
						/*rs.getBoolean("q_replay_ck"), */
						/*rs.getString("wc_no"), */
						rs.getInt("q_count")/*,
						rs.getString("q_pwd")*/));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertQna(Connection conn, Qna q) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertQna");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getcId());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setString(4, q.getqSecret());
			pstmt.setString(5, q.getWcNo());
			pstmt.setString(6, q.getqPwd());
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int increaseCount(Connection conn, String qno) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Qna selectQna(Connection conn, String qno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Qna q=null;
		String query=prop.getProperty("selectQna");
		 try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,qno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q=new Qna(rs.getString("q_no"), rs.getString("c_id"),rs.getString("q_title"),
						rs.getString("q_content"),rs.getDate("q_ent_date"), rs.getString("q_secret"),
						rs.getString("q_replay_ck"),
						rs.getString("wc_no"),
						rs.getInt("q_count"),
						rs.getString("q_pwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return q;
	}

	public int deleteQna(Connection conn, String qno) {
		int result=0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteQna");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
