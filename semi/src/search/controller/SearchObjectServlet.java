package search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search.model.service.SearchService;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class SearchObjectServlet
 */
@WebServlet("/search.all")
public class SearchObjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchObjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchtype = request.getParameter("searchtypeinput");
		SearchService ss =new SearchService();
		String searchinput = request.getParameter("searchinput");
		String keyword = ss.findText(searchinput);
		if(searchtype.equals("클래스")) {
			ArrayList<Workclass> list = ss.searchClass(keyword);
			System.out.println(list);
			request.setAttribute("keyword", keyword );
			request.setAttribute("wclist", list);
			request.getRequestDispatcher("views/classcategory/category.jsp").forward(request, response);
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
