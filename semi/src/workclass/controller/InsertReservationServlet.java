package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

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
		
		Reservation res = new Reservation();
		res.setResNop(resNop);
		res.setTotalPrice(totalprice);
		res.setCid(cId);
		res.setClasstime(time);
		res.setWcNo(wcNo);
		res.setResDate(resdate);
		
		
		int result = new ReservationService().insertReservation(res);
		if(result > 0 ) {
			int result2 = new ReservationService().updatepoint(cId,totalprice);
			if(result2 > 0) {
				response.sendRedirect(request.getContextPath());
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
