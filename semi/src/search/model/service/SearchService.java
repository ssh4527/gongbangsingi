package search.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import search.model.dao.SearchDao;
import workclass.model.vo.Workclass;

public class SearchService {

	public SearchService() {}
	
	public ArrayList<Workclass> searchClass(String keyword) {
		Connection c= getConnection();
		
		ArrayList<Workclass> list = new SearchDao().searchClass(keyword, c);
		close(c);
		return list;
	}

	public String findText(String searchinput) {
		Connection c= getConnection();
		
		String keyword = new SearchDao().findText(c,searchinput);
		close(c);
		return keyword;
	}

}
