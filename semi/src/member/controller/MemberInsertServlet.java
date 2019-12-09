package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import oracle.sql.DATE;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String phone = request.getParameter("userPhone");
		String birth = request.getParameter("userBirth");
		String irr[] = request.getParameterValues("interest");
		String interest = "";
		if (irr != null) {
			interest = String.join(",", irr);
		}
		String userHint = request.getParameter("userhint");
		Member m = new Member(userId, userPwd, userName, birth, email, phone,
				interest);
		int result = new MemberService().insertMember(m);
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원 가입 성공!!");
			response.sendRedirect(request.getContextPath());
		}else {
			request.getSession().setAttribute("msg", "회원 가입에 실패하였습니다.");
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
