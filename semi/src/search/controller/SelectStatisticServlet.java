package search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;

import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workshop.model.service.ShopService;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class SelectStatisticServlet
 */
@WebServlet("/statistic.admin")
public class SelectStatisticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStatisticServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int year = Integer.parseInt(request.getParameter("yearselect"));
		int month = Integer.parseInt(request.getParameter("monthselect"));
		
		ArrayList<Map> statistics = new ArrayList<Map>();
		
		if(month==0) {
			// 년별 조회
			 statistics= new SearchService().selectYearStatistics(year);
			
		}else {
			// 월별 조회
			statistics= new SearchService().selectMonthStatistics(year,month);
		}
		
		
		
		ArrayList<Workshop> wsList = new ShopService().selectNewShopList();
		ArrayList<Workshop> wsList2 = new ShopService().selectCheckShopList();
		ArrayList<String[]> wcList = new ClassService().selectCheckClassList();
		ArrayList<String> category = new SearchService().selectCategory();
		int sum = 0 ;
		for(int i=0; i<statistics.size(); i++) {
			for(int z=0; z<category.size(); z++) {
				if(statistics.get(i).get(category.get(z)) != null) {
					sum += Integer.parseInt((String) statistics.get(i).get(category.get(z)));
				}
			}
		}
		request.setAttribute("sum", sum);
		request.setAttribute("year",year);
		request.setAttribute("month",month);
		request.setAttribute("category", category);
		request.setAttribute("wsList", wsList);
		request.setAttribute("wsList2", wsList2);
		request.setAttribute("wcList", wcList);
		request.setAttribute("statistics", statistics);
		request.getRequestDispatcher("views/mypage/AdminMyPage.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
