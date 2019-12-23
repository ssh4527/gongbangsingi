package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import search.model.service.SearchService;
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
		System.out.println("s" + sortType);
		String category = request.getParameter("category");
		System.out.println("c" + category);
		String[] c = category.split(",");

		String location = request.getParameter("location");
		System.out.println("l" + location);
		String[] l = location.split(",");

		String keyword = request.getParameter("keyword");
		System.out.println("k" + keyword);
		
		ArrayList<Workshop> wslist = new ArrayList<>();
		ArrayList<Workshop> slist = new ArrayList<>();
		ArrayList<Workshop> slist2 = null;
		
		if (!keyword.isEmpty()) {
			SearchService ss = new SearchService();
			wslist = ss.searchWorkshop(keyword); // 카테고리로 검색

			if (wslist.isEmpty()) {
				wslist = ss.findWorkshopName(keyword);
			}
			System.out.println(wslist);
		} else {
			ShopService shs = new ShopService();
			wslist = shs.selectShopList();
		}

		for (Workshop shop : wslist) {
			if (location != null && category != null) {
				for (int i = 0; i < l.length; i++) {
					for (int j = 0; j < c.length; j++)
						if (c[j].equals(shop.getCategory())&&l[i].equals(shop.getAddress().substring(0, 2))) {
							slist.add(shop);
						}
				}
				
				HashSet<Workshop> hlist=new HashSet<Workshop>(slist);
				slist2=new ArrayList<Workshop>(hlist);
			}
		}
	
			System.out.println(slist2);
			System.out.println(slist);
			// 인기순
			if (sortType.equals("인기순")) {
				Collections.sort(slist2,new Comparator<Workshop>() {
					@Override
					public int compare(Workshop ws1, Workshop ws2) {
						return Double.compare(ws2.getGrade(), ws1.getGrade());
					}
				});
			} else if (sortType.equals("최신순")) {
				Collections.sort(slist,new Comparator<Workshop>() {
					@Override
					public int compare(Workshop ws1, Workshop ws2) {
						return ws2.getWsEnrollDate().compareTo(ws1.getWsEnrollDate());
					}
				});
			}
			
			for(int i=0;i<slist.size();i++) {
				Workshop file=new ShopService().getFilePathReName(slist.get(i).getWsNo());
				slist.get(i).setPath(file.getPath());
				slist.get(i).setReName(file.getReName());
			}
			
			 /* ShopService shs = new ShopService(); 
		 
		  if(location!=null&&category!=null) {
		  if (!keyword.equals("null") && !sortType.equals("null")) { 
			  slist =shs.selectCSortlist(sortType, c, keyword, l); 
			  } else if(!keyword.equals("null") && sortType.equals("null")) { 
				  slist = shs.selectSortlist(c, keyword, l); 
				  } else if (keyword.equals("null") &&!sortType.equals("null")) { 
					  slist = shs.selectSortlist(sortType, c, l); }
				  else if (keyword.equals("null") && sortType.equals("null")) {
					  slist = shs.selectedCategory(c, l); } 
		  }else {

	

		  }*/
		 
		
		response.setContentType("application/json; charset=utf-8");
		// 첫번쨰 요소 - 응답할 객체, 두번째 = 응답할 스트림
		new Gson().toJson(slist2, response.getWriter());
		
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
