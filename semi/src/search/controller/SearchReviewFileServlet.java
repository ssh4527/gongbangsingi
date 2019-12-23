package search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;

/**
 * Servlet implementation class SearchReviewFileServlet
 */
@WebServlet("/reviewfile.search")
public class SearchReviewFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReviewFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String rNo = request.getParameter("rNo");
		
		
		ArrayList<ClassFile> list = new ClassService().selectReviewFile(rNo);
		String paths ="";
		for(int i=0; i<list.size();i++) {
			paths+= list.get(i).getChangeName();
			if(i != list.size()-1) {
				paths +=",";
			}
			
		}
		
		new ClassService().upCountReview(rNo);
		
		PrintWriter out = response.getWriter();
		if(paths.length() > 0) {
			out.print(paths);
		}else {
			out.print("fail");
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
