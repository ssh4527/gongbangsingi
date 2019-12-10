package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.Attachment;
import workshop.model.vo.Workshop;
import workshop.model.service.ShopService;

/**
 * Servlet implementation class shopDetailServlet
 */
@WebServlet("/shopDetail.sh")
public class shopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public shopDetailServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String WsNo = request.getParameter("WsNo");
		
		ShopService service= new ShopService();
		
		Workshop shop = service.selectShop(WsNo);
		ArrayList<Attachment> fileList = service.selectPictures(WsNo);
		
		if(fileList != null) {
			request.setAttribute("shop", shop);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/store/storeView_b.jsp").forward(request, response);
			
		}/*else {
			request.setAttribute("msg", "공방 상세 보기 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
