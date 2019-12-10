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
 * Servlet implementation class MemberEmailCheckServlet
 */
@WebServlet("/email.ck")
public class MemberEmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String findEmail = request.getParameter("findEmail");
		String findPhone = request.getParameter("findPhone");
		
		Member result = new MemberService().checkEmail(findEmail,findPhone);
		if(result.getUserId() != null) {
			request.setAttribute("toEmail", result.getEmail());
//			request.setAttribute("toEmail", "tlstmdghks4@naver.com");
			request.setAttribute("toName",result.getUserName());
			request.setAttribute("subject","[공방신기] 아이디 찾기 결과입니다." );
			request.setAttribute("content","찾으신 아이디는 "+result.getUserId()+"입니다.");
			request.getRequestDispatcher("/views/common/mailtest.jsp").forward(request, response);
		}else{
			request.getSession().setAttribute("msg", "찾으신 이메일 결과가 없습니다.");
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
