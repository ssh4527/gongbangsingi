package qna.controller;

import java.io.IOException;
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
		String qno = request.getParameter("Qno");
		String text = request.getParameter("text");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
		QnaRe q = new QnaRe();
		q.setqNo(qno);
		q.setRqComment(text);
		q.setcId(loginUser.getUserId());
		q.setSecret("secret");
		
		int result = new QnaService().insertQnaRe(q);
		
		String page="";
		if(result > 0) {
			page = "views/board/boardDetailView.jsp";
		}else {
			System.out.println("QnaReInsertServlet 오류");
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
