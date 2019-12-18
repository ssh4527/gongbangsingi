package workshop.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import workshop.model.service.ShopService;
import workshop.model.vo.ShopFile;

/**
 * Servlet implementation class shopThumbnailEditServlet
 */
@WebServlet("/shopThumbnail.sh")
public class shopThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public shopThumbnailServlet() {
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

		int maxSize = 1024 * 1024 * 10;

		String root = request.getSession().getServletContext().getRealPath("/");

		String savePath = root + "/resources/thumbnail_uploadFiles/";

		System.out.println(savePath);
		MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new MyFileRenamePolicy());

		// getFilessystemName() --> 리네임 된 파일명 리턴
		String changeName = multipartRequest.getFilesystemName("file");
		// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
		String originName = multipartRequest.getOriginalFileName("file");

		String WsNo = multipartRequest.getParameter("WsNo");
		String fileBtnN = multipartRequest.getParameter("fileBtnN");

		ShopFile file = new ShopFile();
		file.setOriginName(originName);
		file.setReName(changeName);
		file.setFilePath(savePath);

		System.out.println(fileBtnN);
		System.out.println(WsNo);
		int result=0;
		if (fileBtnN.equals("사진 등록")) {
		result = new ShopService().insertThumbnail(WsNo, file);
		}else {
			result = new ShopService().updateThumbnail(WsNo, file);
		}
		
		
		if (result > 0) {
			System.out.println(file.getReName());
			System.out.println(file.getFilePath());
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(file.getReName());
		} else {
			File failedFile = new File(savePath + file);
			failedFile.delete();
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
