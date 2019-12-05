<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 웹에 호환성을 지정 (ie의 경우 호환 안되는 경우가 많아서) -->
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	width: 60%;
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
	float: left;
	height: 50%;
	width: 100%;
}

#store_review {
	padding-left: 3%;
	text-align: center;
	float: left;
	height: 50%;
	width: 100%;
	overflow: hidden;
}

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

#score {
	display: inline;
}

#classEdit {
	border-top: 1px solid black;
}

#thumbnailEdit {
	float: right;
}

h4 {
	display: inline;
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
					<input type="button" value="사진 변경" id="thumbnailEdit"
						name="thumbnailEdit"> <input type="file" id="imgfile1"
						name="imgfile1" onchange="preview(this,1)">
				</section>
				<br> <br>
				<section id="introl1_2">
					<div id="introl1_2_1">
						<p id="addr">주소</p>
						<p id="phone">전화번호</p>
						<p id="sns">sns 계정</p>
					</div>
				</section>
			
			</section>
			<script>
				$(function() {
					$("#imgfile1").hide();

					$("#thumbnailEdit").click(function() {
						$("#imgfile1").click();
					});
   
					
					
					
					
				});

				function preview(value, num) {
					// value => input type="file"
					// num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

					// file이 존재하는지 조건문
					if (value.files && value.files[0]) {
						// 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();

						// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
						reader.readAsDataURL(value.files[0]);

						// 파일 읽기가 다 완료되었을 때 실행되는 메소드
						reader.onload = function(e) {
							$("#thumbnail" + num)
									.html(
											"<img src=" + reader.result + " width=350 height=200>");
						}
					}
				}
			</script>
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

		<%-- <%if(loginUser){ %>
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
		<%}else{ %> --%>

		<section id="classEdit">
			<br>
			<h4>&lt;클래스&gt;</h4>
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
			<div class="classbtn">
				<button id="class_openclass" class="btn btn-outline-secondary">클래스
					열기</button>
				&nbsp;
				<button id="class_updateclass" class="btn btn-outline-secondary">수정하기</button>
				&nbsp;
				<button id="class_deleteclass" class="btn btn-outline-secondary">삭제하기</button>
			</div>
		</section>
		<%-- 		<%} %> --%>

		<br> <br>
		<section id="intro3_third">
			<h4>&lt;공방 소개 글 &gt;</h4>
			&nbsp; <input type="button" value="소개글 변경" id="intro3Edit"
				name="intro3Edit">

			<!-- Modal -->
			<button type="button" id="intro3Modal" class="btn btn-primary"
				data-toggle="modal" data-target=".bd-example-modal-lg">Large
				modal</button>

			<div class="modal fade bd-example-modal-lg" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">공방 소개글을
								자유롭게 작성해주세요~^^</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<textarea cols="100" rows="10" id="modalText"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" id="updateIntro3" onclick="updateIntro3();"
								data-dismiss="modal" class="btn btn-primary">수정완료</button>
						</div>
					</div>
				</div>
			</div>

			<br> <br>
			<p id="introContent">저희 공방에 오신걸 환영합니다.</p>
		</section>
		<script>
			$(function() {
				$("#intro3Modal").hide();
				$("#intro3Edit").click(function() {
					$("#intro3Modal").click();
				});
			});

			function updateIntro3() {
				var inputArea = document.getElementById("modalText");
				var showArea = document.getElementById("introContent");

				showArea.innerHTML = inputArea.value;

			}
		</script>
		<br> <br>
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


