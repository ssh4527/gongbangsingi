package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

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
		String id= request.getParameter("idinput");
		String pwd= request.getParameter("pwdinput");
		
		Member m = new MemberService().LoginMember(id,pwd);
		
		if(m.getAuthority()==3) {
			// 관리자에게 온 문의 갯수 파악
			// 승인해야되는 것들 파악
		}else if(m.getAuthority() ==2 ) {
			
			
		}else {
			
		}
		
		if(m.getUserName() != null) {
			request.getSession().setAttribute("loginUser", m);
			response.sendRedirect(request.getContextPath());
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
