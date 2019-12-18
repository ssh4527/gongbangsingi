package search.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

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

	public ArrayList<Map> selectstatistics() {
		Connection c = getConnection();
		ArrayList<Map> statistics = new ArrayList<Map>();
		for(int m=9; m<12; m++) {
			statistics.add(new SearchDao().selectstatistics(c,m));
			
		}
		
		return statistics;
	}

	public ArrayList<String> selectCategory() {
		Connection c = getConnection();
		ArrayList<String> category = new SearchDao().selectCategory(c);
		
		close(c);
		return category;
	}

	
}
