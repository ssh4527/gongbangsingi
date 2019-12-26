package search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.JJim;
import workclass.model.vo.Workclass;
import workshop.model.service.ShopService;
import workshop.model.vo.ShopFile;
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
		ArrayList<JJim> jList = null;
		
		String keyword =ss.findKeyword(searchinput);
		if(searchtype.equals("클래스")) {
			
			wclist = ss.searchClass(keyword);// 카테고리로 검색
			if(wclist.isEmpty()) {
				wclist = ss.findClassName(searchinput);// 클래스 이름으로 검색
			}
			// 검색이 완료됬다면 가져온 해당클래스들의 각각의 평균 평점 가져오는 부분
			for(int i = 0 ; i < wclist.size(); i++) {
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
				
				// 찜 목록
				jList = new ClassService().SelectJJim();
				
				String wsName = ss.selectWsName(wclist.get(i).getWcNo());
				wclist.get(i).setWsName(wsName);
				System.out.println(wsName);
			}
			
			request.setAttribute("jList",jList);
			request.setAttribute("keyword", searchinput );
			request.setAttribute("wclist", wclist);
			request.getRequestDispatcher("views/classcategory/category2.jsp").forward(request, response);
		}else {
		 
			wslist = ss.searchWorkshop(keyword); // 카테고리로 검색
			
			if(wslist.isEmpty()) {
				wslist = ss.findWorkshopName(searchinput);
			}
			ArrayList<ShopFile> sflist = new ArrayList<ShopFile>();
			for(int z = 0; z<wslist.size(); z++) {
				sflist.add(new ShopService().selectThumbnail(wslist.get(z).getWsNo()));
			}
			request.setAttribute("flist", sflist);
			request.setAttribute("list", wslist);
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
