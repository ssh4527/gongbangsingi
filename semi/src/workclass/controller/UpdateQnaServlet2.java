package workclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;

import member.model.vo.Member;
import qna.model.vo.Qna;
import workclass.model.service.ClassService;

/**
 * Servlet implementation class UpdateQnaServlet2
 */
@WebServlet("/update2.class.qna")
public class UpdateQnaServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQnaServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String secret = request.getParameter("secret");
		String Qno = request.getParameter("Qno");
		String wcNo = request.getParameter("wcNo");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Qna q = new Qna();
		q.setqTitle(title);
		q.setqContent(content);
		q.setqSecret(secret);
		q.setqNo(Qno);
		q.setWcNo(wcNo);
		
		int result = new ClassService().updateQna(q);
		if(result > 0) {
			request.setAttribute("wcNo", wcNo);
			request.getRequestDispatcher("godetail.class").forward(request, response);;
		}else {
			System.out.println("qna 업뎃안됨;");
		}
		/*System.out.println(title);
		System.out.println(content);
		System.out.println(secret);
		System.out.println(Qno);
		System.out.println(wcNo);
		System.out.println(loginUser.getUserId());*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
