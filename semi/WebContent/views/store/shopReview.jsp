<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="workshop.model.vo.*,review.model.vo.*, java.util.*"%>
    <%
    request.setCharacterEncoding("utf-8");
    Workshop shop = (Workshop) request.getAttribute("shop");
    ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
    System.out.println(shop.getWsNo());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="store_review">
					<div class="tableArea"  class="tableScroll">
						<h4>&lt; 후기 &gt;</h4> &nbsp;
						<div id="score">★<%=shop.getGrade()%>/ 5.0
						</div>
						<a href="<%=request.getContextPath()%>/shopReview.jsp" id="reviewMore">더보기&lt;&lt;</a>
						<table class="table table-hover" id="reviewList">
							<thead>
								<tr>
									<th>No.</th>
									<th>클래스 명</th>
									<th>별점</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
								</thead>
								<tbody>
								<%
									if (rlist.isEmpty()) {
								%>
								<tr>
									<td colspan="5">조회된 리스트가 없습니다.</td>
								</tr>
								<%
									} else { int idx=1; for (Review r : rlist) { 
								%>
								<tr>
									<input type="hidden" value="<%=r.getRNo()%>">
									<td><%=idx++%></td>
									<td><%=r.getcName()%></td>
									<td><%=r.getRGrade()%></td>
									<td><%=r.getRWriter()%></td>
									<td><%=r.getREnDate()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<script>
					$(function(){
						$("#reviewList td").click(function(){
							var num = $(this).parent().children().eq(0).val();
							console.log(num);
							location.href="<%= request.getContextPath() %>/detail.no?nno=" + num;
						});
						
					});
					</script>
					
				</section>
</body>
</html>