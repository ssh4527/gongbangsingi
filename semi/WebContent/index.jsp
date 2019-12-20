<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="workclass.model.vo.*"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="workshop.model.vo.*"%>
<%
	ArrayList<Workclass> mainClassList = null; 
	mainClassList=(ArrayList<Workclass>)request.getAttribute("mainList"); 
	ArrayList<Workshop> wslist = (ArrayList<Workshop>)request.getAttribute("wslist");
	ArrayList<ShopFile> sflist = (ArrayList<ShopFile>)request.getAttribute("sflist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
* {
	margin: auto;
}

.album py-5 bg-light {
	width: 1200px;
	
	background: lightgrey;
	
	
}

.col-md-4 {
	
	margin: 0px;
	float: left;
	
}

h2 {
	margin-left:30px;
}

.subtext {
	text-align: center;
	font-size: 1.3em;
}
.carousel-item{
	width:100%;
	height:100%;
}
.carousel-item > img{
	width:100%;
	height:100%;
}
.heartover {
	
	position: relative;
	overflow: hidden;
}

.heartdiv {
	position: absolute;
	top: 10%;
	right: 0%;
	transform: translate(-50%, -50%);
	font-size: 2em;
	color: gray;
	z-index: 2;
	text-align: center;
}
.gal {
	position: relative;
	width: 100%;
	height: 300px;
	cursor: pointer;
}
.gal:hover {
	transform: scale(1.5, 1.5);
	transition: all 0.5s ease-in-out;
}

</style>
</head>
<body>
	<script>
		$(function(){
			if(<%=mainClassList%>==null){
				location.href="<%=request.getContextPath()%>/index.bo";
			}
		});
		
	</script>
	<%@ include file="views/common/menubar.jsp"%>
	<%
		String[] interest = {"",""};
		int interCount = 1;
		if(loginUser != null){
			String inter = loginUser.getInterest();
			interest = inter.split(",");
			interCount = interest.length;
		}else{
			
		}
		int ic=0;
		int grade=1;
	%>
	
	<div id="maindiv1" class="album py-5 bg-light" >
		<h2>평점 BEST 3 클래스</h2>
		<!-- 1등 -->
		<%if(mainClassList != null){ %>
				
				<%for(int i=0; i<mainClassList.size(); i++){ 
					if((i==0 || i%3==0) && ic<interCount ){	
						if(loginUser != null){
					%>
						<h4 style="text-align:center;">당신만을 위한 <%= interest[ic++]  %> 클래스</h4>
				<%} grade=1;
				} %>
		<div class="col-md-4 bg-light" >
			<p class="subtext"><%=grade++ %>st ♕</p>
			<div class="card mb-4 shadow-sm" style="width:85%;">
						<div class="heartover" style="width:100%">
							<a	href="<%= request.getContextPath()%>/godetail.class?wcNo=<%= mainClassList.get(i).getWcNo() %>">
							<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= mainClassList.get(i).getRename() %>"
								width="100%" height="100%" class="gal"></a>
							<div class="heartdiv" id="div<%= mainClassList.get(i).getWcNo() %>">
								<i class="far fa-heart fa-lg fa-spin" style="color: pink; cursor:pointer;"
									id="icon<%= mainClassList.get(i).getWcNo() %>"></i>
							</div>
						</div>
						<div class="card-body">
							<small class="text-muted"><%= mainClassList.get(i).getWcName() %></small>
							<p class="card-text" align="left"><%= mainClassList.get(i).getWcIntroduce() %></p>
							<div class="d-flex justify-content-between align-items-center">
								<small class="text-muted">♥<%= mainClassList.get(i).getAvgGrade() %></small>
								<small class="text-muted"><%= mainClassList.get(i).getWcOpenClose() %></small>
							</div>
						</div>
					</div>
		</div>
		<%  }}%>
		



	</div>
	<script>
		$("#maindiv1").css("height","<%=interCount*650-ic*20%>px");
	</script>
	
	<hr>
	
	<div id="maindiv2" class="album py-5 bg-light" style="height:900px;">
		<h2>새로운 공방</h2>
		<br>
		<!-- 카로우셀 -->
		<%if(wslist != null){ %>
		<div id="carouselExampleCaptions" class="carousel slide"
			data-ride="carousel" style="width:80%; float:left;height:80%;  margin-left:10%;  ">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleCaptions" data-slide-to="0"
					class="active"></li>
					<%for(int l = 1; l < wslist.size(); l++){ %>
				<li data-target="#carouselExampleCaptions" data-slide-to="<%=l%>"></li>
				<%} %>
			</ol>
			<div class="carousel-inner" style="width:100%; height:100%;">

				<%for(int s = 0; s < wslist.size(); s++){ %>
				<div class="carousel-item active"  >
					<img src="resources/thumbnail_uploadFiles/<%=sflist.get(s).getReName() %>" class="d-block w-100" alt="..." >
					<div class="carousel-caption d-none d-md-block">
						<h5><%=wslist.get(s).getWsName() %></h5>
						<p><%=wslist.get(s).getIntro() %></p>
					</div>
				</div>
				<%} %>

			</div>
			<a class="carousel-control-prev" href="#carouselExampleCaptions"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">이전</span>
			</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">다음</span>
			</a>
		</div>
		<%} %>
	</div>
	<script>
		$(function() {
			$(".heart").click(function() {
				if ($(this).html() == "♡") {
					$(this).html("♥")
				} else {
					$(this).html("♡")

				}
			});
		});
	</script>

	<%@ include file="views/common/footbar.jsp"%>
</body>
</html>