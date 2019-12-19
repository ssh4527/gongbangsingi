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
import workclass.model.service.ClassService;

/**
 * Servlet implementation class ClassInsertQna
 */
@WebServlet("/insert.class.qna")
public class ClassInsertQna extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInsertQna() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클래스 QNA 입력 BY.JH
		
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String secret = request.getParameter("secret");
		String wsNo = request.getParameter("wsNo");
		String wcNo = request.getParameter("wcNo");
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Qna q = new Qna();
		q.setcId(loginUser.getUserId());
		q.setqTitle(title);
		q.setqContent(content);
		q.setqSecret(secret);
		q.setWcNo(wcNo);
		
		int result = new ClassService().insertClassQna(q);
		if(result > 0) {
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("godetail.class").forward(request, response);
		}else {
			System.out.println("게시판 안들어감 ㅇㅇ");
		}
		
		//System.out.println(realsecret);
		/*System.out.println(title);
		System.out.println(content);
		System.out.println(secret);
		System.out.println(wsNo);
		System.out.println(loginUser.getUserId());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
