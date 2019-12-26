package workclass.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.JJim;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class AllViewClassServlet
 */
@WebServlet("/all.class")
public class AllViewClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllViewClassServlet() {
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
		SearchService ss = new SearchService();
		ArrayList<Workclass> wclist = new ClassService().allSearchClass();
		ArrayList<JJim> jList = null;
		jList = new ClassService().SelectJJim();
		

		// 검색이 완료됬다면 가져온 해당클래스들의 각각의 평균 평점 가져오는 부분
		for (int i = 0; i < wclist.size(); i++) {
			double avgGrade = ss.avgGrade(wclist.get(i).getWcNo());
			wclist.get(i).setAvgGrade(avgGrade);

			// 각클래스의 썸네일 가져옴
			Workclass prewc = ss.selectPathRename(wclist.get(i).getWcNo());
			wclist.get(i).setPath(prewc.getPath());
			wclist.get(i).setRename(prewc.getRename());

			// 내일 class time에서 시작날짜랑 끝나는날짜 가져오기!!
			Workclass timewc = ss.selectDate(wclist.get(i).getWcNo());
			wclist.get(i).setStartdate(timewc.getStartdate());
			wclist.get(i).setEnddate(timewc.getEnddate());
			
			String wsName = ss.selectWsName(wclist.get(i).getWcNo());
			wclist.get(i).setWsName(wsName);
			System.out.println(wsName);
		}
		request.setAttribute("wclist", wclist);
		request.setAttribute("all", "all");
		request.setAttribute("jList",jList);
		request.getRequestDispatcher("views/classcategory/category.jsp").forward(request, response);

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
