package workshop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		request.setCharacterEncoding("utf-8");
		String userId=request.getParameter("c_id");
		String shopName = request.getParameter("businessmember_name");
		String shopAddr = request.getParameter("business_address")+" ";
		shopAddr += request.getParameter("business_address2");
		int snsNum= Integer.parseInt(request.getParameter("snsNum"));
		String Sns="";
		for(int i=1;i<snsNum+1;i++) {
			Sns+=request.getParameter("sns"+i)+" : ";
			Sns+=request.getParameter("business_sns"+i)+",";
		}
		if(Sns.equals("선택해주세요")) Sns="";
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String tel= tel1+tel2+tel3;
		String num1=request.getParameter("num1");
		String num2=request.getParameter("num2");
		String num3=request.getParameter("num3");
		String num=num1+num2+num3;
		String account=request.getParameter("bank")+" ";
		account+=request.getParameter("account");
		String intro=request.getParameter("intro");
		String category= request.getParameter("category");
		
		int result = new ShopService().requestToChangeShop(userId,shopName,shopAddr,Sns,tel,num,account,intro,category);
		
		if(result>0) {
			HttpSession session = request.getSession();
		
			session.setAttribute("msg", "공방사업자 신청이 완료 되었습니다. 관리자 확인 후 승인 될 예정입니다. 감사합니다.^^");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "공방사업자 신청이 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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

	