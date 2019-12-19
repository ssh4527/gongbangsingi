package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class ShowMyLevelServlet
 */
@WebServlet("/myLevel")
public class ShowMyLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMyLevelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		int result = new MypageService().showMyLevel(m.getUserId());
		
		if(result<=1000) {
			request.setAttribute("level", "일반 회원");
		}else if( 1000 < result  && result <= 2500 ) {
			request.setAttribute("level", "골드 회원");
		}else if(2500 < result && result <= 4000 ) {
			request.setAttribute("level", "플레티넘 회원");
		}else if(4000< result && result <= 6000) {
			request.setAttribute("level", "vip");
		}else if(6000< result && result <=7000) {
			request.setAttribute("level", "vvip");
		}else {
			request.setAttribute("level", "대장장이");
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
