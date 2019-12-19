package workclass.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.vo.Review;
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;

/**
 * Servlet implementation class SelectReviewServlet
 */
@WebServlet("/select.review")
public class SelectReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		String wcNo = request.getParameter("wcNo");
		Review review = new ClassService().selectReviewOne(rNo);

		if(review != null) {
			request.setAttribute("review", review);
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("views/classdetail/updateReview.jsp").forward(request, response);
		}else {
			System.out.println("리뷰없는대..?");
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
