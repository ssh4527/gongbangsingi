<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="review.model.vo.*"%>
	<%
		ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<style>

	#reviewTable{
		width:90%;
		margin:auto;
	}
	.reviewcontent{
		display:none;
	}
	td{
		text-align:center;
	}
	th{
		text-align:center;
	}

</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<br><br>
	<h2 style="text-align:center">솔직한 리뷰 게시판</h2>
	<br>
	<table class="table table-hover" id="reviewTable">
		<thead>
			<tr>
				<th scope="col" style="text-align:center;">#</th>
				<th scope="col" style="text-align:center;">클래스</th>
				<th scope="col" style="text-align:center;">제목</th>
				<th scope="col" style="text-align:center;">평점</th>
				<th scope="col" style="text-align:center;" >작성자</th>
				<th scope="col" style="text-align:center;">조회수</th>
				<th scope="col" style="text-align:center;">작성일</th>
				
			</tr>
		</thead>
		<tbody>
		<% for(int i =0; i<rlist.size(); i++){ %>
			<tr class="viewtitle">
				<th scope="row" style="text-align:center;"><%=i+1 %></th>
				<td><%= rlist.get(i).getWcName() %></td>
				<td><%= rlist.get(i).getRTitle() %></td>
				<td>
					<%for(int s=0; s<5; s++ ){%>
						<% if(s<=rlist.get(i).getRGrade()){ %>
						★
						<%}else{ %>
						☆
						<%} %>
					<%} %>
				</td>
				<td><%= rlist.get(i).getcName() %></td>
				<td><%= rlist.get(i).getRCount() %></td>
				<td><%= rlist.get(i).getREnDate() %></td>
			</tr>
			<tr class="reviewcontent">
				<td colspan="2">내용</td>
				<td colspan="5"><%=rlist.get(i).getRContent() %></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	<br>
	<script>
		$(function(){
			$(".viewtitle").click(function(){
				if($(this).next().css("display") == "none" ){
					$(this).next().css("display","table-row");
				}else{
					$(this).next().css("display","none");
				}
				
			});
		});
		
	
	</script>
	<nav aria-label="Page navigation example">
  <ul class="pagination" style="margin-left:550px;">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	<!-- 검색 -->
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">클래스</option>
			</select>
			<input type="search">
			<button id="searchBtn" type="submit">검색하기</button>
			
		</div>
		
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>