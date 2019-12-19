package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.vo.Qna;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class ClassUpdateQna
 */
@WebServlet("/update.class.qna")
public class ClassSelectOneQnA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassSelectOneQnA() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String wcNo = request.getParameter("wcNo");
		String Qno = request.getParameter("Qno");
		Qna q = new ClassService().selectQnaOne(Qno);
		q.setqNo(Qno);
		
		request.setAttribute("wcNo", wcNo);
		request.setAttribute("q", q);
	
		request.getRequestDispatcher("views/classdetail/updateQna.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
