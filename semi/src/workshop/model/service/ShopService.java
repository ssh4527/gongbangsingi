package workshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.Attachment;
import workshop.model.dao.ShopDao;
import workshop.model.vo.Workshop;
import static common.JDBCTemplate.*;

public class ShopService {

	public ArrayList<Workshop> selectShopList() {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectShopList(con);

		close(con);

		return list;
	}

	public Workshop selectShop(String wsNo) {
		Connection con = getConnection();
		Workshop shop = new ShopDao().selectShop(con, wsNo);
		close(con);

		return shop;
	}

	public ArrayList<Attachment> selectPictures(String wsNo) {
		Connection con = getConnection();

		ArrayList<Attachment> list = new ShopDao().selectPictures(con, wsNo);

		close(con);

		return list;
	}

	public int updateThumbnail(String wsNo, Attachment file) {
		Connection con = getConnection();

		int result = new ShopDao().updateThumbnail(con, wsNo,file);

		close(con);

		return result;
	}
}
