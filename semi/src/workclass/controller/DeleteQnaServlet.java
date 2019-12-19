package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workclass.model.service.ClassService;

/**
 * Servlet implementation class DeleteQnaServlet
 */
@WebServlet("/delete.class.qna")
public class DeleteQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String Qno = request.getParameter("Qno");
		String wcNo = request.getParameter("wcNo");
		
		int result = new ClassService().deleteQna(Qno);
		if(result > 0) {
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("godetail.class").forward(request, response);
		}else {
			System.out.println("삭제[ 안됨;;");
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
