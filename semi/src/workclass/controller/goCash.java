package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class goCash
 */
@WebServlet("/cash1.go")
public class goCash extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goCash() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int resNop = Integer.parseInt(request.getParameter("outnumber"));
		int price = Integer.parseInt(request.getParameter("outprice"));
		String cId = request.getParameter("outcId"); // ajoa2012
		String time = request.getParameter("outtime"); // 14:00 - 15:00
		String wcNo = request.getParameter("outwcNo");
		String resdate = request.getParameter("ckdate");
		String title = request.getParameter("outname");
		String username = request.getParameter("outusername");
		
		int totalprice = price * resNop;
		
		request.setAttribute("resNop", resNop); 
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("cId", cId);
		request.setAttribute("wcNo", wcNo);
		request.setAttribute("time", time);
		request.setAttribute("resdate", resdate);
		request.setAttribute("title", title);
		request.setAttribute("username", username);
		request.getRequestDispatcher("views/cash/cash.jsp").forward(request, response);
		
		
		
		/*System.out.println("resNop : " + resNop);
		System.out.println("price : " + price);
		System.out.println("cId : " + cId);
		System.out.println("time : " + time);
		System.out.println("wcNo : " + wcNo);
		System.out.println("resdate : " + resdate);
		System.out.println(totalprice);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
