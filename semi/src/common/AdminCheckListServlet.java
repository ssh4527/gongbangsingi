package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.Workclass;
import workshop.model.service.ShopService;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class AdminCheckListServlet
 */
@WebServlet("/Admin.go")
public class AdminCheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Workshop> wsList = new ShopService().selectNewShopList();
		ArrayList<Workshop> wsList2 = new ShopService().selectCheckShopList();
		ArrayList<String[]> wcList = new ClassService().selectCheckClassList();
		
		Date da = new Date();
		int year = da.getYear()+1900;
		int month = da.getMonth()+1;
		
		ArrayList<Map> statistics= new SearchService().selectMonthStatistics(year,12);
		ArrayList<String> category = new SearchService().selectCategory();
		
		int sum = 0 ;
		for(int i=0; i<statistics.size(); i++) {
			for(int z=0; z<category.size(); z++) {
				if(statistics.get(i).get(category.get(z)) != null) {
					sum += Integer.parseInt((String) statistics.get(i).get(category.get(z)));
				}
			}
		}
		request.setAttribute("year", year);
		request.setAttribute("month", 12);
		request.setAttribute("category", category);
		request.setAttribute("statistics", statistics);
		request.setAttribute("wsList", wsList);
		request.setAttribute("wsList2", wsList2);
		request.setAttribute("wcList", wcList);
		request.getRequestDispatcher("views/mypage/AdminMyPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
