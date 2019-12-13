package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import workclass.model.service.ClassService;

/**
 * Servlet implementation class JjimCheckServlet
 */
@WebServlet("/jjim.wc")
public class JjimCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JjimCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wcNo = request.getParameter("wcNo");
		String cId = request.getParameter("id");
		
		int result = new ClassService().JJimCheck(wcNo,cId);
		
		int result1 = 3;
		
		// 찜이 아니면
		if(result == 0) {
			result1 = 0;
			int goresult = new ClassService().selectJJim(wcNo,cId);
			
			
			if(goresult > 0) {
				// 성공적으로 찜이 완료
				
				// 찜이됬으니깐 찐한하트
				result1 = 1;
				
			}else {
				// 찜 실패
				System.out.println("찜 실패했는대욤;;");
			}
		}
		
		if(result >= 1) {
			int deleteresult = new ClassService().deleteJJim(wcNo,cId);
			
			if(deleteresult > 0) {
				// 찜 해제 성공
				
				// 찜 해제됬으니깐 빈하트
				result1 = 0;
				
			}else {
				// 찜 해제 실패
				System.out.println("찜 해제 실패햇는대염;;");
			}
		}
		
		System.out.println(result1);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result1,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
