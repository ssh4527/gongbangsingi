package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import mypage.model.service.MypageService;
import qna.model.service.QnaService;
import qna.model.vo.Qna;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String returnPath = request.getParameter("returnPath");
		String wcNo = request.getParameter("loginwcNo");
		
		String returnpath = returnPath.substring(6);
		
		String id= request.getParameter("idinput");
		String pwd= request.getParameter("pwdinput");
		
		Member m = new MemberService().LoginMember(id,pwd);
		
		if(m.getAuthority()==3) {
			int alarm = new MemberService().selectAlarm();
			request.getSession().setAttribute("alarm", alarm);
			int qnacount = new MemberService().selectQna();
			request.getSession().setAttribute("qnacount", qnacount);
		}else {
			// 후기 답변 여부 가져오기
			ArrayList<Qna> qnalist = new MypageService().selectQnaList(m.getUserId());
			int useralarm = new QnaService().getReadStatus(qnalist);
			request.getSession().setAttribute("useralarm", useralarm);
			
			ArrayList<Integer> rs = new ReservationService().selectUserReservation(m.getUserId());
			int price = rs.get(0);
			int reservationcount = rs.get(1);
			String usergrade =  "브론즈";
			if(price >= 1000000){
				usergrade =  "다이아";
			}else if(price>= 700000){
				usergrade =  "플래티넘";
			}else if(price >= 400000){
				usergrade =  "골드";
			}else if(price >=100000){
				usergrade =  "실버";
			}
			
			
			request.getSession().setAttribute("reservationcount", reservationcount);
			request.getSession().setAttribute("usergrade", usergrade);
		}
		
		if(m.getUserName() != null) {
			request.getSession().setAttribute("loginUser", m);
			if(returnpath.equals("views/classdetail/preview2.jsp")) {
				returnpath = "godetail.class?wcNo="+wcNo;
				request.getRequestDispatcher(returnpath).forward(request, response);
			}else if(returnpath.equals("views/review/reviewList.jsp")) {
				
				response.sendRedirect("review.search");
			}
			else {
				response.sendRedirect(returnPath);
			}
			
		}else {
			
			request.setAttribute("loginmsg", "아이디 혹은 비밀번호가 틀렸습니다.");
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
