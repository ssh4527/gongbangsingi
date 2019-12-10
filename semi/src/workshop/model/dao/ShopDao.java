package workshop.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import attachment.Attachment;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;
import static common.JDBCTemplate.*;

public class ShopDao {
		private Properties prop = new Properties();

		public ShopDao() {
			String fileName = ReviewDao.class.getResource("/sql/workshop/shop-query.properties").getPath();

			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	public ArrayList<Workshop> selectShopList(Connection con) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		
		ArrayList<Workshop> list = new ArrayList<Workshop>();
		String sql = prop.getProperty("selectShopList");
		try {
			ppst = con.prepareStatement(sql);
			rset=ppst.executeQuery();
			
			//String wsNo, String wsName, String address, String wsTel, String category, ArrayList<Review> rlist,
			//ArrayList<Workclass> clist, String intro, double grade
			if(rset.next()) {
			/*	list.add(new Workshop(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4),
						rset.getString(5),new ArrayList<Workclass>(rset.get)rset.getString(6),rset.getDouble(6)));
		*/	}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(ppst);
		}
		
		return list;
	}
	
	
	public Workshop selectShop(Connection con,String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("selectShop");
		try {
			ppst=con.prepareStatement(sql);
			ppst.setString(1, wsNo);
			rset=ppst.executeQuery();
			if(rset.next()) {
				//Workshop shop= new Workshop(rset.getString(1),rset.getString(2),rset.getString(3))
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public ArrayList<Attachment> selectPictures(Connection con, String wsNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;

		String sql = prop.getProperty("selectPictures");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wsNo);

			rset = pstmt.executeQuery();

			list = new ArrayList<Attachment>();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setFs_no(rset.getString("FS_NO"));
				at.setOriginName(rset.getString("fs_original_file"));
				at.setReName(rset.getString("fs_rename_file"));
				//at.setFs_destination(fs_destination);

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	}


