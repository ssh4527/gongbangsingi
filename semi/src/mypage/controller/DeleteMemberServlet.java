package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deleteMember.nomal")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new MypageService().deleteMember(m.getUserId());
		
		if(result > 0) {
			HttpSession session = request.getSession();
			
			session.removeAttribute("loginUser"); // 로그인 세션 정보 삭제
			
			session.setAttribute("msg", "회원 탈퇴가 완료되었습니다. 복구 관련 사항은 관리자에게 문의하세요.");
			response.sendRedirect(request.getContextPath());
			
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
