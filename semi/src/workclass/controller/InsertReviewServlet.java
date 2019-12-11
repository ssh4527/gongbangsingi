package workclass.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import review.model.vo.Review;
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insert.re")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/review_uploadFiles/";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			ArrayList<String> changeFiles = new ArrayList<>();
			ArrayList<String> originFiles = new ArrayList<>();
			Enumeration<String> files = multipartRequest.getFileNames();
			
			
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multipartRequest.getFilesystemName(name) != null) {
					// getFilessystemName() --> 리네임 된 파일명 리턴
					String changeName = multipartRequest.getFilesystemName(name);
					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
					String originName = multipartRequest.getOriginalFileName(name);

					changeFiles.add(changeName);
					originFiles.add(originName);
				}
			}
			
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			int grade = Integer.parseInt(multipartRequest.getParameter("lastgrade"));
			String user = multipartRequest.getParameter("user");
			String wcNo = multipartRequest.getParameter("wcNo");
			
			

			Review review = new Review(title,content,grade,user,wcNo);
			
			
			ArrayList<ClassFile> fileList = new ArrayList<>();
			
			for (int i = 0; i < originFiles.size() ; i++) {
				ClassFile at = new ClassFile();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));

				fileList.add(at);
			}
			
			int result = new ClassService().insertReview(review);
			
			if(result > 0 ) {
				String rNo = new ClassService().selectRNo(title,wcNo);
				int result1 = new ClassService().insertReviewFile(fileList,rNo);
				
				if(result1 > 0) {
					request.setAttribute("wcNo", wcNo);
					// 추가해야함
					System.out.println("일단 여긴끝");
				}else {
					System.out.println("파일 안들어갔는대요;;");
				}
			}else {
				System.out.println("리뷰 안들어갔는대?");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
