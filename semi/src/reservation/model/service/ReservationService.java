package reservation.model.service;

import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import static common.JDBCTemplate.*;

import java.sql.Connection;


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

}
