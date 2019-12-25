package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workclass.model.service.ClassService;

/**
 * Servlet implementation class DeleteClassServlet
 */
@WebServlet("/delete.class")
public class DeleteClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String wcNo = request.getParameter("wcNo");
		String wsNo = request.getParameter("wsNo");
		String[] wcNolist = wcNo.split(",");
		int result = 0;
		
		for(String d:wcNolist) {
			result += new ClassService().deleteClass(d);
		}
		
		if(result > 0) {
			request.setAttribute("WsNo", wsNo);
			System.out.println("삭제 후 : " + wsNo);
			//response.sendRedirect("detail.sh?WsNo" + wsNo);
			request.getRequestDispatcher("detail.sh").forward(request, response);
		}else {
			System.out.println("클래스 삭제 안됨");
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
