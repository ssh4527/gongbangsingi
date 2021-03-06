package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jjim.model.vo.Jjim;
import member.model.vo.Member;
import mypage.model.service.MypageService;
import qna.model.vo.Qna;
import reservation.model.vo.Reservation;
import review.model.vo.Review;

/**
 * Servlet implementation class ShowMyReservationServlet
 */
@WebServlet("/showReservation.nomal")
public class ShowMyInfomationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowMyInfomationServlet() {
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
		Member m = (Member) request.getSession().getAttribute("loginUser");

		
		// 예약 정보 가져오기
		ArrayList<Reservation> list = new MypageService().selectList(m.getUserId());

		// 후기 정보 가져오기
		ArrayList<Review> reviewlist = new MypageService().selectReviewList(m.getUserId());
		
		// 문의 내역 가져오기
		ArrayList<Qna> qnalist = new MypageService().selectQnaList(m.getUserId());
		
		// 예약 금액 가져오기
		int result = new MypageService().showMyLevel(m.getUserId());
		
		// 찜 목록 공방 번호 가져오기
		ArrayList<Jjim> jjimlist = new MypageService().selectJjim(m.getUserId());
		
		// 확인
		//System.out.println(list);
		//System.out.println("리뷰 : " + reviewlist);
		System.out.println(qnalist);
		//System.out.println(result);

		request.setAttribute("list", list);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("qnalist", qnalist);
		request.setAttribute("show", result);
		request.setAttribute("jlist", jjimlist);
		
		request.getRequestDispatcher("views/mypage/NomalMyPage.jsp").forward(request, response);
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
