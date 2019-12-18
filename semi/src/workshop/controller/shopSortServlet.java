package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import workshop.model.service.ShopService;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class shopSortServlet
 */
@WebServlet("/sort.sh")
public class shopSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public shopSortServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sortType = request.getParameter("sort");
		System.out.println("s"+sortType);
		String category=request.getParameter("category");
		System.out.println("c"+category);
		
		String[] c=category.split(",");
		
		ShopService ss = new ShopService();
		ArrayList<Workshop> slist = null;
		if (category != null && !sortType.equals("null")) {
			slist = ss.selectCSortlist(sortType, c);
		} else if(category==null&& !sortType.equals("null")){
			slist = ss.selectSortlist(sortType);
		}else{
			slist = ss.selectedCategory(c);
		}
		for(Workshop w: slist)
			System.out.println(w.getWsNo());
		response.setContentType("application/json; charset=utf-8");
		//첫번쨰 요소 - 응답할 객체, 두번째 = 응답할 스트림
		new Gson().toJson(slist,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
