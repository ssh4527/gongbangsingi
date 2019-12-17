package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.vo.Review;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/update.review")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String rNo = request.getParameter("rNo");
		String title = request.getParameter("title");
		String user = request.getParameter("user");
		String content = request.getParameter("content");
		int grade = Integer.parseInt(request.getParameter("lastgrade"));
		String wcNo = request.getParameter("wcNo");
		
		Review review = new Review();
		
		review.setRNo(rNo);
		review.setRTitle(title);
		review.setRWriter(user);
		review.setRContent(content);
		review.setRGrade(grade);
		
		int result = new ClassService().updateReview(review);
		
		if(result > 0 ) {
			response.sendRedirect("godetail.class?wcNo=" + wcNo);
		}else {
			System.out.println("업뎃안됨;;");
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
