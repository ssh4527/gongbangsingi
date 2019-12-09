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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/class_uploadFiles/";
			
			MultipartRequest multipartRequest 
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
//			ArrayList<String> changeFiles = new ArrayList<>();
//			ArrayList<String> originFiles = new ArrayList<>();
//			Enumeration<String> files = multipartRequest.getFileNames();
//			
//			while(files.hasMoreElements()) {
//				String name = files.nextElement();
//				
//				if(multipartRequest.getFilesystemName(name) != null) {
//					// getFilessystemName() --> 리네임 된 파일명 리턴
//					String changeName = multipartRequest.getFilesystemName(name);
//					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
//					String originName = multipartRequest.getOriginalFileName(name);
//					
//					changeFiles.add(changeName);
//					originFiles.add(originName);
//				}
			//}
			
			
			
			String WcName = multipartRequest.getParameter("className");
			int WcNOP = Integer.parseInt(multipartRequest.getParameter("price"));
			String warning = multipartRequest.getParameter("warning");
			int WcMaxP = Integer.parseInt(multipartRequest.getParameter("count"));
			String time = multipartRequest.getParameter("outtime");
			String[] times = time.split(",");
			String startdate = multipartRequest.getParameter("startDate");
			String closedate = multipartRequest.getParameter("closeDate");
			
			
			
			
			System.out.println(WcName);
			System.out.println(WcNOP);
			System.out.println(warning);
			
			System.out.println(times[0]);
			System.out.println(times[1]);
			System.out.println(startdate);
			System.out.println(closedate);
			
			
			
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
