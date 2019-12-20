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
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;
import workclass.model.vo.Workclass;
import workshop.model.service.ShopService;
import workshop.model.vo.ShopFile;
import workshop.model.vo.Workshop;

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
		
		// 새로운공방 가져오기
		ArrayList<Workshop> wslist = new ShopService().newWorkShopList();
		ArrayList<ShopFile> sflist = new ArrayList<ShopFile>();
		for(int z = 0; z<wslist.size(); z++) {
			sflist.add(new ShopService().selectThumbnail(wslist.get(z).getWsNo()));
		}
		request.setAttribute("wslist", wslist);
		request.setAttribute("sflist", sflist);
		// 끝
		
		
		list = new SearchService().findClass(interest);
		
		if(!list.isEmpty()) {
			for(int i = 0 ; i < list.size(); i++) {
				// 각클래스의 썸네일 가져옴
				Workclass prewc = new SearchService().selectPathRename(list.get(i).getWcNo());
				list.get(i).setPath(prewc.getPath());
				list.get(i).setRename(prewc.getRename());
			}
			request.setAttribute("mainList", list);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			interest=null;
			list = new SearchService().findClass(interest);
			for(int i = 0 ; i < list.size(); i++) {
				// 각클래스의 썸네일 가져옴
				Workclass prewc = new SearchService().selectPathRename(list.get(i).getWcNo());
				list.get(i).setPath(prewc.getPath());
				list.get(i).setRename(prewc.getRename());
			}
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
