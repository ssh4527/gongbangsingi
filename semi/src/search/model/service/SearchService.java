package search.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import review.model.vo.Review;
import search.model.dao.SearchDao;
import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;

public class SearchService {

	public SearchService() {
	}

	public ArrayList<Workclass> searchClass(String keyword) {
		Connection c = getConnection();

		ArrayList<Workclass> list = new SearchDao().searchClass(keyword, c);
		close(c);
		return list;
	}

	public String findKeyword(String searchinput) {
		Connection c = getConnection();
		SearchDao sd = new SearchDao();
		String keyword = sd.findKeyword(c, searchinput);
		if (keyword != "nothing") {
			
			int result = sd.upCount(c, keyword);
			if (result > 0) {
				commit(c);
			} else {
				rollback(c);
			}
		}
		close(c);
		return keyword;
	}

	public ArrayList<Workclass> findClassName(String searchinput) {
		Connection c = getConnection();
		SearchDao sd = new SearchDao();
		ArrayList<Workclass> list = sd.findClassName(c, searchinput);
		System.out.println("여기옴");
		if(!list.isEmpty()) {
			int result = sd.insertKeyword(c, searchinput);
			if(result > 0) {
				commit(c);
			}else {
				rollback(c);
			}
		}
		close(c);
		return list;
	}

	public ArrayList<Workshop> searchWorkshop(String keyword) {
		Connection c = getConnection();

		ArrayList<Workshop> list = new SearchDao().searchWorkshop(keyword, c);
		if(!list.isEmpty()) {
			int result = new SearchDao().upCount(c, keyword);
			if (result > 0) {
				commit(c);
			} else {
				rollback(c);
			}
		}
		close(c);
		return list;
	}

	public ArrayList<Workshop> findWorkshopName(String searchinput) {
		Connection c = getConnection();
		
		ArrayList<Workshop> list = new SearchDao().findWorkshopName(c, searchinput);
		
		close(c);
		return list;
	}

	// 검색된 각각의 클래스들의 평균 평점을 가져오는 메소드 (By. H)
	public double avgGrade(String wcNo) {
		Connection conn = getConnection();
		
		double avgGrade = new SearchDao().avgGrade(wcNo, conn);
		
		close(conn);
		
		return avgGrade;
	}

	// 검색된 각각의 클래스들의 리네임과 패스값 가져오는 메소드 (By. H)
	public Workclass selectPathRename(String wcNo) {
		Connection conn = getConnection();
		
		Workclass prewc = new SearchDao().selectPathRename(wcNo, conn);
		
		close(conn);
		
		return prewc;
	}

	public ArrayList<Workclass> findClass(String[] interest) {
		Connection c = getConnection();
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		
		SearchDao sd = new SearchDao();
		if(interest ==null) {
			list = sd.findClassTop(c);
		}else {
			
			for(int i=0;i<interest.length;i++) {
				
				list = sd.findClass(c, interest[i], list);
			}
			
		}
		
		
		close(c);
		return list;
	}

	public String[] topKeyword() {
		Connection c = getConnection();
		String[] keyword = new SearchDao().topKeyword(c);
		
		close(c);
		return keyword;
	}

	public ArrayList<Map> selectYearStatistics(int year) {
		Connection c = getConnection();
		ArrayList<Map> statistics = new ArrayList<Map>();
		year = year-2000;
		for(int m=1; m<=12; m++) {
			statistics.add(new SearchDao().selectYearStatistics(c,m,year));
			
		}
		
		return statistics;
	}

	public ArrayList<Map> selectMonthStatistics(int year, int month) {
		Connection c = getConnection();
		ArrayList<Map> statistics = new ArrayList<Map>();
	
	    int END_DAY = 0;
	    Calendar eDay = Calendar.getInstance();
	    eDay.set(year, month, 1-1);
	    END_DAY = eDay.get(Calendar.DATE);
	   
		year= year-2000;
		
		for(int d=1; d<=END_DAY; d++) {
		
			
				statistics.add(new SearchDao().selectMonthStatistics(c,month,year,d));
			
		}
		return statistics;
	}

	public ArrayList<String> selectCategory() {
		Connection c = getConnection();
		ArrayList<String> category = new SearchDao().selectCategory(c);
		
		close(c);
		return category;
	}

	// 검색된 클래스들의 시작날짜랑 끝나는 날짜 가져오는 서블릿 by.h 20191220
	public Workclass selectDate(String wcNo) {
		Connection conn = getConnection();
		Workclass wc = new SearchDao().selectDate(wcNo,conn);
		close(conn);
		return wc;
	}

	// 인기순 정렬 by.h
	public ArrayList<Workclass> searchSortClass(String keyword) {
		Connection c = getConnection();

		ArrayList<Workclass> list = new SearchDao().searchSortClass(keyword, c);
		close(c);
		return list;
	}

	public ArrayList<Review> searchAllReview() {
		Connection c = getConnection();
		
		ArrayList<Review> list = new SearchDao().searchAllReview(c);
		
		close(c);
		return list;
	}


	
}
