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

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/carousel/">



<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<style>
section, div, header {
	box-sizing: border-box;
	display: block;
}

#outer {
	width: 1000px;
	height: 1700px;
	/* div를 화면 가운데로 오게 하기 */
	margin: auto;
	padding: 3%;
}

#content_first {
	height: 40%;
	width: 100%;
}

#intro3_third {
	width: 100%;
	height: 25%;
	border-top: 1px solid black;
	padding: 2%;
}

#class_ing_second {
	width: 100%;
	height: 20%;
	border-top: 1px solid black;
}

#content_final_slide {
	width: 100%;
	height: 15%;
	border-top: 1px solid black;
}

#first_intro1 {
	text-align: center;
	width: 40%;
	float: left;
	height: 100%;
	border-right: 1px solid black;
}

#first_intro2 {
	text-align: center;
	width: 60%;
	float: left;
	height: 100%;
}

#introl1_1 {
	float: left;
	width: 100%;
	height: 80%;
	padding: 10px;
}

#introl1_2 {
	float: left;
	width: 100%;
	height: 20%;
	padding: 10px;
}

#introl1_2_1 {
	border: 1px solid black;
}

#map {
	margin: 3%;
	text-align: center;
	width: 100%;
	height: 50%;
}

#store_review {
	margin: 3%;
	text-align: center;
	width: 100%;
	height: 50%;
}
/* #classEdit {
	padding-left: 3%;
	text-align: center;
	float: left;
	height: 50%;
	width: 100%;
	overflow: hidden;
} */
.thumbnail {
	border: 2px solid lightgray;
	width: 350px;
	height: 200px;
	display: inline-block;
}

#introContent {
	padding: 2%;
	border: 1px solid gray;
	background-color: lightyellow;
	width: 95%;
	height: 90%;
	border-radius: 2%;
}
</style>
</head>
<body>
	<div id="outer">
		<section id="content_first">
			<section id="first_intro1">
				<section id="intro1_1" style="padding: 10px;">
					<div id="thumbnail1" class="thumbnail"></div>
					<p id="storeName">공방 이름</p>
				</section>
				<br> <br> <br> <br>
				<section id="introl1_2">
					<div id="introl1_2_1">
						<p id="addr">주소</p>
						<p id="phone">전화번호</p>
						<p id="sns">sns 계정</p>
					</div>
				</section>
					<a href="javascript:void addChannel()"> <img
					src="https://developers.kakao.com/assets/img/about/logos/channel/friendadd_small_yellow_rect.png" />
				</a>
				<script type='text/javascript'>
					//<![CDATA[
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('37bf650bd71c1e125e49c40d96c383e1');
					function addChannel() {
						Kakao.Channel.addChannel({
							channelPublicId : '_xcLqmC' // 채널 홈 URL에 명시된 id로 설정합니다.
						});
					}
					//]]>
				</script> 

				<a href="javascript:void chatChannel()"> <img
					src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png" />
				</a>
				<script type='text/javascript'>
					//<![CDATA[
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('37bf650bd71c1e125e49c40d96c383e1');
					function chatChannel() {
						Kakao.Channel.chat({
							channelPublicId : '_xcLqmC' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
						});
					}
					//]]>
				</script>
			</section>

			<section id="first_intro2">
				<section id="map">
					<h5>&lt;오시는 길&gt;</h5>
					<div id="map" style="width: 550px; height: 200px;"></div>

				</section>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37bf650bd71c1e125e49c40d96c383e1"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 3
					};

					var map = new kakao.maps.Map(container, options);
					// 지도를 생성합니다 
					var map = new kakao.maps.Map(mapContainer, mapOption);
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					// 주소로 좌표를 검색합니다 
					geocoder
							.addressSearch(
									'제주특별자치도 제주시 첨단로 242',
									function(result, status) {
										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {
											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);
											// 결과값으로 받은 위치를 마커로 표시합니다 
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});
											// 인포윈도우로 장소에 대한 설명을 표시합니다 
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
													});
											infowindow.open(map, marker);

											//지도의 중심을 결과값으로 받은 위치로 이동합니다.
											map.setCenter(coords);
										}
									});
				</script>
				<section id="store_review">
					<div class="tableArea">
						<h4>&lt; 후기 &gt;</h4>

						<img src="/images/empty_star.png"> <img
							src="/images/empty_star.png"> <img
							src="/images/empty_star.png"> <img
							src="/images/empty_star.png"> <img
							src="/images/empty_star.png">
						<div id="score">0.0 / 5.0</div>
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>No.</th>
									<th>클래스 명</th>
									<th>별점</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
								<tr>
									<td>1</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>2</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>3</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>4</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</section>


		</section>


		<section id="class_ing_second">
			<br>
			<h4>&lt;진행중인 클래스&gt;</h4>
			<br>
			<div class="tableArea">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th>No.</th>
							<th>클래스명</th>
							<th>가격</th>
							<th>기간</th>
						</tr>
						<tr>
							<td>1</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>2</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>

		<section id="intro3_third">
			<h4>&lt;공방 소개 글 &gt;</h4>
			<p id="introContent">rmfmrmrm</p>
		</section>

		<section id="content_final_slide">
			<br>
			<h4>&lt;더 많은 사진&gt;</h4>
			<br>


			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">

				<ol class="carousel-indicators">

					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>

					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>

				</ol>

				<div class="carousel-inner">

					<div class="carousel-item active">

						<img src="/images/top1.JPG" class="d-block w-100" alt="..."
							height="600px">

					</div>

					<div class="carousel-item">

						<img src="/images/top1.JPG" class="d-block w-100" alt="..."
							height="600px">

					</div>


					<div class="carousel-item">

						<img src="/images/top1.JPG" class="d-block w-100" alt="..."
							height="600px">

					</div>

				</div>

				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>

				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>

				</a>

			</div>

		</section>
	</div>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>


