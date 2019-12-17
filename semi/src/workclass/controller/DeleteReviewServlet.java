package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import workclass.model.dao.ClassDao;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/delete.review")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		System.out.println(rNo);
		
		int result = new ClassService().deleteReview(rNo);
		int result1 = 0;
		
		
		if(result > 0 ) {
			result1 = new ClassService().deleteReviewFile(rNo);
			if(result1 > 0) {
				response.setContentType("application/json; charset=utf-8");
				new Gson().toJson(result1,response.getWriter());
			}else {
				System.out.println("리뷰파일 삭제안됨;;");
			}
		}else {
			System.out.println("리뷰 삭제안됨;;");
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
