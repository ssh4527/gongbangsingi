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
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class GodetailClassServlet
 */
@WebServlet("/godetail.class")
public class GodetailClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GodetailClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String wcNo = request.getParameter("wcNo");
		
		Workclass wc = new ClassService().selectWorkClass(wcNo);
		ArrayList<ClassFile> cfList = new ClassService().selectClassFile(wcNo);
		ClassTime ct = new ClassService().selectClassTime(wcNo);
		
		ArrayList<Review> rList = new ClassService().selectReview(wcNo);
		ArrayList<ClassFile> rfList = new ArrayList<>();
		
		
		for(int i = 0 ; i < rList.size(); i++) {
			ArrayList<ClassFile> rfList2 = new ClassService().selectReviewFile(rList.get(i).getRNo());
			
			
			for(int j = 0 ; j < rfList2.size(); j++) {
				rfList.add(rfList2.get(j));
			}
		}
		
		
		
		
		
	
		//ArrayList<ClassFile> rfList = new ClassService().selectReviewFile(wcNo);

		
		if(ct.getCtNo() != null) {
			request.setAttribute("wc", wc);
			request.setAttribute("cfList", cfList);
			request.setAttribute("ct", ct);
			request.setAttribute("rList", rList);
			request.setAttribute("rfList", rfList);
			request.getRequestDispatcher("/views/classdetail/preview2.jsp").forward(request, response);
		}else {
			System.out.println("에렄");
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
