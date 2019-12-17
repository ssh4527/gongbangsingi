package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.vo.Review;
import workshop.model.service.ShopService;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class shopReviewMoreServlet
 */
@WebServlet("/reviewMore.sh")
public class shopReviewMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopReviewMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String WsNo = request.getParameter("WsNo");
		ArrayList<Review> rlist = new ShopService().selectReviewList(WsNo);
		Workshop shop = new ShopService().selectShop(WsNo);
		
		request.setAttribute("rlist", rlist);
		request.setAttribute("shop", shop);
		request.getRequestDispatcher("views/store/shopReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
