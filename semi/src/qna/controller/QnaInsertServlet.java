package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;



/**
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/insert.qna")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String writer="";
		if(loginUser != null) { writer=loginUser.getUserName();}
		else { writer="비회원";}
	/*	Member CID = (Member)request.getSession().getAttribute("c");*/
		
		
		// 받는 사람 아이디 관리자
		/*Member admin = (Member)request.getSession().getAttribute("loginUser");
	    String admin2 = String.valueOf(loginUser.getUserId().equals("admin"));*/
		
		
		String secret=request.getParameter("secret");
		String password=request.getParameter("password");
		
		
		
		Qna q = new Qna();
		
		q.setcId(writer);
		q.setqTitle(title);
		q.setqContent(content);
		q.setqSecret(secret);
		q.setWcNo("admin");
		q.setqPwd(password);
		
		
		int result = new QnaService().insertQna(q);
		
		if(result > 0) {
			response.sendRedirect("list.qna");
		}else {
			request.setAttribute("msg", "고객센터 작성 실패!.");
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
