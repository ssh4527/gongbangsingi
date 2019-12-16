package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NpageInfo;


/**
 * 
 * Servlet implementation class NlistServlet
 */
@WebServlet("/list.no")
public class NlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService nService=new NoticeService();
		int listCount = nService.getListCount();
		
		System.out.println("게시글 리스트 총 갯수: "+listCount);
		
		/*int NcurrentPage;
		int NpageLimit;
		int NmaxPage;
		int NstartPage;
		int NendPage;
		
		int NLimit=5;
		NcurrentPage=1;
		
		if(request.getParameter("NcurrentPage")!= null) {
			NcurrentPage=Integer.parseInt("NcurrentPage");
		}
		
		NpageLimit=5;
		
		NmaxPage=(int)Math.ceil((double)listCount/NLimit);
		NstartPage=(NcurrentPage-1)/NpageLimit*NpageLimit+1;
		NendPage=NstartPage+NpageLimit-1;
		
		if(NmaxPage<NendPage) {
			NendPage=NmaxPage;
		}
		
		NpageInfo npi = new NpageInfo(NcurrentPage, listCount, NpageLimit, NmaxPage, NstartPage, NendPage, NnoticeLimit);
		
		ArrayList<Notice> list = nService.selectList3(NcurrentPage, NLimit);
		request.setAttribute("pi", npi);*/
		
		ArrayList<Notice> list = new NoticeService().selectList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
