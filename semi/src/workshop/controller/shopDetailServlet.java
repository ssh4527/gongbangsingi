package workshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attachment.Attachment;
import review.model.vo.PageInfo;
import review.model.vo.Review;
import workclass.model.vo.Workclass;
import workshop.model.vo.Workshop;
import workshop.model.service.ShopService;

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
		
		//공방 정보
		Workshop shop = service.selectShop(WsNo);
		
		//타이블 사진 
		Attachment titlePic = service.selectThumbnail(WsNo);
		
		//리뷰목록
		int listCount = service.getListCount();
	
		int currentPage_r;	
		int pageLimit_r;		
		int maxPage_r;		
		int startPage_r;	
		int endPage_r;			
		
		int boardLimit = 10;
		
		currentPage_r = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage_r = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit_r = 10;
		
		maxPage_r = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage_r = (currentPage_r - 1) / pageLimit_r * pageLimit_r + 1;
		
		endPage_r = startPage_r + pageLimit_r - 1;

		if(maxPage_r < endPage_r) {
			endPage_r = maxPage_r;
		}
		
		PageInfo pi = new PageInfo(currentPage_r, listCount, pageLimit_r, maxPage_r, startPage_r, endPage_r, boardLimit);
		
		ArrayList<Review> rlist = service.selectReviewList(WsNo,currentPage_r, boardLimit);
		
		//클래스 목록
		ArrayList<Workclass> clist = service.selectClassList(WsNo);
		
		//공방의 클래스 사진들
		ArrayList<Attachment> cPictures= service.selectClassPictures(WsNo);
		
		
		//////////////////////////////////
		
		if(shop != null ) {
			request.setAttribute("shop", shop);
			request.setAttribute("titlePic", titlePic);
			request.setAttribute("rlist", rlist);
			request.setAttribute("clist", clist);
			request.setAttribute("cPictures", cPictures);

			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/store/storeView_b.jsp").forward(request, response);
			
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
