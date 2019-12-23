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
				<td style="display:none"><%= rlist.get(i).getRNo() %></td>
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
				<td colspan="2" style="text-align:center; line-height:40px;">내용</td>
				<td colspan="4" style="text-align:left; line-height:40px;"><%=rlist.get(i).getRContent() %></td>
				<td colspan="1">
				<%if(loginUser != null){ %>
				<input style="display:none;" id="no'<%=rlist.get(i).getRNo()%>'" value="<%=rlist.get(i).getWcNo()%>">
				<%if(loginUser.getUserId().equals( rlist.get(i).getRWriter())) {%>
				<button class="btn btn-outline-secondary" onclick="updatereview('<%= rlist.get(i).getRNo() %>')" id="reviewchangebtn" style="margin-left:18%;width:60px; float:left;">수정</button>
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
							
						// 찜목록에 없어서 찜 등록 그리고 꽉찬하트로 벽녕
						}else if(num == 0){
							
						
							alert("리뷰 삭제실패..");
							
							// 찜목록에 있어서 찜 해제 그리고 빈하트로 변경
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
				}else{
					$(this).next().css("display","none");
				}
				
			});
		});
		
	
	</script>
	
	<!-- 검색 -->
		<div class="searchReviewArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">클래스명</option>
			</select>
			<input type="search">
			<button id="searchReviewBtn" type="button">검색하기</button>
			
		</div>
		
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>