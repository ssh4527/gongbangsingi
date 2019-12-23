package workclass.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import qna.model.vo.Qna;
import qna.model.vo.QnaRe;
import review.model.vo.Review;

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
			pstmt.setString(6, wc.getWcIntroduce());
			
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
					System.out.println(sql);
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

	// 리뷰넣는 부분
	public int insertReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getRWriter());
			pstmt.setString(2, review.getRTitle());
			pstmt.setString(3, review.getRContent());
			pstmt.setInt(4, review.getRGrade());
			pstmt.setString(5,review.getWcNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	// 리뷰 파일 넣기
	public int insertReviewFile(Connection conn, ArrayList<ClassFile> fileList, String rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReviewFile");
	
			try {
				for(int i = 0; i < fileList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				ClassFile cf = fileList.get(i);
				
				pstmt.setString(1, cf.getOriginName());
				pstmt.setString(2, cf.getChangeName());
				pstmt.setString(3, rNo);
				pstmt.setString(4, cf.getFilePath());
				result += pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		return result;
	}


	public int selectCurrval(Connection conn) {
		Statement stmt = null;
		int currval = 0;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCurrval");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				currval = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return currval;
	}


	public String selectRNo(Connection conn, String title, String wcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String rNo = "";
		String sql = prop.getProperty("selectRNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rNo = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
	
		return rNo;
	}

	
	// 워크클래스 select 
	public Workclass selectWorkClass(Connection conn, String wcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Workclass wc = new Workclass();
		
		String sql = prop.getProperty("selectWorkClass");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				wc.setWcNo(wcNo);
				wc.setWcName(rset.getString("wc_name"));
				wc.setWcNOP(rset.getInt("wc_nop"));
				wc.setWcMaxP(rset.getInt("wc_maxp"));
				wc.setWsNo(rset.getString("ws_no"));
				wc.setWcOpenClose(rset.getString("wc_date"));
				wc.setWcHits(rset.getInt("wc_hits"));
				wc.setWcWarning(rset.getString("wc_warning"));
				wc.setWcIntroduce(rset.getString("wc_introduce"));
				
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

	
	// 클래스 파일 select
	public ArrayList<ClassFile> selectClassFile(Connection conn, String wcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ClassFile> cfList = new ArrayList<>();
		String sql = prop.getProperty("selectClassFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ClassFile cf = new ClassFile();
				cf.setChangeName(rset.getString("fs_rename_file"));
				cf.setFsNo(rset.getString("fs_no"));
				cf.setOriginName(rset.getString("fs_original_file"));
				cf.setDestination(rset.getString("fs_destination"));
				cf.setFileLevel(rset.getInt("fs_level"));
				cf.setFilePath(rset.getString("fs_path"));
				cfList.add(cf);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cfList;
	}

	// 클래스 타임 select
	public ClassTime selectClassTime(Connection conn, String wcNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectClassTime");
		ClassTime ct = new ClassTime();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ct.setCtNo(rset.getString("ct_no"));
				ct.setWcNo(rset.getString("wc_no"));
				ct.setCtTime(rset.getString("ct_time"));
				ct.setCtDate(rset.getString("ct_date"));
				ct.setCtEndDate(rset.getString("ct_ENDDATE"));
				ct.setCtCount(rset.getInt("ct_count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
	
		return ct;
	}


	// 찜체크
	public int JJimCheck(String wcNo,String cId, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = "select count(*) from jjim where wc_no = ? and c_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			pstmt.setString(2, cId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	// 찜 하러가기
	public int selectJJim(String wcNo, String cId, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into jjim values(?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			pstmt.setString(2, wcNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}


	// 찜 해제
	public int deleteJJim(String wcNo, String cId, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from jjim where c_Id = ? and WC_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			pstmt.setString(2, wcNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	// made by ssh
	public ArrayList<String[]> selectCheckClassList(Connection c) {
		Statement st =null;
		ResultSet rset = null;
		String sql = "select wc_no,ws.ws_name,wc_name, ws.s_category  from work_class wc, workshop ws where ws.ws_no=wc.ws_no and wc.wc_yn='N'";
		ArrayList<String[]> list = new ArrayList<String[]>();
		
		try {
			st = c.createStatement();
			rset  = st.executeQuery(sql);
			
			while (rset.next()) {
				String[] text = {rset.getString(1),rset.getString(2),rset.getString(3),rset.getString(4)};
				list.add(text);
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
		
		String q = "update work_class set WC_YN='Y' where wc_no=?";
		PreparedStatement ps = null;
		
		try {
			ps = c.prepareStatement(q);
			ps.setString(1, id.trim());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(ps);
		}
		
		
		return result;
	}


	// 리뷰리스트 가져오는부분
	public ArrayList<Review> selectReview(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<Review> rList = new ArrayList<>();
		ResultSet rset = null;
		String sql  ="select * from review where wc_no = ? order by r_ent_date desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setRNo(rset.getString("r_no"));
				r.setWcNo(wcNo);
				r.setRTitle(rset.getString("r_title"));
				r.setREnDate(rset.getDate("r_ent_date"));
				r.setRContent(rset.getString("r_content"));
				r.setRCount(rset.getInt("r_view_cnt"));
				r.setRGrade(rset.getInt("r_grade"));
				r.setcName(rset.getString("c_id"));
				rList.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return rList;
	}


	// 리뷰파일가져오는부분
	public ArrayList<ClassFile> selectReviewFile(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		ArrayList<ClassFile> rList2 = new ArrayList<ClassFile>();
		String sql = "select * from file_storage where fs_destination = ? order by FS_NO desc";
	
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, wcNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					ClassFile cf = new ClassFile(rset.getString("fs_no"),rset.getString("fs_original_file"),
											rset.getString("fs_rename_file"),rset.getString("fs_destination"),rset.getInt("fs_level"), rset.getString("fs_path"));
					rList2.add(cf);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		
		return rList2;

	}

	// 리뷰삭제
	public int deleteReview(String rNo, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "delete from review where r_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}

	// 리뷰 파일 삭제
	public int deleteReviewFile(String rNo, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "delete from file_storage where fs_destination = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 리뷰 하나만 가져오기
	public Review selectReviewOne(String rNo, Connection conn) {
		PreparedStatement pstmt = null;
		Review review = new Review();
		ResultSet rset = null;
		
		String sql = "select * from review where r_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				review.setRNo(rNo);
				review.setRWriter(rset.getString("c_id"));
				review.setRTitle(rset.getString("r_title"));
				review.setREnDate(rset.getDate("r_ent_date"));
				review.setRContent(rset.getString("r_content"));
				review.setRGrade(rset.getInt("r_grade"));
				review.setWcNo(rset.getString("wc_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return review;
	}


	// 리뷰수정
	public int updateReview(Review review, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update review set r_title = ? , r_content = ? , r_ent_date = sysdate , r_grade = ? where r_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getRTitle());
			pstmt.setString(2, review.getRContent());
			pstmt.setInt(3, review.getRGrade());
			pstmt.setString(4, review.getRNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public String selectWsNo(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String wsNo = "";
		
		String sql = "select ws_no from work_class where wc_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				wsNo = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return wsNo;
	}

	// 클래스 QnA 작성 by.jh
	public int insertClassQna(Qna q, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
				
		
		String sql = "insert into qna values('Qno' ||SEQ_QNO.NEXTVAL,?,?,?,sysdate,?,default,?,default,'1234')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getcId());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setString(4, q.getqSecret());
			pstmt.setString(5, q.getWcNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public ArrayList<Qna> selectQna(String wcNo, Connection conn) {
		PreparedStatement pstmt = null;
		ArrayList<Qna> qList = new ArrayList<>();
		ResultSet rset = null;
		
		String sql = "select * from qna where wc_no = ? order by q_ent_date desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna q = new Qna();
				
				
				q.setqNo(rset.getString("q_no"));
				q.setcId(rset.getString("c_id"));
				q.setqTitle(rset.getString("q_title"));
				q.setqContent(rset.getString("q_content"));
				q.setqEntdate(rset.getDate("q_ent_date"));
				
				q.setqSecret(rset.getString("q_secret"));
				q.setqReplayck(rset.getString("q_replay_ck"));
				q.setWcNo(rset.getString("wc_no"));
				q.setqCount(rset.getInt("q_count"));
				qList.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return qList;
	}


	public String selectOrnerId(String wcNo,Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id = "";
		
		String sql = "select c.c_id from CLIENT c , workshop s , work_class w where c.c_id = s.c_id and s.ws_no = w.ws_no and w.wc_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				id = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return id;
	}


	public Qna selectQnaOne(String qno, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna q = new Qna();
		String sql = "select * from qna where q_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				q.setqContent(rset.getString("q_content"));
				q.setqSecret(rset.getString("q_secret"));
				q.setqTitle(rset.getString("q_title"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}


	public int updateQna(Qna q, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update qna set q_title = ?, q_content = ?, q_secret = ? where q_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setString(3, q.getqSecret());
			pstmt.setString(4, q.getqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteQna(String qno, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from qna where q_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	// Qna 시크릿인지 가져옴
	public String selectSecret(String qno, Connection conn) {
		PreparedStatement pstmt = null;
		String secret = "";
		ResultSet rset = null;
		String sql = "select q_secret from qna where q_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				secret = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return secret;
	}


	// qna 리플 집언허음
	public int insertClassQnaRe(Connection conn, QnaRe q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "insert into reply_qna values('REQ' || REQ_SEQ.NEXTVAL,?,SYSDATE,?,?,?,DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getRqComment());
			pstmt.setString(2, q.getSecret());
			pstmt.setString(3, q.getqNo());
			pstmt.setString(4, q.getcId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public QnaRe selectQnaRe(Connection conn, String qno) {
		PreparedStatement pstmt = null;
		QnaRe qr = new QnaRe();
		ResultSet rset = null;
		String sql = "select * from reply_qna where q_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				qr.setRqNo(rset.getString(1));
				qr.setRqComment(rset.getString(2));
				qr.setRqEntDate(rset.getDate(3));
				qr.setSecret(rset.getString(4));
				qr.setqNo(rset.getString(5));
				qr.setcId(rset.getString(6));
				qr.setRqChk(rset.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qr;
	}

	
	// qna 리플 삭제
	public int deleteQnaRe(Connection conn, String rqNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from reply_qna where rq_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rqNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	// 조회수증가
	public int Countup(Connection conn, String wcNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update work_class set wc_hits = wc_hits + 1 where wc_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wcNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 리뷰 조회수 증가
	public int upCountReview(Connection conn, String rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update review set R_VIEW_CNT = R_VIEW_CNT + 1 where R_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


}
