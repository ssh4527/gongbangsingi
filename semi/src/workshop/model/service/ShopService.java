package workshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import attachment.Attachment;
import member.model.dao.MemberDao;
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

	public int insertThumbnail(String wsNo, String fileBtnN, Attachment file) {
		Connection con = getConnection();
		int result = 0;
		if (fileBtnN.equals("사진 등록")) {
			result = new ShopDao().insertThumbnail(con, wsNo, file);
		} else {
			result = new ShopDao().updateThumbnail(con, wsNo, file);
		}
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int updateIntro(String wsNo, String input) {
		Connection con = getConnection();

		int result = new ShopDao().updateIntro(con, wsNo, input);

		if (result > 0) {
			System.out.println("성공");
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		System.out.println(result);
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

		ArrayList<Workclass> list = new ShopDao().selectClassList(con, wsNo);
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

	
	// 승인 안된 공방 가져오기
	public ArrayList<Workshop> selectNewShopList() {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectNewShopList(con);

		close(con);

		return list;
	}

	
	//정렬 (최신순, 인기순)
public ArrayList<Workshop> selectSortlist(String sortType) {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectSortlist(con,sortType);
		
		close(con);

		return list;
	}

	// 승인 안된 공방회원전환 요청 가져오기
	public ArrayList<Workshop> selectNewShopList() {
		Connection con = getConnection();
		ArrayList<Workshop> list = new ShopDao().selectSortlist(con, sortType);
		close(con);

		return list;
	}
	// 공방 상세페이지 확인
	public ArrayList<Workshop> selectCheckShopList() {
		Connection con = getConnection();
		
		ArrayList<Workshop> list = new ShopDao().selectCheckShopList(con);
		
		close(con);

		return list;
	}

	public int changeAuth(String id) {
		Connection c= getConnection();
		
		int result = new ShopDao().changeAuth(c,id);
		if(result>0) {
			commit(c);
		}else {
			rollback(c);
		}
		close(c);
		return result;
	}

	//카테고리별
	public ArrayList<Workshop> selectedCategory(String category) {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectedCategory(con, category);

		close(con);

		return list;
	}

	//카테고리 && 정렬
	public ArrayList<Workshop> selectCSortlist(String sortType, String category) {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectCSortlist(con, sortType,category);

		close(con);

		return list;
	}

}
