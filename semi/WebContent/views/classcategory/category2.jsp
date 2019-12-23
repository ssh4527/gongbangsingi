<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="workclass.model.vo.Workclass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String keyword = (String)request.getAttribute("keyword");
	ArrayList<Workclass> wList = (ArrayList<Workclass>)request.getAttribute("wclist");
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
	String tooday = sdf.format(date);
	int today = Integer.parseInt(tooday);
	
	int[] startday = new int[wList.size()];
	for(int q = 0; q < wList.size(); q++){
		startday[q] = Integer.parseInt(sdf.format(wList.get(q).getStartdate()));
	}
	
	int[] endday = new int[wList.size()];
	for(int p = 0; p < wList.size(); p++){
		endday[p] = Integer.parseInt(sdf.format(wList.get(p).getEnddate()));
	}
	
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일부터 수강가능");
	
	String cate =(String)request.getAttribute("cate");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script src="https://kit.fontawesome.com/1f49e42371.js"
	crossorigin="anonymous"></script>
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

.menualink {
	text-decoration: none;
	color: black;
	cursor: pointer;
}
.menualink:hover{
	text-decoration: none;
	color:#BDBDBD;
}
.sortalink{
	color:black;
	font-size:14px;
	font-family:Arial;	
}
.sortalink:hover{
	text-decoration: none;
	color:black;
	background:#EAEAEA;
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

#heartover {
	position: relative;
	overflow: hidden;
}

#heartdiv {
	position: absolute;
	top: 10%;
	right: 0%;
	transform: translate(-50%, -50%);
	font-size: 2em;
	z-index: 2;
	text-align: center;
}

#heart {
	cursor: pointer;
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
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<!-- 정렬창 보이는 곳 -->
<!-- 	<div class='bigWrapper'>
		<div class="showWrapper">
			정렬 1
			<div class="sort1 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="도자기" id="jar"> <label
								class="custom-control-label" for="jar">도자기</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="액세서리" id="accessory"> <label
								class="custom-control-label" for="accessory">액세서리</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="가구" id="furniture"> <label
								class="custom-control-label" for="furniture">가구</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="향수" id="perfume"> <label
								class="custom-control-label" for="perfume">향수</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="제과" id="cook"> <label
								class="custom-control-label" for="cook">제과</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="원예" id="flower"> <label
								class="custom-control-label" for="flower">원예</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="가죽" id="leather"> <label
								class="custom-control-label" for="leather">가죽</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="기타" id="etc"> <label class="custom-control-label"
								for="etc">기타</label></td>
						</tr>
					</table>
					<br> <br> <br> <br> <br> <br>
					<button type="button" class="btn btn-warning" id="btnsort1">적용하기</button>
				</div>
			</div>

			정렬 2
			<div class="sort2 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="바로 수강 가능한 클래스" id="sort2_check1"> <label
								class="custom-control-label" for="sort2_check1">바로 수강
									가능한 클래스</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="현재 오픈중이지 않은 클래스" id="sort2_check2"> <label
								class="custom-control-label" for="sort2_check2">현재 오픈중이지
									않은 클래스</label></td>
						</tr>
					</table>
					<br> <br> <br> <br> <br> <br>
					<button type="button" class="btn btn-warning" id="btnsort2">적용하기</button>
				</div>
			</div>

			정렬 3
			<div class="sort3 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox"
								class="custom-control-input sort3" value="인기순" id="sort3_check1">
								<label class="custom-control-label" for="sort3_check1">인기순</label></td>
						</tr>
						<tr>
							<td><input type="checkbox"
								class="custom-control-input sort3" value="최신순" id="sort3_check2">
								<label class="custom-control-label" for="sort3_check2">최신순</label></td>
						</tr>
					</table>
					<br> <br> <br> <br> <br> <br>
					<button type="button" class="btn btn-warning" id="btnsort3">적용하기</button>
				</div>
			</div>


		</div>
	</div>
	정렬 리스트 script
	<script>
		$(function() {
			// 1번 버튼 누르면...
			$("#sortlist1").click(function() { 
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","inline_block").show();
				$(".sort2").css("display","none");
				$(".sort3").css("display","none");
			});
			
			// 2번 버튼 누르면...
			$("#sortlist2").click(function() {
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","none");
				$(".sort2").css("display","inline_block").show();
				$(".sort3").css("display","none");
			});
			
			// 3번 버튼 누르면...
			$("#sortlist3").click(function() {
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","none");
				$(".sort2").css("display","none");
				$(".sort3").css("display","inline_block").show();
			});
			
			$("#sort3_check1").click(function(){
				$("#sort3_check2").prop('checked', false);
			});
			
			$("#sort3_check2").click(function(){
				$("#sort3_check1").prop('checked', false);
			});
			
			// 적용하기버튼 누르면...
			$("#btnsort1").click(function(){
				$(".bigWrapper").css("display","none");
			});
			$("#btnsort2").click(function(){
				$(".bigWrapper").css("display","none");
			});
			$("#btnsort3").click(function(){
				$(".bigWrapper").css("display","none");
				$("#sortlist3").html($(".sort3:checked").val() + " ∨");
			});
		});
	</script> -->





<div style="height:20px; margin-top:3;">
	<ul class="ull" style="list-style:none; font-family:'맑은 고딕'; font-size:12px; font-family:'Arial';">
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=도자기" class="menualink">도자기</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=액세서리" class="menualink">액세서리</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=가구" class="menualink">가구</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=팔찌" class="menualink">팔찌</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=제과" class="menualink">제과</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=원예" class="menualink">원예</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=가죽" class="menualink">가죽</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=비누" class="menualink">비누</a></li>
	</ul>
</div>
	<hr>
	<span style="font-family: Arial;"><small>Total</small> <span style="Nanum Gothic;"><%= wList.size() %></span> <small>items</small></span>
	<input type="text" value="<%= cate %>">
	<input type="text" value="<%= keyword %>">
	<span style="float:right; font-family:'Arial';">
	<%
		String kk = "";
		if(keyword != null){ 
			kk ="empty";
		}else{
			kk = "full";
		}
	%>
		<a href="sort.class?keyword=<%= keyword %>&cate=<%= cate %>&kk=<%= kk %>" class="sortalink">인기순</a> | 
		<a href="sort.choi.class?keyword=<%= keyword %>&cate=<%= cate %>&kk=<%= kk %>" class="sortalink">최신순</a>
	</span>
	<hr>



	<!-- 앨범 부분...  -->

	<div class="album py-5 bg-light" id="whole">
		<div class="container">
			<div class="row">
				<% if(!wList.isEmpty()) { %>
				<% for(int i = 0;i < wList.size() ; i++ ) {%>
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div id="heartover">
							<!-- 이미지 클릭하면 이동 -->
							<a href="<%= request.getContextPath()%>/godetail.class?wcNo=<%= wList.get(i).getWcNo() %>">
								<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= wList.get(i).getRename() %>" width="100%" height="100%" id="gal">
							</a>
							<!-- 찜 버튼 -->
							<div id="heartdiv" class="div<%= wList.get(i).getWcNo() %>">
								<i class="far fa-heart fa-lg fa-spin" style="color: pink; cursor:pointer;"
									id="icon<%= wList.get(i).getWcNo() %>"></i>
							</div>
						</div>
						
						<div class="card-body">
							<!-- 클래스이름 -->
							<div style="height:20px; width:250px;">
								<small class="text-muted"  style="font-family: Arial;"><%= wList.get(i).getWcName() %></small>
							</div>
							<!-- 클래스 소개 -->
							<div style="height:50px; width:250px; overflow:hidden; text-overflow: ellipsis; font-family: Arial;">
							<%= wList.get(i).getWcIntroduce() %>
							</div>
							<!-- 평점 -->
							<div style="width:250px; height:20px;"><p style="font-family: Arial;"><small>
								<i class="fas fa-heart fa-lg fa-spin" style="color: #BDBDBD;"></i>
								<%= Math.round(wList.get(i).getAvgGrade()*100)/100.0 %>
								</small></p>
							</div>
							<!-- 날짜 넣는 부분 -->
							<div style="font-align:center;">
								<small style="color:orange;background:#EAEAEA;font-family: Arial;">
									<% if(today < startday[i]) { %>
										<%= sdf2.format(wList.get(i).getStartdate()) %>
									<% }else if(today < endday[i]){ %>
										<span>바로 수강 가능</span>
									<% } %>
								</small>	
							</div>
						</div>
					</div>
				</div>
				<% } %>
			<% }else{ %>
				<p style="text-align: center;">검색결과 없음</p>
			<% } %>


				<!-- 하트 모양 변경 -->
				<script>

      			$(function(){
      				$("i").click(function(){
      					var icon = $(this); // 아이콘
      					var id = $(this).attr('id'); // 아이콘 아이디값
      					var input = $(this).attr('id').replace("icon",""); // 클래스 번호 
      					var div = $(".divnbn"+input); // 아이콘이있는 div
      					
      					if(<%= log.equals("asd") %>){
      						alert("로그인 후에 찜할수 있습니다.");	
      					
      					}else if(!id == "menubar"){
      					
      						
       					$.ajax({ // 아작시작
      						url : "jjim.wc",
      						data : { wcNo: input, id:"<%= log %>"},
      						type : "get",
      						success : function(num){ // 석세스 시작
      						
      							if(num > 0){
      								
      								icon.removeClass("far fa-heart fa-lg fa-spin");
      		       					icon.addClass("fas fa-heart fa-lg fa-spin");
      		       					
      								
      								alert("찜 성공!!");
      								
      							// 찜목록에 없어서 찜 등록 그리고 꽉찬하트로 벽녕
      							}else if(num == 0){
      								
      								icon.removeClass("fas fa-heart fa-lg fa-spin");
      								icon.addClass("far fa-heart fa-lg fa-spin");
      		       					
      							
      								alert("찜 해제!!");
      								
      								// 찜목록에 있어서 찜 해제 그리고 빈하트로 변경
      							}else{
      							alert("dd");	
      							
      							}
      						}, // 석세스끝
      						
      						error : function(){
      							console.log('ajax 통신 실패!');
      						}
      					}); // 아작끝 
      					
      					}
       					
       					
      				});
      			
      			});
      			
    			</script>



			</div>
		</div>
	</div>

	<%@ include file="../common/footbar.jsp"%>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>