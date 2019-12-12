package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import reservation.model.vo.Reservation;

public class MypageDao {

	private Properties prop = new Properties();
	
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
				list.add(new Reservation(rset.getDate("resDate"), rset.getString("resCode"), rset.getInt("resNop"),
						 rset.getInt("totalPrice")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

}
