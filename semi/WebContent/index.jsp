<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height:1200px;
	background: lightgrey;
	
	
}

.col-md-4 {
	width: 10%;
	margin: 0px;
	float: left;
}

h2 {
	margin-left:30px;
}

#1stclass {
	width: 100%;
	height: 60%;
}

.img-body {
	width: 100%;
	height: 300px; <%--
	background:
		url('<%=request.getContextPath()%>/resources/images/jar1.jpg')
		no-repeat; --%>
	background: green;
	background-size: cover;
}

.heart {
	font-size: 2.0em;
	margin-top: 0px;
	margin-right: 10px;
	float: right;
}

.heart:hover {
	cursor: pointer;
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
</style>
</head>
<body>
	<script>
		window.onload = function(){
			
			 <!-- location.href="<%=request.getContextPath()%>/index.bo"; -->
		}
		
	</script>
	<%@ include file="views/common/menubar.jsp"%>
	<div id="maindiv1" class="album py-5 bg-light" style=" height:700px;">
		<h2>평점 BEST 3 클래스</h2>
		<!-- 1등 -->
		<div class="col-md-4 bg-light">
			<p class="subtext">1st ♕</p>
			<div class="card mb-4 shadow-sm">
				<div class="img-body" id="1stclass">

					<span class="heart">♡</span>

				</div>
				<div class="card-body">
					<small class="text-muted">Dish Factory</small>
					<p class="card-text" align="left">안녕하세요. 팟하우스 입니다:) 도자기 체험</p>
					<div class="d-flex justify-content-between align-items-center">
						<small class="text-muted">☆4.2</small> <small class="text-muted">바로
							수강 가능</small>
					</div>
				</div>
			</div>
		</div>
		<!-- 2등 -->
		<div class="col-md-4 bg-light">
			<p class="subtext">2nd</p>
			<div class="card mb-4 shadow-sm">
				<div class="img-body" id="1stclass" style="background:green;">
					<span class="heart">♡</span>
				</div>
				<div class="card-body">
					<small class="text-muted">Dish Factory</small>
					<p class="card-text" align="left">안녕하세요. 팟하우스 입니다:) 도자기 체험</p>
					<div class="d-flex justify-content-between align-items-center">
						<small class="text-muted">☆4.2</small> <small class="text-muted">바로
							수강 가능</small>
					</div>
				</div>
			</div>
		</div>
		<!-- 3등 -->
		<div class="col-md-4 bg-light">
			<p class="subtext">3rd</p>
			<div class="card mb-4 shadow-sm">
				<div class="img-body" id="1stclass">


					<span class="heart">♡</span>

				</div>
				<div class="card-body">
					<small class="text-muted">Dish Factory</small>
					<p class="card-text" align="left">안녕하세요. 팟하우스 입니다:) 도자기 체험</p>
					<div class="d-flex justify-content-between align-items-center">
						<small class="text-muted">☆4.2</small> <small class="text-muted">바로
							수강 가능</small>
					</div>
				</div>
			</div>
		</div>




	</div>
	<br>
	<hr>
	<br>
	<div id="maindiv2" class="album py-5 bg-light" style="height:900px;">
		<h2>새로운 공방</h2>
		<br>
		<!-- 카로우셀 -->
		<div id="carouselExampleCaptions" class="carousel slide"
			data-ride="carousel" style="width:80%; float:left;height:80%;  margin-left:10%;  ">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleCaptions" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" style="width:100%; height:100%;">
				<div class="carousel-item active"  >
					<img src="resources/images/jar1.jpg" class="d-block w-100" alt="..." >
					<div class="carousel-caption d-none d-md-block">
						<h5>First slide label</h5>
						<p>혁신 적인 도자기 공방입니다</p>
					</div>
				</div>
				<div class="carousel-item" >
					<img src="resources/images/jar2.jpg" class="d-block w-100" alt="..." >
					<div class="carousel-caption d-none d-md-block">
						<h5>Second slide label</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="resources/images/jar3.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Third slide label</h5>
						<p>Praesent commodo cursus magna, vel scelerisque nisl
							consectetur.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleCaptions"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
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