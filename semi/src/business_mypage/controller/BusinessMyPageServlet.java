package business_mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.service.MypageService;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;
import workshop.model.vo.Workshop;

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
		
		System.out.println(wsNo);
		// 예약 정보 가져오기
		ArrayList<Reservation> list = new MypageService().selectList(wsNo);

		// 후기 정보 가져오기
		ArrayList<Review> reviewlist = new MypageService().selectReviewList(wsNo);
		
		// 문의 내역 가져오기
		ArrayList<Qna> qnalist = new MypageService().selectQnaList(wsNo);
		
		

		request.setAttribute("list", list);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("qnalist", qnalist);
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
