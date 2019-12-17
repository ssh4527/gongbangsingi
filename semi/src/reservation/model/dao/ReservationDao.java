package reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static common.JDBCTemplate.*;
import reservation.model.vo.Reservation;

public class ReservationDao {

	public int insertReservation(Reservation res, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "insert into reservation values('ResNo' || RES_SEQ.NEXTVAL,'결제완료',?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res.getResNop());
			pstmt.setInt(2, res.getTotalPrice());
			pstmt.setString(3, res.getCid());
			pstmt.setString(4, res.getResDate());
			pstmt.setString(5, res.getWcNo());
			pstmt.setString(6, res.getClasstime());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 포인트 업데이트
	public int updatepoint(String cId, int totalprice, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update client set c_point = ? where c_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1,totalprice*0.05);
			pstmt.setString(2, cId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
