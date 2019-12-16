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
 * Servlet implementation class shopListServlet
 */
@WebServlet("/shopList.sh")
public class shopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     * 
     * @see HttpServlet#HttpServlet()
     */
    public shopListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Workshop> clist=(ArrayList<Workshop>) request.getAttribute("clist");
		ShopService ss = new ShopService();
		ArrayList<Workshop> list = ss.selectShopList();
		ArrayList<Attachment> flist= ss.selectShopListPic();
		for(Workshop s: list) {
			System.out.println(s.getWsNo());
		}
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("clist",clist);
		request.getRequestDispatcher("views/store/storeCategory.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
