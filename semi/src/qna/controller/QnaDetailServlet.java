package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import qna.model.service.QnaService;
import qna.model.vo.Qna;
import qna.model.vo.QnaRe;



/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/detail.qna")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qno=request.getParameter("qno");
		Qna qna=new QnaService().selectQna(qno);
		
		String page="";
		
		// ajax를 이용한 댓글 기능 구현
		ArrayList<QnaRe> rlist = new QnaService().selectReplyList(qno);
		if(qna != null) {
			request.setAttribute("qna", qna);
			request.setAttribute("rlist", rlist);
			page = "views/board/boardDetailView.jsp";
		}else {
			request.setAttribute("msg","공지사항 조회 실패!");
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
