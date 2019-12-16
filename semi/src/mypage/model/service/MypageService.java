package mypage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MypageDao;
import reservation.model.vo.Reservation;

public class MypageService {

	public ArrayList<Reservation> selectList(String uId) {
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new MypageDao().selectList(uId,conn);
		
		close(conn);
		return list;
		
	}
	
	

}
