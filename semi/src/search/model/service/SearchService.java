package search.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
		close(c);
		return list;
	}

	public ArrayList<Workshop> searchWorkshop(String keyword) {
		Connection c = getConnection();

		ArrayList<Workshop> list = new SearchDao().searchWorkshop(keyword, c);
		close(c);
		return list;
	}

	public ArrayList<Workshop> findWorkshopName(String searchinput) {
		Connection c = getConnection();
		
		ArrayList<Workshop> list = new SearchDao().findWorkshopName(c, searchinput);
		close(c);
		return list;
	}

	
}
