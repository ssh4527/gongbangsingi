package workshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import workshop.model.dao.ShopDao;
import workshop.model.vo.Workshop;
import static common.JDBCTemplate.*;

public class ShopService {

	public ArrayList<Workshop> selectShopList() {
		Connection con = getConnection();
		
		ArrayList<Workshop> list = new ShopDao().selectShopList(con);
		
		return list;
	}

}
