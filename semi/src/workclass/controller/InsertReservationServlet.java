package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.model.vo.Payment;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class InsertReservationServlet
 */
@WebServlet("/insert.reservation")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNop = Integer.parseInt(request.getParameter("resNop"));
		int totalprice = Integer.parseInt(request.getParameter("totalprice"));
		String cId = request.getParameter("cId");
		String time = request.getParameter("time");
		String wcNo = request.getParameter("wcNo");
		String resdate = request.getParameter("resdate");
		
		int point = Integer.parseInt(request.getParameter("point"));
		int result8 = new ClassService().usePoint(point,cId);
		int price = Integer.parseInt(request.getParameter("price"));
		
		Reservation res = new Reservation();
		res.setResNop(resNop);
		res.setTotalPrice(totalprice);
		res.setCid(cId);
		res.setClasstime(time);
		res.setWcNo(wcNo);
		res.setResDate(resdate);
		System.out.println("insertReservation totalprice : " + totalprice);
		
		int result = new ReservationService().insertReservation(res);
		if(result > 0 ) {
			int result2 = new ReservationService().updatepoint(cId,price*resNop);
			if(result2 > 0) {
				// 예약번호 가져오는부분
				Reservation preres = new ReservationService().selectRno(wcNo,cId);
				if(preres.getResCode() != null) {
					
					Payment pay = new Payment();
					pay.setResCode(preres.getResCode());
					pay.setWcNo(wcNo);
					int result3 = new ReservationService().insertPatment(pay);
					if(result3 > 0) {
						response.sendRedirect(request.getContextPath());
					}else {
						System.out.println("페이먼트안들감");
					}
				}else {
					System.out.println("rcode못가져옴;");
				}
				
			}else {
				System.out.println("포인트 업뎃 안됨;;");
			}
		}else {
			System.out.println("예약 안됬어용 ㅠㅠ");
		}
		/*System.out.println(resNop);
		System.out.println(totalprice);
		System.out.println(cId);
		System.out.println(time);
		System.out.println(wcNo);
		System.out.println(resdate);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
