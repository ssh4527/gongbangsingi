<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="review.model.vo.*"%>
	<%
		ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
		PageInfo pi = (PageInfo)request.getAttribute("pi");
	
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		String searchReviewInput = (String)request.getAttribute("searchReviewInput");
		String searchReviewCondition = (String)request.getAttribute("searchReviewCondition");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<style>
	body{
		min-height:800px;
	}
	
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
	.pagingArea > button{
		width:40px;
		text-align:center;
	}
	

</style>
</head>

<body >
	<%@ include file="../common/menubar.jsp"%>
	<br><br>
	<h2 style="text-align:center">R E V I E W</h2>
	<br>
	<div style="min-height:600px;">
	<table class="table table-hover" id="reviewTable">
		<thead>
			<tr>
				<th scope="col" style="text-align:center;">#</th>
				<th scope="col" style="text-align:center;">클래스명</th>
				<th scope="col" style="text-align:center;">제목</th>
				<th scope="col" style="text-align:center;">평점</th>
				<th scope="col" style="text-align:center;">작성자</th>
				<th scope="col" style="text-align:center;">조회수</th>
				<th scope="col" style="text-align:center;">작성일</th>
				
			</tr>
		</thead>
		<tbody>
		<% for(int i =0; i<rlist.size(); i++){ %>
			<tr class="viewtitle" id="ul<%= rlist.get(i).getRNo() %>" style="height:55px;">
				<td style="display:none"><%= rlist.get(i).getRNo() %></td>
				<th scope="row" style="text-align:center; width:100px;"><%= (rlist.get(i).getRNo()).substring(3) %></th>
				<td style="width:200px;"><%= rlist.get(i).getWcName() %></td>
				<td style="width:400px;"><%= rlist.get(i).getRTitle() %></td>
				<td style="width:120px;">
					<%for(int s=0; s<5; s++ ){%>
						<% if(s<=rlist.get(i).getRGrade()){ %>
						★
						<%}else{ %>
						☆
						<%} %>
					<%} %>
				</td>
				<td style="width:100px;"><%= rlist.get(i).getcName() %></td>
				<td style="width:80px;"><%= rlist.get(i).getRCount() %></td>
				<td><%= rlist.get(i).getREnDate() %></td>
			</tr>
			<tr class="reviewcontent" style="height:55px;">
				<td colspan="2" style="text-align:center; line-height:40px;"><i class="fas fa-reply fa-rotate-180" aria-hidden="true"></i>내용</td>
				<td colspan="4" style="text-align:left; line-height:40px;"><%=rlist.get(i).getRContent() %></td>
				<td colspan="1">
				<%if(loginUser != null){ %>
				<input style="display:none;" id="no'<%=rlist.get(i).getRNo()%>'" value="<%=rlist.get(i).getWcNo()%>">
				<%if(loginUser.getUserId().equals( rlist.get(i).getRWriter())) {%>
				<button class="btn btn-outline-secondary" onclick="updatereview('<%= rlist.get(i).getRNo() %>')" id="reviewchangebtn" style="margin-left:10%;width:60px; float:left;">수정</button>
				<button class="btn btn-outline-secondary" onclick="deletereview('<%=rlist.get(i).getRNo() %>')" id="reviewdeletebtn" style="width:60px; float:left;">삭제</button>
				<%} } %>
				</td>
			</tr>
			<tr style="display:none;">
				
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	</div>
	<br>

	<script>
	function updatereview(review){
		 var wcno = $("#no"+review).val(); 
		alert("수정페이지로 이동합니다.");
		location.href="select.review?rNo=" + review + "&wcNo="+wcno;
	}
	
	function deletereview(review){
		if(window.confirm('게시글을 정말 삭제하시겠습니까?')){	
			$.ajax({ // 아작시작
					url : "delete.review",
					data : { rNo: review },
					type : "get",
					success : function(num){ // 석세스 시작
					
						if(num > 0){
							$("#ul"+review).remove();
							alert("성공적으로 리뷰가 삭제되었습니다.");
							
						}else if(num == 0){
							
							alert("리뷰 삭제실패..");	
						}else{
						alert("리뷰 삭제실패..");	
						
						}
					}, // 석세스끝
					
					error : function(){
						console.log('ajax 통신 실패!');
					}
				}); // 아작끝 
				
		}else{
			console.log("ㄴㄴ");
		}
	}
	
		$(function(){
			
			
			$(".viewtitle").click(function(){
				
				var rNo = $(this).children().eq(0).html();
				console.log(rNo);
				var $change = $(this).next().next();
				if($(this).next().next().css("display")=="none"){
				$.ajax({
					url : "<%=request.getContextPath()%>/reviewfile.search",
					data : {rNo : rNo},
					type : "post",
					success : function(data) {
						
						if (data != "fail") {
							var text = data.split(" , ");
							for(var i=0; i<text.length; i++){
								$change.children().eq(i+1).html("<img style='width:100px; height:100px;'  src='<%=request.getContextPath()%>/resources/review_uploadFiles/"+text[i]+"'>");
								
								
							}
							$change.css("display","table-row");
						} 
					},
					error : function() {
						console.log("서버 통신 안됨");
					}

				});
				
				}else{
					$(this).next().next().css("display","none");
					
				}
				
				
				if($(this).next().css("display") == "none" ){
					$(this).next().css("display","table-row");
					var countnum = (Number)($(this).children().eq(6).html());
					$(this).children().eq(6).html(countnum+1);
				}else{
					$(this).next().css("display","none");
				}
				
			});
		});
		
		
	</script>
		<!-- 페이징바 -->
		<div class="pagingArea" align="center" style="margin-bottom:10px;">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review.search?currentPage=1<%if(searchReviewCondition !=null && searchReviewInput != null) { %>&searchReviewCondition=<%=searchReviewCondition %>&searchReviewInput=<%=searchReviewInput %><%}%>'">&lt;&lt;</button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/review.search?currentPage=<%= currentPage - 1 %><%if(searchReviewCondition !=null && searchReviewInput != null) { %>&searchReviewCondition=<%=searchReviewCondition %>&searchReviewInput=<%=searchReviewInput %><% }%>'">&lt;</button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/review.search?currentPage=<%= p %>	<%if(searchReviewCondition !=null && searchReviewInput != null) { %>&searchReviewCondition=<%=searchReviewCondition %>&searchReviewInput=<%=searchReviewInput %><% }%>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/review.search?currentPage=<%= currentPage + 1 %><%if(searchReviewCondition !=null && searchReviewInput != null) { %>&searchReviewCondition=<%=searchReviewCondition %>&searchReviewInput=<%=searchReviewInput %><% }%>'">&gt;</button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review.search?currentPage=<%= maxPage %><%if(searchReviewCondition !=null && searchReviewInput != null) { %>&searchReviewCondition=<%=searchReviewCondition %>&searchReviewInput=<%=searchReviewInput %><% }%>'">&gt;&gt;</button>
			
		</div>
	<!-- 검색 -->
		<div class="searchReviewArea" align="center" style="height:100px;">
		<form method="post" action="<%=request.getContextPath()%>/review.search" onsubmit="return checksearch();">
			
			
			<select id="searchCondition" name="searchReviewCondition"  class="custom-select my-1 mr-sm-2" style="float:left; width:100px; margin-left:35%;">
				<option value="nothing" selected>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="classname">클래스명</option>
				
			</select>
			<input type="search" id="searchReviewInput" name="searchReviewInput"  class="form-control" style="float:left; width:180px; margin:4px;"  >
			<button id="searchReviewBtn" type="submit" class="btn btn-secondary" style="float:left; margin:4px;" >검색하기</button>
		</form>	
		</div>
		<script>
			$(function(){
				$(".pagingArea").children("button").addClass("btn btn-light");
				$(".pagingArea").children("button").css("align","center");
			});
		 function checksearch(){
			 console.log(<%=searchReviewCondition%>);
			 console.log(<%=searchReviewInput%>);
			 var condition = $("#searchCondition").val();
			 if(condition =="nothing"){
				 alert("검색종류를 정해주세요");
				 $("#searchCondition").focus();
				 return false;
			 }
			 var input = $("#searchReviewInput").val();
			 if(input.length < 1){
				 alert("검색어를 입력해주세요");
				 $("#searchReviewInput").focus();
				 return false;
			 }
			 return true;
		 }
		
		</script>
		<br>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>