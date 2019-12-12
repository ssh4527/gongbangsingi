package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.Attachment;
import workshop.model.service.ShopService;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class shopSortServlet
 */
@WebServlet("/sort.sh")
public class shopSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sortType = request.getParameter("sort");
		
		ShopService ss= new ShopService();
		ArrayList<Workshop> slist=ss.selectSortlist(sortType);
		
		ArrayList<Attachment> flist = ss.selectShopListPic();
		
		request.setAttribute("list", slist);
		request.setAttribute("flist", flist);
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
