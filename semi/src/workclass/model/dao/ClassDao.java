package workclass.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;

import workclass.model.vo.ClassFile;
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;

public class ClassDao {
	private Properties prop = new Properties();
	
	public ClassDao() {
		String fileName = ClassDao.class.getResource("/sql/workclass/workclass-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// 클래스 입력
	public int insertWorkClass(Connection conn, Workclass wc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String sql = prop.getProperty("insertWorkClass");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wc.getWcName());
			pstmt.setInt(2, wc.getWcNOP());
			pstmt.setInt(3, wc.getWcMaxP());
			pstmt.setString(4, wc.getWcOpenClose());
			pstmt.setString(5, wc.getWcWarning());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}


	// 클래스 번호 조회 (이름으로)
	public String selectWcNo(Connection conn, String wcName) {
		String wcNo = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWcNo");
		
		try {
			System.out.println(wcName);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				wcNo = rset.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return wcNo;
	}

	
	// 클래스 시간 넣는부분
	public int insertClassTime(Connection conn, ClassTime ct) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertClassTime");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getWcNo());
			pstmt.setString(2, ct.getCtTime());
			pstmt.setString(3, ct.getCtDate());
			pstmt.setInt(4, ct.getCtCount());
			pstmt.setString(5, ct.getCtEndDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
	
		return result;
	}

	// 클래스에 맞는 파일 넣는 부분
	public int insertFile(Connection conn, ArrayList<ClassFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertFile");
		
		
			try {
				for(int i = 0; i < fileList.size(); i++) {
					pstmt = conn.prepareStatement(sql);
					ClassFile cf = fileList.get(i);
					pstmt.setString(1, cf.getOriginName());
					pstmt.setString(2, cf.getChangeName());
					pstmt.setString(3, cf.getDestination());
					pstmt.setInt(4, cf.getFileLevel());
					pstmt.setString(5, cf.getFilePath());
					
					result += pstmt.executeUpdate();
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		
		
		
		return result;
	}

}
