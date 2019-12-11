package search.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import workclass.model.vo.Workclass;

public class SearchDao {

	public SearchDao() {}
	
	public ArrayList<Workclass> searchClass(String findtext, Connection c) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		String q=  "select * from work_class where ws_no = "
				+ "(select WS_NO from workshop where WS_CATEGORY = ?)";
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, findtext);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				boolean accept = false;
				if(rs.getString("WC_YN")=="Y") {
					accept=true;
				}
				
				list.add(new Workclass(rs.getString("WC_NO"),
						rs.getString("WC_NAME"),
						rs.getInt("WC_NOP"),
						rs.getInt("WC_MAXP"),
						accept,
						rs.getString("WC_DATE"),
						rs.getInt("WC_HITS"),
						rs.getString("WC_WARNING"),
						rs.getString("WC_INTRODUCE"),
						rs.getString("WS_NO")
						));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public String findText(Connection c, String searchinput) {
		String compare = "";
		String text = "";
		Statement s = null;
		ResultSet rs = null;
		
		String q=  "select S_CATEGORY from search"; 
		try {
			s = c.createStatement();
			rs = s.executeQuery(q);
			while(rs.next()) {
				
				compare = rs.getString(1);
				if(searchinput.contains(compare)) {
					text = compare;
				}
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(s);
		}
		
		return text;
	}

}
