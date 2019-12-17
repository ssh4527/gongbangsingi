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
		String q=  "select * from work_class where ws_no in "
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

	// 검색된 각각의 클래스들의 평균 평점을 가져오는 메소드 (By. H)
	public double avgGrade(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		double avgGrade = 0;
		
		String sql = "select avg(r_grade) from review where wc_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				avgGrade = rset.getDouble(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return avgGrade;
	}

	// 검색된 각각의 클래스들의 리네임과 패스값 가져오는 메소드 (By. H)
	public Workclass selectPathRename(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Workclass prewc = new Workclass();
		String sql = "select fs_rename_file, fs_path from (select fs_rename_file, fs_path, rownum as rnum from file_storage where fs_destination = ? order by fs_no desc) where rnum = 1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				prewc.setRename(rset.getString(1));
				prewc.setPath(rset.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		// TODO Auto-generated method stub
		return prewc;
	}

	public ArrayList<Workclass> findClassTop(Connection c) {
		Statement s = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		ResultSet rs = null;
		
		String q=  "select * from work_class wc, (select AVG(R_GRADE) 평점 ,wc_no from review group by wc_no) r where wc.wc_no = r.wc_no order by 평점 desc"; 
		
		try {
			s= c.createStatement();
			rs = s.executeQuery(q);
			
			int count = 0;
			
			while(rs.next()) {
				if(count >= 3) {break;}
				
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
						rs.getString("WS_NO"),
						rs.getDouble("평점")
						));
				
				count++;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(s);
		}
		
		return list;
	}

	public ArrayList<Workclass> findClass(Connection c, String interest, ArrayList<Workclass> list) {
		
		String q = "select * from work_class wc, (select AVG(R_GRADE) 평점 ,wc_no from review group by wc_no)r, workshop ws where wc.wc_no = r.wc_no and wc.ws_no = ws.ws_no and ws.s_category in (?) order by 평점 desc";
//		String q= "select * from work_class wc, workshop ws " + 
//				"where wc.ws_no = ws.ws_no and ws.s_category in (?)";
		PreparedStatement ps = null;
		ResultSet rs =null;
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, interest);
			
			int count = 0;
			rs = ps.executeQuery();
			while(rs.next()) {
				if(count >3) {break;}
				
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
						,rs.getDouble("평점")
						));
				
				count++;
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
