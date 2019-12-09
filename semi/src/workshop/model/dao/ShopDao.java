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

import review.model.dao.ReviewDao;
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
			
			//String wsNo, String wsName, String address, String wsTel, 
			//String category, double grade
			if(rset.next()) {
				list.add(new Workshop(rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4),
						rset.getString(5),rset.getDouble(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(ppst);
		}
		
		return list;
	}

}
