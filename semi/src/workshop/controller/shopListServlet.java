package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workshop.model.service.ShopService;
import workshop.model.vo.ShopFile;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class shopListServlet
 */
@WebServlet("/shopList.sh")
public class shopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     * 
     * @see HttpServlet#HttpServlet()
     */
    public shopListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopService ss = new ShopService();
		ArrayList<Workshop> list = ss.selectShopList();
		HashMap<String,Double> glist = ss.selectGradeList();
		for(Workshop s:list) {
			
			if(glist.get(s.getWsNo()) != null) {
				s.setGrade(glist.get(s.getWsNo()));
			}
		}
		ArrayList<ShopFile> flist= ss.selectShopListPic();
		for(Workshop s: list) {
			System.out.println("d"+s.getWsNo());
		}
	
		
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.getRequestDispatcher("views/store/storeCategory.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
