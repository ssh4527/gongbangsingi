package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

public class MypageDao {

	private Properties prop = new Properties();
	
	public MypageDao() {
		String fileName = MypageDao.class.getResource("/sql/mypage/mypage-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 1. 예약 목록 확인
	public ArrayList<Reservation> selectList(String uId,Connection conn) {
		ArrayList<Reservation> list = new ArrayList<>();
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Reservation(rset.getDate("res_Date"), rset.getString("ws_name"), rset.getString("wc_name"), rset.getInt("res_Nop"),
						 rset.getInt("total_price")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	//2. 후기내역 확인
	public ArrayList<Review> selectReviewList(String uId, Connection conn) {
		ArrayList<Review> relist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQNA");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				relist.add(new Review(rset.getString("wc_name"),rset.getString("r_title"),rset.getString("r_content"),rset.getDate("r_ent_date"),rset.getInt("r_grade")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return relist;
	}

	public ArrayList<Qna> selectQnaList(String uId, Connection conn) {
        ArrayList<Qna> qnalist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rset = pstmt.executeQuery();
			System.out.println(sql);
			while (rset.next()) {
				qnalist.add(new Qna(rset.getString("Q_TITLE"),rset.getString("Q_CONTENT"),rset.getDate("Q_ENT_DATE"),rset.getString("Q_REPLAY_CK")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return qnalist;
	}

}
