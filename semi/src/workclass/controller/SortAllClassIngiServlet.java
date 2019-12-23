package workclass.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.Workclass;

/**
 * Servlet implementation class SortAllClassIngiServlet
 */
@WebServlet("/sort.all.class")
public class SortAllClassIngiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortAllClassIngiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SearchService ss =new SearchService();
		
		
		ArrayList<Workclass> wclist = null;
		
			wclist = new ClassService().allSearchClass();
			System.out.println(wclist);
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
			}
			
			// 평점순 정렬 
			Collections.sort(wclist,new Comparator<Workclass>() {
				@Override
				public int compare(Workclass wc1, Workclass wc2) {
					
					//return wc1.getAvgGrade().compareTo(wc2.getAvgGrade());
					return Double.compare(wc2.getAvgGrade(), wc1.getAvgGrade());
				}
			});
			
			
			request.setAttribute("wclist", wclist);
			request.getRequestDispatcher("views/classcategory/category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
