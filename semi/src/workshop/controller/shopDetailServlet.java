package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.vo.Review;
import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;
import workclass.model.vo.ClassTime;
import workclass.model.vo.Workclass;
import workshop.model.service.ShopService;
import workshop.model.vo.ShopFile;
import workshop.model.vo.Workshop;

/**
 * Servlet implementation class shopDetailServlet
 */
@WebServlet("/detail.sh")
public class shopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public shopDetailServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String WsNo = request.getParameter("WsNo");
		
		
		ShopService service= new ShopService();
		System.out.println("받은 WsNo : " + WsNo);
		
		//공방 정보
		Workshop shop = service.selectShop(WsNo);
		System.out.println(shop.getAccountNum());
		//타이블 사진 
		ShopFile titlePic = service.selectThumbnail(WsNo);
		
		//리뷰목록
		ArrayList<Review> rlist = service.selectReviewList(WsNo);
		
		//클래스 목록
		ArrayList<Workclass> clist = service.selectClassList(WsNo);
		
		//공방의 클래스 사진들
		ArrayList<ClassFile> cPictures= service.selectClassPictures(WsNo);
		
		//공방 평점
		Double grade = service.getGrade(WsNo);
		shop.setGrade(grade);
			
		
		
		
		//클래스별 시작날 종료날 가져옴
		SearchService ss =new SearchService();
		for(int i = 0 ; i < clist.size(); i++) {
			Workclass timewc = ss.selectDate(clist.get(i).getWcNo());
			clist.get(i).setStartdate(timewc.getStartdate());
			clist.get(i).setEnddate(timewc.getEnddate());
		}
		//////////////////////////////////
		
		if(shop != null ) {
			request.setAttribute("shop", shop);
			request.setAttribute("titlePic", titlePic);
			request.setAttribute("rlist", rlist);
			request.setAttribute("clist", clist);
			request.setAttribute("cPictures", cPictures);
			

			request.getRequestDispatcher("views/store/storeView.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "공방 상세 보기 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
