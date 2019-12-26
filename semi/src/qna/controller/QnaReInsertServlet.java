package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.QnaRe;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class QnaReInsertServlet
 */
@WebServlet("/insert.qna.re")
public class QnaReInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaReInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");

		String qno = request.getParameter("qno");
		String rqno = request.getParameter("rqno");
		
		QnaRe q = new QnaRe();
		q.setcId(writer);
		q.setRqComment(content);
		q.setRqNo(rqno);
		q.setSecret("N");
		q.setqNo(qno);
		
		if(loginUser != null) {
			q.setcId(loginUser.getUserName());
		} else {
			q.setcId("비회원");
		}
		int result = new QnaService().insertQnaRe(q);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String page="";
		if(result > 0) {
			page = "views/board/boardDetailView.jsp";
			out.print(content);
		}else {
			out.print("실패");
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
