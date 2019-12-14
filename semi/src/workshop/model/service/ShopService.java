package workshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.Attachment;
import review.model.vo.Review;
import workclass.model.vo.Workclass;
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

	public Attachment selectThumbnail(String wsNo) {
		Connection con = getConnection();

		Attachment at = new ShopDao().selectThumbnail(con, wsNo);

		close(con);

		return at;
	}
	
	public int insertThumbnail(String wsNo, Attachment file) {
		Connection con = getConnection();

		int result = new ShopDao().insertThumbnail(con, wsNo,file);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return result;
	}
	
	public int updateThumbnail(String wsNo, Attachment file) {
		Connection con = getConnection();

		int result = new ShopDao().updateThumbnail(con, wsNo,file);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return result;
	}
	
	public int updateIntro(String wsNo, String input) {
		Connection con = getConnection();

		int result = new ShopDao().updateIntro(con, wsNo,input);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return result;
	}
	

	public ArrayList<Review> selectReviewList(String wsNo) {
		Connection con = getConnection();
		
		ArrayList<Review> list = new ShopDao().selectReviewList(con, wsNo);

		close(con);

		return list;
	}

	public ArrayList<Workclass> selectClassList(String wsNo) {
		Connection con = getConnection();
		
		ArrayList<Workclass> list = new ShopDao().selectClassList(con,wsNo);
		close(con);
		
		return list;
	}
	
	public ArrayList<Attachment> selectClassPictures(String wsNo) {
		Connection con = getConnection();

		ArrayList<Attachment> list = new ShopDao().selectClassPictures(con, wsNo);

		close(con);

		return list;
	}

	public ArrayList<Attachment> selectShopListPic() {
		Connection con = getConnection();

		ArrayList<Attachment> list = new ShopDao().selectShopListPic(con);

		close(con);

		return list;
	}

	public ArrayList<Workshop> selectSortlist(String sortType) {
		Connection con = getConnection();

		
		ArrayList<Workshop> list = new ShopDao().selectSortlist(con,sortType);
		
		close(con);

		return list;
	}

	// 승인 안된 공방 가져오기
	public ArrayList<Workshop> selectNewShopList() {
		Connection con = getConnection();
		
		ArrayList<Workshop> list = new ShopDao().selectNewShopList(con);
		
		close(con);

		return list;
	}

	

	
}
