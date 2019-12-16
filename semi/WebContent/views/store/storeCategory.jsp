<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, workshop.model.vo.*,attachment.*"%>
<%
	ArrayList<Workshop> list = (ArrayList<Workshop>) request.getAttribute("list");
	ArrayList<Attachment> flist = (ArrayList<Attachment>) request.getAttribute("flist");
	
	ArrayList<Workshop> clist=  (ArrayList<Workshop>) request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
#sortlist {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

.bigWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.sort {
	width: 450px;
	height: 500px;
	justify-content: center;
	align-items: center;
	border: 1px solid black;
	background: white;
}

.sort table {
	height: 200px;
	width: 500px;
}

.sort td {
	padding-left: 30px;
}

.sort table {
	margin-top: -80px;
}

.sort h2 {
	padding: 30px;
}

.btn {
	color: white;
	width: 400px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#gal {
	position: relative;
	width: 350px;
	height: 300px;
	cursor: pointer;
}

#thumbnail {
	position: relative;
	overflow: hidden;
}

#gal:hover {
	transform: scale(1.5, 1.5);
	transition: all 0.5s ease-in-out;
}

#whole {
	animation: fadein 2s;
}

@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}

.shortIntro{
width: 300px;
}
.gradeDis{
	float: left;
}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<!-- 정렬창 보이는 곳 -->
	<div class='bigWrapper'>
		<div class="showWrapper">
			<!-- 정렬 1 -->
			<div class="sort1 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
				<form action="<%=request.getContextPath() %>/category.sh" method="post">
					<table>
					<%int idx=1;
					for(Workshop shop: list){ %>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="<%=shop.getCategory() %>" id="<%=idx%>" name="category"> <label
								class="custom-control-label" for="<%=idx %>"><%=shop.getCategory() %></label></td>
						</tr>
						<%idx++; } %>
						
					</table>
					<br> <br> <br> <br> <br> <br>
				
					<button type="submit" class="btn btn-warning" id="btnsort1">적용하기</button>
					</form>
					
				</div>
			</div>

			<!-- 정렬 2 -->
			<div class="sort2 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
				<form action="<%=request.getContextPath() %>/sort.sh" method="post">
					<table>
						<tr>
							<td><input type="checkbox" name="sort"
								class="custom-control-input sort2" value="인기순" id="sort2_check1">
								<label class="custom-control-label" for="sort2_check1">인기순</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="sort"
								class="custom-control-input sort2" value="최신순" id="sort2_check2">
								<label class="custom-control-label" for="sort2_check2">최신순</label></td>
						</tr>
					</table>
					<br> <br> <br> <br> <br> <br>
					<button type="submit" class="btn btn-warning" id="btnsort2">적용하기</button>
					</form>
				</div>
			</div>


		</div>
	</div>
	
	<!-- 정렬 리스트 script -->
	<script>
		$(function() {
			// 1번 버튼 누르면

			$("#sortlist1").click(function() { 
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","inline_block").show();
				$(".sort2").css("display","none");
			});
			
			// 2번 버튼 누르면
			$("#sortlist2").click(function() {
				$(".bigWrapper").css("display", "flex").show();

				$(".sort2").css("display","inline_block").show();
				$(".sort1").css("display","none");
			});
			
			$("#sort2_check1").click(function(){
				$("#sort2_check2").prop('checked', false);
			});
			
			$("#sort2_check2").click(function(){
				$("#sort2_check1").prop('checked', false);
			});
			
			// 적용하기버튼 누르면...
			$("#btnsort1").click(function(){
				$(".bigWrapper").css("display","none");
			});
			$("#btnsort2").click(function(){
				$(".bigWrapper").css("display","none");
				$("#sortlist2").html($(".sort2:checked").val() + " ∨");
			});
		});
	</script>


	<div id="sortlist">
		<a id="sortlist1">카테고리 ∨</a>&nbsp;&nbsp;&nbsp; <a id="sortlist2">정렬기준 ∨</a>
	</div>
	<hr>

	<!-- 앨범 부분...  -->

	<div class="album py-5 bg-light" id="whole">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div id="thumbnail">
							<img
								src="<%=request.getContextPath()%>/resources/images/jar1.jpg"
								width="100%" height="100%" id="gal">
						</div>
						<div class="card-body">
							<small class="text-muted">Dish Factory</small>
							<p class="card-text" align="left">반지나라</p>
							<div class="d-flex justify-content-between align-items-center">
								<small class="text-muted">★4.2</small> <small class="text-muted">구경하세요</small>
							</div>
						</div>
					</div>
				</div>
				<%
				
				ArrayList<Workshop> viewList=null;
				if(clist!=null){ 
					viewList=clist;
				}else if(list != null) {
					viewList=list;
				}
						for (Workshop shop : viewList) {
				%>
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm shop">
						<input type="hidden" value="<%=shop.getWsNo()%>">
						<div id="thumbnail">
							<%
								for (Attachment at : flist) {
							%>
							<%
								if (shop.getWsNo() == at.getFs_destination()) {
							%>
							<img
								src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=at.getReName()%>"
								width="100%" height="100%" id="gal">
							<%
								}}
							%>
							
						</div>
						<div class="card-body">
							<small class="text-muted"><%=shop.getCategory()%></small>
							<p class="card-text"><%=shop.getWsName()%></p>
							<div class="d-flex justify-content-between align-items-center shortIntro">
								<small class="gradeDis" class="text-muted">★<%=shop.getGrade()%></small> <small class="text-muted">구경하세요</small>
							</div>
						</div>
					</div>
				</div>
				<%
					}
					
				%>

			</div>
		</div>
	</div>

	<script>
	$(".shop").click(function(){
		var WsNo = $(this).children().eq(0).val();
		
		location.href="<%=request.getContextPath()%>/detail.sh?WsNo="+WsNo;
	});
	</script>
	<%@ include file="../common/footbar.jsp"%>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>