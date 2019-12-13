package qna.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
				list.add(new Qna(rs.getString("qno"), // 여기서 오류 -> 부적합한 열 이름
						rs.getString("cid"),
						rs.getString("qtitle"),
						rs.getString("qcontent"), rs.getDate("qentdate"), rs.getBoolean("qsecret"),
						rs.getBoolean("qreplayck"), rs.getString("wcno"), rs.getInt("qcount"), rs.getString("qpwd")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
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
			pstmt.setBoolean(4, q.isqSecret());
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

}
