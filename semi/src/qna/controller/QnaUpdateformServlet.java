package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateformServlet
 */
@WebServlet("/updateForm.qna")
public class QnaUpdateformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateformServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qno = request.getParameter("qno");
		
		Qna qna = new QnaService().selectNotice2(qno);
		
		String page = "";
		if(qna != null) {
			request.setAttribute("qna", qna);
			page = "views/board/boardUpdateForm.jsp";
		}else {
			request.setAttribute("msg", "공지사항 수정페이지 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
