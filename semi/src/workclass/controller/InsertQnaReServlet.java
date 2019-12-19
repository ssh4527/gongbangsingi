package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import qna.model.vo.QnaRe;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class InsertQnaReServlet
 */
@WebServlet("/insert.class.qna.re")
public class InsertQnaReServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaReServlet() {
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
		String wcNo =request.getParameter("wcNo");
		QnaRe q = new QnaRe();
		q.setqNo(qno);
		q.setRqComment(text);
		q.setcId(loginUser.getUserId());
		q.setSecret(new ClassService().selectSecret(qno));
		
		int result = new ClassService().insertClassQnaRe(q);
		if(result > 0) {
			
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("godetail.class").forward(request, response);
		}else {
			System.out.println("qnare안들어감;;");
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
