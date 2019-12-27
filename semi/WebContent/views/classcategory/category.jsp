<%@page import="workclass.model.vo.JJim"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="workclass.model.vo.Workclass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	ArrayList<Workclass> wList = (ArrayList<Workclass>)request.getAttribute("wclist");
	ArrayList<JJim> jList = (ArrayList<JJim>)request.getAttribute("jList");	

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
	
	String all = (String)request.getAttribute("all");
	int counts = 1;
	

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



<div style="height:30px; background:white; margin-top:-15px;" class="cate-menu">
	<ul class="ull" style="list-style:none; font-family:'맑은 고딕'; font-size:16px; font-family:'Arial';">
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=도자기" class="menualink">도자기</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=액세서리" class="menualink">액세서리</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=가구" class="menualink">가구</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=향수" class="menualink">향수</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=제과" class="menualink">제과</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=원예" class="menualink">원예</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=가죽" class="menualink">가죽</a></li>
		<li style="margin-left: 60px; margin-right: 60px; float:left;"><a href="menuck.class?cate=비누" class="menualink">비누</a></li>
	</ul>
</div>
<script>
$(function(){
	var menubar_offset = $('.cate-menu').offset();
	
		 $(window).scroll(function() {

		if ($(document).scrollTop() >= 164) {

  			$('.cate-menu').css("position","fixed");
  			$('.cate-menu').css("width","1300px");
  			$('.cate-menu').css("top","110px");
  			$('.cate-menu').css("z-index","100");

		}else {
			$('.cate-menu').css("position","static");
  			$('.cate-menu').css("width","1300px");
  			$('.cate-menu').css("top","auto");
  			$('.cate-menu').css("z-index","1");

		}

	}); 
});


</script>

	
	<span style="font-family: Arial;"><small>Total</small> <span style="Nanum Gothic;"><%= wList.size() %></span> <small>items</small></span>
	<%
		String kk = "";
		if(all != null){ 
			kk ="empty";
		}else{
			kk = "full";
		}
	%>
	<span style="float:right; font-family:'Arial';">
		<a href="sort.all.class" class="sortalink">인기순</a> | 
		<a href="all.class" class="sortalink">최신순</a>
	</span>
	<hr>



	<!-- 앨범 부분...  -->

	<div class="album py-5 bg-light" id="whole">
		<div class="container">
			<div class="row">
				<% if(!wList.isEmpty()) { %>
				<% for(int i = 0;i < wList.size() ; i++ ) {%>
					<% if(today > endday[i]){ %>
					<% }else{ %>
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div id="heartover">
							<!-- 이미지 클릭하면 이동 -->
							<a href="<%= request.getContextPath()%>/godetail.class?wcNo=<%= wList.get(i).getWcNo() %>">
				<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= wList.get(i).getRename() %>"
					width="100%" height="100%" id="gal">
							</a>
							<!-- 찜 버튼 -->
							<div id="heartdiv" class="div<%= wList.get(i).getWcNo() %>">
								<% if(!jList.isEmpty()) { %>
							 	<% counts = 1; %>
		<% for(int j = 0; j < jList.size(); j++){ %>
			<% if(jList.get(j).getC_id().equals(log) && jList.get(j).getWc_no().equals(wList.get(i).getWcNo())) { %>
				<% counts++; %>
			<% } %>
		<% } %>
								
								<% if(counts == 1){ %>
									<i class="far fa-heart fa-lg" style="color: pink; cursor:pointer;"
											id="icon<%= wList.get(i).getWcNo() %>"></i>
								<% }else{ %>
									<i class="fas fa-heart fa-lg" style="color: pink; cursor:pointer;"
											id="icon<%= wList.get(i).getWcNo() %>"></i>	
								<% } %>
							<% }else { %>
								<!--  빈하트 -->
								<i class="far fa-heart fa-lg" style="color: pink; cursor:pointer;"
									id="icon<%= wList.get(i).getWcNo() %>"></i>
							<% } %> 
							</div>
						</div>
						
						<div class="card-body">
							<!-- 공방 이름 -->
							<div style="height:20px; width:250px;">
								<small class="text-muted"  style="font-family: Arial;"><%= wList.get(i).getWsName() %></small>
							</div>
							<!-- 클래스 이름 -->
							<div style="height:50px; width:250px; overflow:hidden; text-overflow: ellipsis; font-family: Arial;">
							<%= wList.get(i).getWcName() %>
							</div>
							<!-- 평점 -->
							<div style="width:250px; height:20px;"><p style="font-family: Arial;"><small>
								<i class="fas fa-heart fa-lg" style="color: #BDBDBD;"></i>
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
      					
      					}else{
       					$.ajax({ // 아작시작
      						url : "jjim.wc",
      						data : { wcNo: input, id:"<%= log %>"},
      						type : "get",
      						success : function(num){ // 석세스 시작
      						
      							if(num > 0){
      								icon.removeClass("far fa-heart fa-lg");
      		       					icon.addClass("fas fa-heart fa-lg");
      								alert("찜 성공!!");
      							// 찜목록에 없어서 찜 등록 그리고 꽉찬하트로 벽녕
      							}else if(num == 0){
      								icon.removeClass("fas fa-heart fa-lg");
      								icon.addClass("far fa-heart fa-lg");
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