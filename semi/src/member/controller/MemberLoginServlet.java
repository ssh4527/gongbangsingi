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
		String returnPath = request.getParameter("returnPath");
		String id= request.getParameter("idinput");
		String pwd= request.getParameter("pwdinput");
		
		Member m = new MemberService().LoginMember(id,pwd);
		
		if(m.getAuthority()==3) {
			int alarm = new MemberService().selectAlarm();
			request.getSession().setAttribute("alarm", alarm);
			int qnacount = new MemberService().selectQna();
			request.getSession().setAttribute("qnacount", qnacount);
		}else {
			
			
		}
		
		if(m.getUserName() != null) {
			request.getSession().setAttribute("loginUser", m);
			
		
			response.sendRedirect(returnPath);
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
