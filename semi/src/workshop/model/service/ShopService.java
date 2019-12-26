package workshop.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import review.model.vo.Review;
import workclass.model.vo.ClassFile;
import workclass.model.vo.Workclass;
import workshop.model.dao.ShopDao;
import workshop.model.vo.ShopFile;
import workshop.model.vo.Workshop;

public class ShopService {

	//공방리스트 가져오기
	public ArrayList<Workshop> selectShopList() {
		Connection con = getConnection();

		ArrayList<Workshop> list = new ShopDao().selectShopList(con);

		close(con);

		return list;
	}

	//해당 공방 가져오기
	public Workshop selectShop(String wsNo) {
		Connection con = getConnection();
		Workshop shop = new ShopDao().selectShop(con, wsNo);
		close(con);

		return shop;
	}

	//공방 썸네일 가져오기
	public ShopFile selectThumbnail(String wsNo) {
		Connection con = getConnection();

		ShopFile at = new ShopDao().selectThumbnail(con, wsNo);

		close(con);

		return at;
	}

	//공방 썸네일 등록하기
	public int insertThumbnail(String wsNo,ShopFile file) {
		Connection con = getConnection();
		int result = new ShopDao().insertThumbnail(con, wsNo, file);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}
	
	//썸네일 수정하기
	public int updateThumbnail(String wsNo, ShopFile file) {
		Connection con = getConnection();
		int result = new ShopDao().updateThumbnail(con, wsNo, file);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}
	
	//공방 소개글 업데이트하기
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

	//공방 후기 목록 가져오기
	public ArrayList<Review> selectReviewList(String wsNo) {
		Connection con = getConnection();

		ArrayList<Review> list = new ShopDao().selectReviewList(con, wsNo);

		close(con);

		return list;
	}

	//공방 클래스 목록 가져오기 
	public ArrayList<Workclass> selectClassList(String wsNo) {
		Connection con = getConnection();

		ArrayList<Workclass> list = new ShopDao().selectClassList(con, wsNo);
		close(con);

		return list;
	}

	//클래스 사진들 가져오기
	public ArrayList<ClassFile> selectClassPictures(String wsNo) {
		Connection con = getConnection();

		ArrayList<ClassFile> list = new ShopDao().selectClassPictures(con, wsNo);

		close(con);

		return list;
	}

	//공방 썸네일들 가져오기
	public ArrayList<ShopFile> selectShopListPic() {
		Connection con = getConnection();

		ArrayList<ShopFile> list = new ShopDao().selectShopListPic(con);

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


	//전환 신청하여 insert하기
	public int requestToChangeShop(String userId, String shopName, String shopAddr, String sns, String tel,
			String num, String account, String intro, String category) {
		Connection con = getConnection();

		int result = new ShopDao().requestToChangeShop(con,userId,shopName,shopAddr,sns,tel,num,account,intro,category);

		close(con);

		return result;
	}
	// 인덱스 페이지 새로운 공방
	public ArrayList<Workshop> newWorkShopList() {
		Connection c = getConnection();
		ArrayList<Workshop> list = new ShopDao().newWorkShopList(c);
		
		close(c);
		return list;
	}

	public Workshop getFilePathReName(String wsNo) {
		Connection con = getConnection();
		Workshop result = new ShopDao().getFilePathReName(con,wsNo);
		close(con);
		return result;
	}
	//현재 있는 카테고리 가져오기
	public ArrayList<String> getCategory() {
		Connection con = getConnection();
		ArrayList<String> categoryList = new ShopDao().getCategory(con);
		close(con);
		return categoryList;
	}

	//공방 평점들 가져오기
	public HashMap<String, Double> selectGradeList() {
		Connection con = getConnection();
		HashMap<String,Double> GradeList = new ShopDao().selectGradeList(con);
		close(con);
		return GradeList;
	}
	
	//해당 공방 평점 가져오기
	public Double getGrade(String wsNo) {
		Connection con = getConnection();
		Double Grade = new ShopDao().getGrade(con,wsNo);
		close(con);
		return Grade;
	}


	

}
