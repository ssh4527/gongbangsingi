package workshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import attachment.Attachment;
import common.MyFileRenamePolicy;
import workshop.model.service.ShopService;

/**
 * Servlet implementation class shopThumbnailInsertServlet
 */
@WebServlet("/insertThumbnail.sh")
public class shopThumbnailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopThumbnailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		String WsNo= request.getParameter("WsNo");
		
		String changeFile ="";
		// 원본 파일의 이름을 저장할 ArrayList 생성
		String originFile = "";
		String savePath = "";
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			savePath = root + "/resources/thumbnail_uploadFiles/";
		
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			
			// getFileNames() -> form에서 전송 된 파일 리스트들의 name 값을 반환
			Enumeration<String> files = multipartRequest.getFileNames();
			// -> 전송 순서 역순으로 쌓여 있음
		
				String name = files.nextElement();
				
				//System.out.println("name : " + name);
				
				// 파일이 null이 아닌 경우
				if(multipartRequest.getFilesystemName(name) != null) {
					// getFilessystemName() --> 리네임 된 파일명 리턴
					String changeName = multipartRequest.getFilesystemName(name);
					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
					String originName = multipartRequest.getOriginalFileName(name);
				
					changeFile=changeName;
					originFile=originName;
				}
			}
			
			
			Attachment file= new Attachment();
				file.setOriginName(originFile);
				file.setReName(changeFile);
				file.setFilePath(savePath);
			
			int result = new ShopService().insertThumbnail(WsNo, file);
			
			if(result > 0) {
				response.sendRedirect("detail.sh");
			}else {
					File failedFile = new File(savePath + file);
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
		
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
