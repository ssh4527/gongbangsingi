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
import workshop.model.vo.Workshop;

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
		
		ArrayList<Workclass> wclist = null;
		ArrayList<Workshop> wslist =null;
		String keyword =ss.findKeyword(searchinput);
		if(searchtype.equals("클래스")) {
			
			wclist = ss.searchClass(keyword);// 카테고리로 검색
			if(wclist.isEmpty()) {
				wclist = ss.findClassName(searchinput);// 클래스 이름으로 검색
			}
			request.setAttribute("keyword", searchinput );
			request.setAttribute("wclist", wclist);
			request.getRequestDispatcher("views/classcategory/category.jsp").forward(request, response);
		}else {
		
			wslist = ss.searchWorkshop(keyword); // 카테고리로 검색
			
			if(wslist.isEmpty()) {
				wslist = ss.findWorkshopName(searchinput);
			}
			request.setAttribute("wslist", wslist);
			request.setAttribute("keyword", searchinput );
			request.getRequestDispatcher("views/store/storeCategory.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
