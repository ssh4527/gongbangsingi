<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, review.model.vo.*,workshop.model.vo.*,attachment.*,workclass.model.vo.*"%>
<%
	Workshop shop = (Workshop) request.getAttribute("shop");
	Attachment titlePic = (Attachment) request.getAttribute("titlePic");

	ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
	ArrayList<Workclass> clist = (ArrayList<Workclass>) request.getAttribute("clist");
	ArrayList<Attachment> cPictures = (ArrayList<Attachment>) request.getAttribute("cPictures");

%>
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
	height: 2000px;
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

#mapArea {
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
	background-color: pink;
	border-radius: 30%;
}

#intro3Edit {
	background-color: pink;
	border-radius: 30%;
}

h4 {
	display: inline;
}

.picEdit {
	display: hidden;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div id="outer">
	<!-- 첫번째 section(타이틀 사진, 공방 정보 ..., 후기 목록) -->
		<section id="content_first">
			<section id="first_intro1">
			<!-- 사진, 공방 이름 -->
				<section id="intro1_1" style="padding: 10px;">

					<%
						boolean picCheck = false;
						if (titlePic.getReName()==null) {
					%>
					<div id="thumbnail1" class="thumbnail"></div>
					<%
						picCheck = true;
					} else {
					%>
					
					<img id="titleImg"
						src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=titlePic.getReName()%>"
						width="350px" height="200px">
					<%
						}
					%>
					<form id="thumbnailForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" value="<%=shop.getWsNo()%> id="shopNo">
						<%
						boolean userCheck=false;
						if(loginUser!=null&&loginUser.getUserId().equals(shop.getId())){
							userCheck=true;
							if (picCheck) {
						%>
						<input type="button" value="사진 변경" id="thumbnailEdit2"
							name="thumbnailEdit">
						<button type="submit" id="picUpdate" name="picEdit"></button>
						<%
							} else {
						%>
						<input type="button" value="사진 등록" id="thumbnailEdit1"
							name="thumbnailEdit">
						<button type="submit" id="picInsert" name="picEdit"></button>
						<%
							}}
						%>
					</form>
					<p id="storeName"><%=shop.getWsName()%></p>

					<script>
				$(function() {
					$("#imgfile1").hide();

					$(".thumbnailEdit").click(function() {
						$("#imgfile1").click();
					});
					
				});
				
				<%-- function picUpdate(){
				    
				    $.ajax({
				        url : '/updatethumbnail.sh',
				        data : {WsNo:shopNo, file:thumbnailEdit2 } 
				    }).success: function(file){
				    	$("#titleImg").attr("src","<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/file.reName");

				    	}
				    this.submit();
				} --%>


				function picUpdate(){
					$("#thumbnailForm").attr("action", "<%=request.getContextPath()%>/updatethumbnail.sh");
					$("#thumbnailForm").submit();
					
				}
				
				function picInsert(){
					$("#thumbnailForm").attr("action", "<%=request.getContextPath()%>/insertthumbnail.sh");
							$("#thumbnailForm").submit();
						}

					</script>
				</section>
				<br> <br> <br> <br> <br> <br>
				
				
				<!-- 주소,전화번호,sns계정 정보  -->
				<section id="introl1_2">
					<div id="introl1_2_1">
						<p id="addr"><%=shop.getAddress()%></p>
						<p id="phone"><%=shop.getWsTel()%></p>
						<p id="sns"><%=shop.getSns()%></p>
					</div>
				</section>
				<%if(!userCheck){ %>
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
				<%} %>
			</section>
			
			
			<section id="first_intro2">
			<!-- 공방 위치 지도 API -->
				<section id="mapArea">
					<h5>&lt;오시는 길&gt;</h5>
					<div id="map" style="width: 550px; height: 90%;"></div>

				</section>
			
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2afbe1f7936e7a946254f01d5b3a8e79&libraries=services"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 3
					};
					
					// 지도를 생성합니다 
					var map = new kakao.maps.Map(container, options);
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					// 주소로 좌표를 검색합니다 
					geocoder.addressSearch('<%=shop.getAddress()%>',function(result, status) {
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
														content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=shop.getWsName()%></div>'
													});
											infowindow.open(map, marker);

											//지도의 중심을 결과값으로 받은 위치로 이동합니다.
											map.setCenter(coords);
										}
									});
				</script>
				
				<!-- 후기 목록 -->
				<section id="store_review">
					<div class="tableArea"  class="tableScroll">
						<h4>&lt; 후기 &gt;</h4> &nbsp;
						<div id="score">★<%=shop.getGrade()%>/ 5.0
						</div>
						<table class="table table-hover" id="reviewList">
							<thead>
								<tr>
									<th>No.</th>
									<th>클래스 명</th>
									<th>별점</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
								</thead>
								<tbody>
								<%
									if (rlist.isEmpty()) {
								%>
								<tr>
									<td colspan="5">조회된 리스트가 없습니다.</td>
								</tr>
								<%
									} else { int idx=1; for (Review r : rlist) { 
								%>
								<tr>
									<input type="hidden" value="<%=r.getRNo()%>">
									<td><%=idx++%></td>
									<td><%=r.getcName()%></td>
									<td><%=r.getRGrade()%></td>
									<td><%=r.getRWriter()%></td>
									<td><%=r.getREnDate()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<script>
					$(function(){
						$("#reviewList td").click(function(){
							var num = $(this).parent().children().eq(0).val();
							console.log(num);
							location.href="<%= request.getContextPath() %>/detail.no?nno=" + num;
						});
						
					});
					</script>
					
				</section>
			</section>

		</section>

		<!-- 클래스 목록 -->
		<section id="classEdit">
			<br>
			<h4>&lt;클래스&gt;</h4>
			<br>
			<div class="tableArea" >
				<table class="table table-hover" id="classList"  class="tableScroll">
					<thead>
						<tr>
							<th>No.</th>
							<th>클래스명</th>
							<th>가격</th>
							<th>기간</th>
						</tr>
					</thead>
					<tbody>
						<% if(clist.isEmpty()){ %>
						<tr>
							<td colspan="4">존재하는 공지사항이 없습니다.</td>
						</tr>
						<%} else {  int idx=1; for(Workclass c : clist) {%>
						<tr>
							<input type="hidden" value="<%=c.getWcNo()%>">
							<td><%= idx %><%idx++; %></td>
							<td><%= c.getWcName() %></td>
							<td><%= c.getWcNOP() %></td>
							<td><%= c.getWcOpenClose() %></td>
						</tr>
						<% } %>
						<% } %>
					</tbody>
				</table>
			</div>
			<% if(loginUser!=null&&loginUser.getUserId().equals(shop.getId())){%>
			<div class="classbtn">
				<button id="class_openclass" class="btn btn-outline-secondary">클래스
					열기</button>
				&nbsp;
				<button id="class_updateclass" class="btn btn-outline-secondary">수정하기</button>
				&nbsp;
				<button id="class_deleteclass" class="btn btn-outline-secondary">삭제하기</button>
			</div>
		</section>
		<%}%>
		<script>
					$(function(){
						$("#classList td").click(function(){
							var num = $(this).parent().children().eq(0).val();
							console.log(num);
							location.href="<%= request.getContextPath() %>/detail.wc?WcNo=" + num;
						});
						
					});
		</script>

		<br> <br>
		
		<!-- 공방 소개글 -->
		<section id="intro3_third">
			<h4>&lt;공방 소개 글 &gt;</h4>&nbsp;
			<% if(loginUser!=null&&loginUser.getUserId().equals(shop.getId())){%>
			<input type="button" value="소개글 변경" id="intro3Edit" name="intro3Edit">
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
			<%} %>
			<br><br>
			<p id="introContent"><%=shop.getIntro()%></p>
		</section>
		<script>
			$(function() {
				$("#intro3Modal").hide();
				$("#intro3Edit").click(function() {
					$("#intro3Modal").click();
				});
			});

			$(function() {
				// 2. 버튼 클릭 시 POST 방식으로 서버에 데이터 전송 및 응답
				$("#btn2").click(function() {
					var input = $("#modalText").val();

					$.ajax({
						url : "updateIntro.sh",
						data : {
							input : input
						},
						type : "post",
						// dataType 속성 : 서버의 응답 데이터의 형식을 지정해주는 속성.
						//	미작성 시 자동으로 응답데이터의 형식을 판단하여 알맞게 지정함.
						//dataType : "text",
						success : function(result) {
							$("#introContent").val(result);
						},
						error : function(e) {
							console.log(e);
						}
					});
				});
			});
		</script>
		<br><br>
		
		<!-- 사진... -->
		<%if(cPictures.isEmpty()){}else{ %>
		<section id="content_final_slide">
			<br>
			<h4>&lt;사진&gt;</h4>
			<br>
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">

				<ol class="carousel-indicators">

					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<%
						for (int i = 2; i < cPictures.size(); i++) {
					%>
					<li data-target="#carouselExampleIndicators"
						data-slide-to="<%=i - 1%>"></li>
					<%
						}
					%>
				</ol>

				<div class="carousel-inner">
					<div class="carousel-item active">
						<img id="detailImg" class="d-block w-100" height="300px" alt="..."
							src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=cPictures.get(1).getReName()%>">
					</div>

					<%
						for (int i = 2; i < cPictures.size(); i++) {
					%>
					<div class="carousel-item">
						<img id="detailImg" class="d-block w-100" height="300px" alt="..."
							src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=cPictures.get(i).getReName()%>">
					</div>

					<%
						}
					%>
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
		<%} %>


	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>


