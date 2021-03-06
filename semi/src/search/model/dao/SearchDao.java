package search.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import review.model.vo.Review;
import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;

public class SearchDao {

	public SearchDao() {}
	
	public ArrayList<Workclass> searchClass(String findtext, Connection c) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		String q=  "select * from work_class where ws_no in "
				+ "(select WS_NO from workshop where S_CATEGORY = ?) and WC_YN='Y'";
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
		
		String q=  "select * from work_class where WC_NAME LIKE ('%'||?||'%') and WC_YN='Y' "; 
		
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
		
		String q = "select ws.ws_no,te.총합,ws_name,S_CATEGORY,ws_addr,ws_enrollDate from  (select wc.ws_no,round(AVG(R_GRADE),1)as 총합 from REVIEW r,work_class wc where r.wc_no = wc.wc_no group by wc.ws_no) te,workshop ws where ws.ws_no = te.ws_no and S_CATEGORY = ? and ws.ENROLLYN='Y'";
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, keyword);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Workshop(rs.getString(1),rs.getString(3),rs.getString(4),rs.getDouble(2),rs.getString(5),rs.getDate(6)));
				
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
		
		String q = "select ws.ws_no,te.총합,ws_name,S_CATEGORY,ws_addr,ws_enrollDate from  (select wc.ws_no,round(AVG(R_GRADE),1)as 총합 from REVIEW r,work_class wc where r.wc_no = wc.wc_no and wc_yn='Y' group by wc.ws_no) te,workshop ws where ws.ws_no = te.ws_no and ws.ENROLLYN='Y' and WS_NAME LIKE ('%'||?||'%')";
		
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, searchinput);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Workshop(rs.getString(1),rs.getString(3),rs.getString(4),rs.getDouble(2),rs.getString(5),rs.getDate(6)));
				
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
		String sql = "select fs_rename_file, fs_path from (select fs_rename_file, fs_path, rownum as rnum from file_storage where fs_destination = ? and fs_level=0 order by fs_no desc) where rnum = 1";
		
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
		
		String q=  "select * from work_class wc, (select round(AVG(R_GRADE),1) 평점 ,wc_no from review group by wc_no) r where wc.wc_no = r.wc_no and wc_yn='Y' order by 평점 desc"; 
		
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
		
		String q = "select * from work_class wc, (select round(AVG(R_GRADE),1) 평점 ,wc_no from review group by wc_no)r, workshop ws where wc.wc_no = r.wc_no and  wc.ws_no = ws.ws_no and wc_yn='Y' and EnRollYN='Y' and ws.s_category in (?) order by  평점 desc";

		PreparedStatement ps = null;
		ResultSet rs =null;
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, interest);
			
			int count = 0;
			rs = ps.executeQuery();
			while(rs.next()) {
				if(count >=3) {break;}
				
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

	public String[] topKeyword(Connection c) {
		Statement st = null;
		ResultSet rs = null;
		int i=0;
		String[] keyword = new String[5];
		String q = "SELECT s_category FROM (SELECT s_count, s_category,RANK() OVER(ORDER BY s_count DESC) AS 순위 FROM search ORDER BY s_count DESC) where 순위 <= 5";
		try {
			st = c.createStatement();
			rs = st.executeQuery(q);
			while(rs.next()) {
				keyword[i++] = rs.getString(1);
				if(i==5) break;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(st);
		}
		
		
		
		return keyword;
	}

	public int insertKeyword(Connection c, String searchinput) {
		int result =0;
		PreparedStatement ps = null;
		String q = "insert into search values(?,1)";
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, searchinput);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(ps);
		}
		return result;
	}

	public Map selectYearStatistics(Connection c,int m,int year) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Map<String,String> map = new HashMap<String,String>();
		String q = "select sum(total_price),s_category from reservation rs,work_class wc,workshop ws where rs.wc_no = wc.wc_no and ws.ws_no = wc.ws_no and SUBSTR(res_date, 4, 2)=? and SUBSTR(res_date, 1, 2) = ? group by s_category";
		try {
			ps = c.prepareStatement(q);
			
			ps.setInt(1, m);
			ps.setInt(2, year);
			rs = ps.executeQuery();
			while(rs.next()) {
				map.put(rs.getString(2), rs.getString(1));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		return map;
	}

	public Map selectMonthStatistics(Connection c, int month, int year, int day) {
		String q = "select sum(total_price),s_category from reservation rs,work_class wc,workshop ws where rs.wc_no = wc.wc_no and ws.ws_no = wc.ws_no and SUBSTR(res_date, 4, 2)=? and SUBSTR(res_date, 1, 2) = ? and SUBSTR(res_date, 7, 2) = ? group by s_category";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Map<String,String> map = new HashMap<String,String>();
		
		try {
			ps = c.prepareStatement(q);
			
			ps.setInt(1, month);
			ps.setInt(2, year);
			ps.setInt(3, day);
			rs = ps.executeQuery();
			while(rs.next()) {
				map.put(rs.getString(2), rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
	
		return map;
	}

	public ArrayList<String> selectCategory(Connection c) {
		String q = "select distinct s_category from workshop";
		Statement st = null;
		ResultSet rs =null;
		ArrayList<String> category = new ArrayList<String>();
		try {
			st = c.createStatement();
			rs=st.executeQuery(q);
			while(rs.next()) {
				category.add(rs.getString(1));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(st);
		}
		return category;
	}

	// 검색된 클래스들의 시작날짜랑 끝나는 날짜 가져오는 서블릿 by.h 20191220
	public Workclass selectDate(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Workclass wc =  new Workclass();
		String sql = "select to_date(ct_date) , to_date(ct_enddate) from class_time where wc_No = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				wc.setStartdate(rset.getDate(1));
				wc.setEnddate(rset.getDate(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wc;
	}

	public ArrayList<Workclass> searchSortClass(String keyword, Connection c) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		String q=  "select * from work_class where ws_no in "
				+ "(select WS_NO from workshop where S_CATEGORY = ?)";
		try {
			ps= c.prepareStatement(q);
			ps.setString(1, keyword);
			
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

	public ArrayList<Review> searchAllReview(Connection c, int currentPage, int boardLimit) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Review> list = new ArrayList<Review>();
		String q= "select * from(select rownum rnum,r.wc_no,r_no,c.c_id,c_name,r_title,r_ent_date,r_content,r_view_cnt,r_grade,wc_name from review r, work_class wc, client c where r.wc_no = wc.wc_no and c.c_id = r.c_id) where rnum between ? and ?";
		
		
		try {
			ps = c.prepareStatement(q);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Review(rs.getString("r_no"),
						rs.getString("r_title"),
						rs.getDate("r_ent_date"),
						rs.getString("r_content"),
						rs.getInt("r_view_cnt"),
						rs.getInt("r_grade"),
						rs.getString("c_name"),
						rs.getString("c_id"),
						rs.getString("wc_name"),
						rs.getString("wc_no")));
				
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		return list;
	}

	public ArrayList<Review> searchReview(Connection c, String src, String sri, int cp, int bl) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Review> list = new ArrayList<Review>();
		String q= "select * from(select rownum rnum,r.wc_no,r_no,c.c_id,c_name,r_title,r_ent_date,r_content,r_view_cnt,r_grade,wc_name from review r, work_class wc, client c where r.wc_no = wc.wc_no and c.c_id = r.c_id";
		
		String sql = "";
		if(src.equals("writer")) {
			sql = " and c_name like ('%'||?||'%')";
		}else if (src.equals("title")) {
			sql = " and r_title like ('%'||?||'%')";
		}else if (src.equals("classname")){
			sql = " and wc_name like ('%'||?||'%')";
		}else {
			sql = " and wc.ws_no = ?";
		}
		q += sql + ") where rnum between ? and ?";
		
		try {
			ps = c.prepareStatement(q);
			int startRow = (cp - 1) * bl + 1;
			int endRow = startRow + bl - 1;

			ps.setInt(2, startRow);
			ps.setInt(3, endRow);
			ps.setString(1, sri);
			rs =  ps.executeQuery();
			while(rs.next()) {
				list.add(new Review(rs.getString("r_no"),
						rs.getString("r_title"),
						rs.getDate("r_ent_date"),
						rs.getString("r_content"),
						rs.getInt("r_view_cnt"),
						rs.getInt("r_grade"),
						rs.getString("c_name"),
						rs.getString("c_id"),
						rs.getString("wc_name"),
						rs.getString("wc_no")));
				
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		return list;
	}

	public int getReviewCount(Connection c) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = "SELECT COUNT(*) FROM review";

		try {
			stmt = c.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public int getReviewCount(Connection c, String sRC, String sRI) {
		int listCount = 0;

		PreparedStatement ps = null;
		ResultSet rset = null;

		String q = "SELECT COUNT(*)  from review r, work_class wc, client c  where r.wc_no = wc.wc_no and c.c_id = r.c_id ";
		String sql = "";
		if(sRC.equals("writer")) {
			sql = " and c_name like ('%'||?||'%')";
		}else if (sRC.equals("title")) {
			sql = " and r_title like ('%'||?||'%')";
		}else if (sRC.equals("classname")){
			sql = " and wc_name like ('%'||?||'%')";
		}else {
			sql = " and wc.ws_no = ?";
		}
		q += sql;
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, sRI);
			rset = ps.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ps);
		}
		return listCount;
	}

	public String selectWsName(String wcNo,Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select ws_name from workshop s,work_class w where s.ws_no = w.ws_no and wc_no= ?";
		String wsName = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				wsName = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return wsName;
	}

}
