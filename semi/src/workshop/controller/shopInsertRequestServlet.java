package workshop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workshop.model.service.ShopService;

/**
 * Servlet implementation class shopInsertRequestServlet
 */
@WebServlet("/request.sh")
public class shopInsertRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopInsertRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName= request.getParameter("business_name");
		String shopName = request.getParameter("businessmember_name");
		String shopAddr = request.getParameter("business_address");
		String Sns=request.getParameter("business_sns");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String tel= tel1+tel2+tel3;
		String num1=request.getParameter("num1");
		String num2=request.getParameter("num2");
		String num3=request.getParameter("num3");
		String num=num1+num2+num3;
		String account=request.getParameter("account");
		String intro=request.getParameter("intro");
		String category= request.getParameter("category");
		
		int result = new ShopService().requestToChangeShop(userName,shopName,shopAddr,Sns,tel,num,account,intro,category);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
