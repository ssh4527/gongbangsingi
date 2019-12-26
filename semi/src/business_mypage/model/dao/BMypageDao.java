package business_mypage.model.dao;

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
import reservation.model.vo.Reservation;
import review.model.vo.Review;

public class BMypageDao {

	private Properties prop = new Properties();
	
	public BMypageDao() {
		String fileName = BMypageDao.class.getResource("/sql/b_mypage/Bmypage-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String selectWsNo(String userId, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select ws_no from workshop where c_id =?";
		String wsNo = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				wsNo = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return wsNo;
	}
	

	// 1. 예약 목록 확인
	public ArrayList<Reservation> selectList(String wNo,Connection conn) {
		ArrayList<Reservation> list = new ArrayList<>();
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wNo);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Reservation(rset.getString("res_Date"), rset.getString("c_name"), rset.getString("wc_name"), rset.getInt("res_Nop"),
						 rset.getInt("total_price"), rset.getString("res_state")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
		
	}

	//2. 후기내역 확인
	public ArrayList<Review> selectReviewList(String wNo, Connection conn) {
		ArrayList<Review> relist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				relist.add(new Review(rset.getString("c_name"),rset.getString("wc_name"),rset.getString("r_title"),rset.getString("r_content"),rset.getDate("r_ent_date"),rset.getInt("r_grade")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return relist;
	}

	public ArrayList<Qna> selectQnaList(String wNo, Connection conn) {
        ArrayList<Qna> qnalist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQNA");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wNo);
			rset = pstmt.executeQuery();
			System.out.println(sql);
			while (rset.next()) {
				Qna q = new Qna();
				q.setcName(rset.getString("c_name"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setqEntdate(rset.getDate("q_ent_date"));
				q.setqReplayck(rset.getString("q_replay_ck"));
				qnalist.add(q);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return qnalist;
	}

	public int deleteMember(String uId, Connection conn) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int showMyLevel(String wsNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("purchaseMuch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wsNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int selectProgress(String wsNo, Connection conn) {
		int prog = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProgress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wsNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				prog = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return prog;
	}
	
	public int updateAddress(String wsNo,String naddr, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, naddr);
			pstmt.setString(2, wsNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
