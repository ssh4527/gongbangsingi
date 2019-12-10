package workclass.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class InsertClassServlet
 */
@WebServlet("/insert.class")
public class InsertClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertClassServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/class_uploadFiles/";

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

			String WcName = multipartRequest.getParameter("className");
			int WcNOP = Integer.parseInt(multipartRequest.getParameter("price"));
			String warning = multipartRequest.getParameter("warning");
			int WcMaxP = Integer.parseInt(multipartRequest.getParameter("count"));
			String time = multipartRequest.getParameter("outtime"); // -> 12:00 - 14:00, 15:00 - 17:00
			String startdate = multipartRequest.getParameter("startDate"); // -> 2019.02.23
			String closedate = multipartRequest.getParameter("closeDate"); // -> 2019.02.23
			String WsNo = multipartRequest.getParameter("공방번호");

			Workclass wc = new Workclass(WcName, WcNOP, WcMaxP,time, warning, WsNo);

			ArrayList<ClassFile> fileList = new ArrayList<>();

			for (int i = 0; i < originFiles.size() ; i++) {
				ClassFile at = new ClassFile();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));

				// 메인 이미지인 경우 fileLevel 0, 일반 사진은 fileLevel 1
				if (i == originFiles.size()-1 || i == originFiles.size()-2 || i == originFiles.size()-3 || i== originFiles.size()-4) {
					at.setFileLevel(0); // 썸넬
				} else {
					at.setFileLevel(1); // 메인
				}
				fileList.add(at);
			}
			
			int result = new ClassService().insertWorkClass(wc);
			
			if(result > 0) {
				String wcNo = new ClassService().selectWcNo(wc.getWcName());
				if(wcNo != null) {
					ClassTime ct = new ClassTime(wcNo,time, startdate, closedate,WcMaxP); // 클래스시간 넣는부분
					int result2 = new ClassService().insertClassTime(ct);
					if(result2 > 0) {
						for(int i = 0; i < fileList.size(); i++) {
							fileList.get(i).setDestination(wcNo);
						}
						int result3 = new ClassService().insertFile(fileList);
						if(result3 > 0 ) {
							request.setAttribute("workclass", wc);
							request.setAttribute("classtime", ct);
							request.setAttribute("fileList", fileList);
							System.out.println("flieList : " + fileList);
							request.getRequestDispatcher("/views/classdetail/preview.jsp").forward(request, response);
						}else {
							System.out.println("file List 안들어갔는대?");
						}
					}else {
						System.out.println("ClassTime 안들어갔는대??");
					}
				}else {
					System.out.println("wcNo 널인대??");
				}
			}else {
				System.out.println("클래스 안들어감;;");
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
