package reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import payment.model.vo.Payment;

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
		
		String sql = "update client set c_point = c_point + ? where c_id = ?";
		
		try {
			System.out.println("updatepoint  totalprice :" + totalprice);
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

	// rno 가져오는부분
	public Reservation selectRno(String wcNo, String cId, Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		Reservation res = new Reservation();
		ResultSet rset = null;
		
		String sql = "select res_code from reservation where wc_No = ? and c_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			pstmt.setString(2, cId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				res.setResCode(rset.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return res;
	}

	public int insertPayment(Payment pay,Connection conn) {
		PreparedStatement pstmt  = null;
		int result = 0;
		
		String sql = "insert into payment values('PCODE' || PAY_SEQ.NEXTVAL, SYSDATE, '카드', ? )";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pay.getResCode());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	// 유저 예약정보 가져오기 ssh
	public ArrayList<Integer> selectUserReservation(String userId, Connection c) {
		PreparedStatement ps  = null;
		ResultSet rset = null;
		ArrayList<Integer> list = new ArrayList<>();
		int totalprice = 0;
		int reservationcount = 0;
		
		String q= "select * from reservation where c_id = ? and RES_DATE >= sysdate";
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, userId);
			rset = ps.executeQuery();
			while(rset.next()) {
				totalprice += (rset.getInt("TOTAL_PRICE"));
				reservationcount++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(ps);
			close(rset);
		}
		list.add(totalprice);
		list.add(reservationcount);
		
		return list;
	}
}
