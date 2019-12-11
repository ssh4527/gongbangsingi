package workshop.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import attachment.Attachment;
import review.model.vo.Review;
import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;
import static common.JDBCTemplate.*;

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

			// String wsNo, String wsName, String address, String wsTel, String category,
			// String intro, double grade
			// WS_NO,WS_NAME,WS_ADDR,WS_TEL, WS_CATEGORY,ROUND(AVG(R_GRADE),1)
			if (rset.next()) {
				list.add(new Workshop(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getDouble(6)));
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
				// WS_NO,WS_NAME,WS_ADDR,WS_TEL, WS_CATEGORY,ROUND(AVG(R_GRADE),1)
				shop = new Workshop(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getDouble(6));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return shop;

	}

	// 공방 타이틀 사진 불러오기
	public Attachment selectThumbnail(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		Attachment at = null;

		String sql = prop.getProperty("selectThumbnail");

		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);

			rset = ppst.executeQuery();

			at = new Attachment();

			if (rset.next()) {
				at.setFs_no(rset.getString("FS_NO"));
				at.setOriginName(rset.getString("fs_original_file"));
				at.setReName(rset.getString("fs_rename_file"));
				// at.setFs_destination(fs_destination);

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
	public int insertThumbnail(Connection con, String wsNo, Attachment file) {
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
	public int updateThumbnail(Connection con, String wsNo, Attachment file) {
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

	// 페이징 처리_리뷰
	public int getListCount(Connection con) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			stmt = con.createStatement();
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

	// 해당 공방의 리뷰 리스트
	public ArrayList<Review> selectReviewList(Connection con, String wsNo, int currentPage, int boardLimit) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;

		String sql = prop.getProperty("selectReviewLIst");
		try {
			ppst = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			ppst.setString(1, wsNo);
			ppst.setInt(2, startRow);
			ppst.setInt(3, endRow);

			rset = ppst.executeQuery();

			list = new ArrayList<Review>();
			while (rset.next()) {
				Review c = new Review();
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
				Workclass c = new Workclass();
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

	public ArrayList<Attachment> selectClassPictures(Connection con, String wsNo) {
		PreparedStatement ppst = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;

		String sql = prop.getProperty("selectPictures");

		try {
			ppst = con.prepareStatement(sql);
			ppst.setString(1, wsNo);

			rset = ppst.executeQuery();

			list = new ArrayList<Attachment>();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setFs_no(rset.getString("FS_NO"));
				at.setOriginName(rset.getString("fs_original_file"));
				at.setReName(rset.getString("fs_rename_file"));
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

}
