<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">



<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
section, div, header {
	box-sizing: border-box;
	display: block;
}

#outer {
	width: 1000px;
	height: 1800px;
	/* div를 화면 가운데로 오게 하기 */
	margin: auto;
}

#first {
	height: 30%;
	width: 100%;
}

#intro3 {
	width: 100%;
	height: 20%;
	border-top: 1px solid black;
	padding: 2%;
}

#myCarousel {
	text-align: right;
	width: 100%;
	height: 30%;
}

#intro1 {
	text-align: center;
	width: 40%;
	float: left;
	height: 70%;
	border-right: 1px solid black;
}

#introl1_2 {
	width: 30%;
	height: 30%;
	padding: 10px;
	border-right: 1px solid black;
	float:left;
}

#intro2 {
	border: 1px solid black;
}

#map {
	padding: 5%;
	text-align: center;
	float: left;
	height: 30%;
	width: 60%;
}

#classEdit {
	padding: 5%;
	text-align: center;
	float: left;
	height: 70%;
	width: 60%;
}

.thumbnail {
	border: 1px solid lightgray;
	width: 350px;
	height: 200px;
	display: inline-block;
}
#detail_intro{
	width:
}
</style>

</head>

<body>
	<div id="outer">
		<section id="first">
			<div id="detail_intro">
			<section id="intro1">
				<div id="thumbnail1" class="thumbnail"></div>
				<p id="storeName">공방 이름</p>
				<p id="storeintro">소개</p>
			</section>

			<section id="introl1_2">
				<div id="intro2">
					<p id="addr">주소</p>
					<p id="phone">전화번호</p>
					<p id="sns">sns 계정</p>
				</div>
			</section>
			</div>
			
			<section id="map">
				<h5>&lt;오시는 길&gt;</h5>
			</section>
			
			<section id="classEdit">
				<section id="review">
					<div class="tableArea">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>No.</th>
									<th>작성자</th>
									<th>별점</th>
								</tr>
								<tr>
									<td>1</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>2</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</section>
		</section>

		<hr>


		<div class="tableArea">
			<h4>&lt;진행중인 클래스&gt;</h4>
			
			<table class="table table-hover">
				<tbody>
					<tr>
						<th>No.</th>
						<th>클래스명</th>
						<th>가격</th>
					</tr>
					<tr>
						<td>1</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>2</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</div>
		<section id="intro3">

			<h4>&lt;공방 소개 글 &gt;</h4>
			
			<p id="introContent">rmfmrmrm</p>
		</section>

		<h4>더 많은 사진</h4>

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
						<rect width="100%" height="100%" fill="#777" /></svg>
					<div class="container">
						<div class="carousel-caption text-left">
							<img>1</img>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
						<rect width="100%" height="100%" fill="#777" /></svg>
					<div class="container">
						<div class="carousel-caption">
							<img>2</img>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
						<rect width="100%" height="100%" fill="#777" /></svg>
					<div class="container">
						<div class="carousel-caption text-right">
							<img>3</img>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</body>
</html>