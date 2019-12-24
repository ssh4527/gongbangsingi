package search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import review.model.vo.*;
import search.model.service.SearchService;
import workclass.model.service.ClassService;
import workclass.model.vo.ClassFile;

/**
 * Servlet implementation class SearchReviewListSerlvet
 */
@WebServlet("/review.search")
public class SearchReviewListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchReviewListSerlvet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int listCount = 0;
		ArrayList<Review> rlist = new ArrayList<Review>();
		
		String searchReviewCondition = request.getParameter("searchReviewCondition");
		String searchReviewInput = request.getParameter("searchReviewInput");
		if (searchReviewCondition != null && searchReviewInput != null) {
			listCount = new SearchService().getReviewCount(searchReviewCondition,searchReviewInput);
		}else {
			listCount = new SearchService().getReviewCount();
		}
		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지

		int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 수

		currentPage = 1;

		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		// * endPage : 현재 페이지에서 보여질 마지막 페이지 수
		endPage = startPage + pageLimit - 1;

		// 하지만 마지막 페이지 수가 총 페이지 수보다 클 경우
		// 만약 maxPage가 13인데 endPage가 20일수는 없으므로
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 페이지 정보를 공유할 VO 객체 PageInfo 클래스를 만들자~~
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		if (searchReviewCondition != null && searchReviewInput != null && searchReviewCondition !="nothing") {
			rlist = new SearchService().searchReview(searchReviewCondition, searchReviewInput,currentPage, boardLimit);

		} else {
			rlist = new SearchService().searchAllReview(currentPage, boardLimit);
			
		}
		request.setAttribute("pi", pi);
		request.setAttribute("rlist", rlist);
		request.setAttribute("searchReviewCondition", searchReviewCondition);
		request.setAttribute("searchReviewInput",searchReviewInput);
		request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
