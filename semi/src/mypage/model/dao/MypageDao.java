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

import reservation.model.vo.Reservation;

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
		System.out.println(list);
		return list;
		
	}

}
