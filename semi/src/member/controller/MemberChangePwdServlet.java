package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class MemberChangePwdServlet
 */
@WebServlet("/change.pwd")
public class MemberChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String pwd = request.getParameter("changePwd");
		String id = request.getParameter("changeId");
		
		int result = new MemberService().changePwd(id,pwd);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "비밀번호 변경에 성공하였습니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			request.getSession().setAttribute("msg", "알수없는 오류!");
			response.sendRedirect(request.getContextPath());
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
