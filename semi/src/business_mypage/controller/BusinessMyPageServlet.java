package business_mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business_mypage.model.service.BMypageService;
import member.model.vo.Member;
import mypage.model.service.MypageService;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

/**
 * Servlet implementation class BusinessMyPageServlet
 */
@WebServlet("/Business.go")
public class BusinessMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginUser");
		//Workshop w = (Workshop) request.getSession().getAttribute("loginUser");
		String wsNo = new MypageService().selectWsNo(m.getUserId());
		
		// 예약 정보 가져오기
		ArrayList<Reservation> list = new BMypageService().selectList(wsNo);
		
		// 예약 값 가져오기 
		int result = new BMypageService().ShowMyPay(wsNo);

		// 후기 정보 가져오기
		ArrayList<Review> reviewlist = new BMypageService().selectReviewList(wsNo);
		
		// 문의 내역 가져오기
		ArrayList<Qna> qnalist = new BMypageService().selectQnaList(wsNo);
		
		// 진행 안된 예약 내역 확인
		int num = new BMypageService().selectProgress(wsNo);
		
		request.setAttribute("wsNo", wsNo);
		request.setAttribute("list", list);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("qnalist", qnalist);
		request.setAttribute("canI", num);
		request.setAttribute("show", result);
		
		request.getRequestDispatcher("views/mypage/businessman.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
