package reservation.model.service;

import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import static common.JDBCTemplate.*;

import java.sql.Connection;

import payment.model.vo.Payment;


public class ReservationService {

	// 예약하기!!
	public int insertReservation(Reservation res) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().insertReservation(res,conn);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 결제후 포인트 증가시키는부분
	public int updatepoint(String cId, int totalprice) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().updatepoint(cId,totalprice,conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// rno 가져오는부분
	public Reservation selectRno(String wcNo, String cId) {
		Connection conn = getConnection();
		
		Reservation preres = new ReservationDao().selectRno(wcNo,cId,conn);
		close(conn);
		return preres;
	}

	// 페이먼트 집어넣는 부분
	public int insertPatment(Payment pay) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().insertPayment(pay,conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	// 사용자가 사용한 금액 가져오기 ssh
	public ArrayList<Integer> selectUserReservation(String userId) {
		Connection c = getConnection();
		
		ArrayList<Integer> result = new ReservationDao().selectUserReservation(userId,c);
		
		close(c);
		return result;
	}
}
