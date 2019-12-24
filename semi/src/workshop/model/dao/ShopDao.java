
package workshop.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import review.model.vo.Review;
import workclass.model.vo.ClassFile;
import workclass.model.vo.Workclass;
import workshop.model.vo.ShopFile;
import workshop.model.vo.Workshop;

public class ShopDao {
	private Properties prop = new Properties();

	public ShopDao() {
		String fileName = ShopDao.class.getResource("/sql/workshop/shop-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//모든 공방
	public ArrayList<Workshop> selectShopList(Connection con) {
		PreparedStatement ppst = null;
		ResultSet rset = null;

		ArrayList<Workshop> list = new ArrayList<Workshop>();
		String sql = prop.getProperty("selectShopList");
		try {
			ppst = con.prepareStatement(sql);
			rset = ppst.executeQuery();

			// WS_NO,WS_NAME,WS_ADDR,WS_TEL, WS_CATEGORY,ROUND(AVG(R_GRADE),1)
			while (rset.next()) {
				list.add(new Workshop(rset.getString(1), rset.getString(2), rset.getString(3), rset.getDouble(4),rset.getString(5),rset.getDate(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return list;
	}

	// 해당하는 공방 불러오기
	public Workshop selectShop(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		Workshop shop = null;
		String sql = prop.getProperty("selectShop");
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);
			rset = ppst.executeQuery();
			if (rset.next()) {
				//s.WS_NO,s.WS_NAME,s.WS_ADDR,WS_TEL,s.S_CATEGORY,sg,WS_SNS, C_ID,s.WS_Introduce,s.WS_ENROLLDATE
				shop = new Workshop(rset.getString("WS_NO"), rset.getString("WS_NAME"), rset.getString("WS_ADDR"), rset.getString("WS_TEL"),
						rset.getString("S_CATEGORY"), rset.getDouble("sg"), rset.getString("WS_SNS"), rset.getString("C_ID"), rset.getString("WS_Introduce"),rset.getDate("WS_ENROLLDATE")
						,rset.getString("C_NAME"),rset.getString("WS_ACCNUM"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return shop;

	}

	// 공방 타이틀 사진 불러오기
	public ShopFile selectThumbnail(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ShopFile at = null;

		String sql = prop.getProperty("selectThumbnail");

		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);

			rset = ppst.executeQuery();

			at = new ShopFile();

			if (rset.next()) {
				at.setFs_no(rset.getString("FS_NO"));
				at.setOriginName(rset.getString("fs_original_file"));
				at.setReName(rset.getString("fs_rename_file"));
				at.setFs_destination(rset.getString("fs_destination"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return at;
	}

	// 공방 타이틀 사진 등록하기
	public int insertThumbnail(Connection con, String wsNo, ShopFile file) {
		PreparedStatement ppst = null;

		int result = 0;

		String sql = prop.getProperty("insertThumbnail");
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, file.getOriginName());
			ppst.setString(2, file.getReName());
			ppst.setString(3, wsNo);
			ppst.setString(4, file.getFilePath());

			result = ppst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ppst);
		}

		return result;
	}

	// 공방 타이틀 사진 수정하기
	public int updateThumbnail(Connection con, String wsNo, ShopFile file) {
		PreparedStatement ppst = null;

		int result = 0;

		String sql = prop.getProperty("updateThumbnail");
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, file.getOriginName());
			ppst.setString(2, file.getReName());
			ppst.setString(3, file.getFilePath());
			ppst.setString(4, wsNo);

			result = ppst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ppst);
		}

		return result;
	}

	// 소개글 update
	public int updateIntro(Connection con, String wsNo, String input) {
		PreparedStatement ppst = null;

		int result = 0;

		String sql = prop.getProperty("updateIntro");
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, input);
			ppst.setString(2, wsNo);

			result = ppst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ppst);
		}

		return result;
	}

	// 해당 공방의 리뷰 리스트
		public ArrayList<Review> selectReviewList(Connection con, String wsNo) {
			PreparedStatement ppst = null;
			ResultSet rset = null;
			ArrayList<Review> list = null;

			String sql = prop.getProperty("selectReviewLIst");
			try {
				ppst = con.prepareStatement(sql);

				ppst.setString(1, wsNo);

				rset = ppst.executeQuery();

				list = new ArrayList<Review>();
				while (rset.next()) {
					// String cName, Date rEnDate, int rGrade, String rWriter
					Review c = new Review(rset.getString("WC_NAME"), rset.getDate("R_ENT_DATE"), rset.getInt("R_GRADE"), rset.getString("C_ID"));
					list.add(c);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(ppst);
			}

			return list;
		}

	// 해당 공방의 클래스 목록
	public ArrayList<Workclass> selectClassList(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ArrayList<Workclass> list = null;

		String sql = prop.getProperty("selectClassLIst");
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);
			rset = ppst.executeQuery();

			list = new ArrayList<Workclass>();
			while (rset.next()) {
				// String wcName, int wcNOP, String wcOpenClose
				Workclass c = new Workclass(rset.getString("WC_NAME"), rset.getInt("WC_NOP"),
						rset.getString("WC_DATE"),rset.getString("WC_NO"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return list;

	}

	//해당 공방의 클래스 사진들
	public ArrayList<ClassFile> selectClassPictures(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ArrayList<ClassFile> list = null;

		String sql = prop.getProperty("selectClassPictures");

		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);

			rset = ppst.executeQuery();

			list = new ArrayList<ClassFile>();

			while (rset.next()) {
				ClassFile at = new ClassFile();
				at.setFsNo(rset.getString("FS_NO"));
				at.setOriginName(rset.getString("fs_original_file"));
				at.setChangeName(rset.getString("fs_rename_file"));
				// at.setFs_destination(fs_destination);

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return list;
	}

	//공방 썸네일들
	public ArrayList<ShopFile> selectShopListPic(Connection con) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ArrayList<ShopFile> list = null;

		String sql = prop.getProperty("selectShopListPictures");

		try {
			ppst = con.prepareStatement(sql);

			rset = ppst.executeQuery();

			list = new ArrayList<ShopFile>();

			while (rset.next()) {
				ShopFile at = new ShopFile();
				at.setOriginName(rset.getString("FS_ORIGINAL_FILE"));
				at.setReName(rset.getString("FS_RENAME_FILE"));
				at.setFs_destination(rset.getString("FS_DESTINATION"));

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(ppst);
		}

		return list;
	}


	public ArrayList<Workshop> selectNewShopList(Connection con) {
		Statement st = null;
		ResultSet rset = null;
		String sql = "select WS_NO,WS_NAME,WS_ADDR,WS_TEL,ws.C_ID,S_CATEGORY, ws_accnum from workshop ws,Client c where c.c_id = ws.c_id And AUTHORITY =1";
		ArrayList<Workshop> list = new ArrayList<Workshop>();

		try {
			st = con.createStatement();
			rset = st.executeQuery(sql);

			while (rset.next()) {
				list.add(new Workshop(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6),rset.getString(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(st);
		}

		return list;
	}

	


	// made by ssh
	public ArrayList<Workshop> selectCheckShopList(Connection con) {
		Statement st =null;
		ResultSet rset = null;
		String sql = "select ws_no,ws_name,s_category from workshop where enrollyn = 'N'";
		ArrayList<Workshop> list = new ArrayList<Workshop>();
		
		try {
			st = con.createStatement();
			rset  = st.executeQuery(sql);
			

			
			while (rset.next()) {
				list.add(new Workshop(rset.getString(1),rset.getString(2),rset.getString(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(st);
		}

		return list;
	}
	// made by ssh
	public int changeAuth(Connection c, String id) {
		int result = 0;
		String q = "update workshop set ENROLLYN='Y' where WS_NO=? ";
		PreparedStatement ps = null;
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ps);
		}
		
		
		return result;
	}

	//사업자로 전환신청
	public int requestToChangeShop(Connection con, String userId, String shopName, String shopAddr, String sns,
			String tel, String num, String account, String intro, String category) {
		
		PreparedStatement ppst = null;
		int result = 0;
		String sql = "insert into workshop values('ws'||WSNO_SEQ.NEXTVAL,?,?,?,default,sysdate,?,?,?,?,?,?)";
		
		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, shopName);
			ppst.setString(2, shopAddr);
			ppst.setString(3, tel);
			ppst.setString(4, account);
			ppst.setString(5, userId);
			ppst.setString(6, intro);
			ppst.setString(7, sns);
			ppst.setString(8, category);
			ppst.setString(9, num);
			
			result = ppst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ppst);
		}
		return result;
	}
	
	// 인덱스용 새로운 공방
	public ArrayList<Workshop> newWorkShopList(Connection c) {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Workshop> list = new ArrayList<Workshop>();
		int i=0;
		String sql = "SELECT WS_NO,WS_NAME,WS_ENROLLDATE,WS_Introduce FROM WORKSHOP order by WS_ENROLLDATE desc";
		try {
			st = c.createStatement();
			
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
				if(i==3) break;
				list.add(new Workshop(rs.getString(1), rs.getString(2),rs.getDate(3), rs.getString(4)));
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(st);
		}
		return list;
	}

	public Workshop getFilePathReName(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		Workshop result =new Workshop();
		ResultSet rset = null;
		
		String sql ="select fs_rename_file, fs_path from file_storage where fs_destination = ?";
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, wsNo);
			
			rset=ppst.executeQuery();
			if(rset.next()) {
				result.setPath(rset.getString(2));
				result.setReName(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(ppst);
		}
		
		return result;
	}

	public ArrayList<String> getCategory(Connection con) {
		Statement st = null;
		ArrayList<String> categoryList =new ArrayList<String>();
		ResultSet rset = null;
		
		String sql ="select S_CATEGORY FROM WORKSHOP GROUP BY S_CATEGORY ";
		try {
			st=con.createStatement();
			rset=st.executeQuery(sql);
			
			if(rset.next()) {
				categoryList.add(rset.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(st);
		}
		
		return categoryList;
	}



}
