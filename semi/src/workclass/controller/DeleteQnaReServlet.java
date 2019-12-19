package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workclass.model.service.ClassService;

/**
 * Servlet implementation class DeleteQnaReServlet
 */
@WebServlet("/delete.class.qna.re")
public class DeleteQnaReServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQnaReServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wcNo = request.getParameter("wcNo");
		String rqNo = request.getParameter("rqno");
		
		int result = new ClassService().deleteQnaRe(rqNo);
		if(result > 0) {
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("godetail.class").forward(request, response);;
		}else {
			System.out.println("삭제안됨;;");
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
