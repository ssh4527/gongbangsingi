package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import search.model.service.SearchService;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class IndexOnLoadServlet
 */
@WebServlet("/index.bo")
public class IndexOnLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexOnLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] search = new SearchService().topKeyword();
		request.getSession().setAttribute("search", search);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String inter ="";
		String[] interest=null;
		ArrayList<Workclass> list = new ArrayList<Workclass>();
		if(loginUser !=null) {
			inter = loginUser.getInterest();
			interest = inter.split(",");
			
		}

		list = new SearchService().findClass(interest);
		
		if(!list.isEmpty()) {
			request.setAttribute("mainList", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			interest=null;
			list = new SearchService().findClass(interest);
			request.setAttribute("mainList", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
