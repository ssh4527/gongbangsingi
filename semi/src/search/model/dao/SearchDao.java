package search.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;

public class SearchDao {

	public SearchDao() {}
	
	public ArrayList<Workclass> searchClass(String findtext, Connection c) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		String q=  "select * from work_class where ws_no = "
				+ "(select WS_NO from workshop where S_CATEGORY = ?)";
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

	public String findKeyword(Connection c, String searchinput) {
		String compare = "";
		String text = "nothing";
		Statement s = null;
		
		ResultSet rs = null;
		String q = "";
		
			q =  "select S_CATEGORY from search";
		
		
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

	public int upCount(Connection c, String keyword) {
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update search set S_COUNT=S_COUNT+1 where S_CATEGORY=?";
		try {
			ps = c.prepareStatement(sql);
			ps.setString(1, keyword);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ps);
		}
		
		return result;
	}

	public ArrayList<Workclass> findClassName(Connection c, String searchinput) {
		
		PreparedStatement ps = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		ResultSet rs = null;
		
		String q=  "select * from work_class where WC_NAME LIKE ('%'||?||'%')"; 
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, searchinput);
			
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

	public ArrayList<Workshop> searchWorkshop(String keyword, Connection c) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Workshop> list = new ArrayList<Workshop>();
		;
		String q = "select ws.ws_no,te.총합,ws_name,S_CATEGORY from  (select wc.ws_no,AVG(R_GRADE)as 총합 from REVIEW r,work_class wc where r.wc_no = wc.wc_no group by wc.ws_no) te,workshop ws where ws.ws_no = te.ws_no and S_CATEGORY = ?";
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, keyword);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Workshop(rs.getString(1),rs.getString(3),rs.getString(4),rs.getDouble(2)));
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
	
		return list;
	}

	public ArrayList<Workshop> findWorkshopName(Connection c, String searchinput) {
		PreparedStatement ps = null;
		ArrayList<Workshop> list = new ArrayList<Workshop>();
		ResultSet rs = null;
		
		String q = "select ws.ws_no,te.총합,ws_name,S_CATEGORY from  (select wc.ws_no,AVG(R_GRADE)as 총합 from REVIEW r,work_class wc where r.wc_no = wc.wc_no group by wc.ws_no) te,workshop ws where ws.ws_no = te.ws_no and WS_NAME LIKE ('%'||?||'%')";
		
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, searchinput);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Workshop(rs.getString(1),rs.getString(3),rs.getString(4),rs.getDouble(2)));
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

}
