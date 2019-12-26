<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, review.model.vo.*,workshop.model.vo.*,workclass.model.vo.*"%>
<%
	Workshop shop = (Workshop) request.getAttribute("shop");
	ShopFile titlePic = (ShopFile) request.getAttribute("titlePic");

	ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
	ArrayList<Workclass> clist = (ArrayList<Workclass>) request.getAttribute("clist");
	ArrayList<ClassFile> cPictures = (ArrayList<ClassFile>) request.getAttribute("cPictures");
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
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

section,div {
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
	height: 60%;
	padding: 10px;
}

#introl1_2 {
	float: left;
	width: 100%;
	height: 30%;
	padding: 10px;
}

#kakao{
	text-align: center;
}
#introl1_2_1 {
	border: 1px solid black;
	padding-left: 5%;
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


h4 {
	display: inline;
}

#fileButton {
	visibility: hidden;
}

#reviewMore {
	float: right;
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
						String fileBtnN = "사진 등록";
						if (titlePic.getReName() == null) {
					%>
					<img id="titleImg" class="thumbnail">
					<%
						} else {
							fileBtnN = "사진 변경";
					%>

					<img id="titleImg"
						src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=titlePic.getReName()%>"
						width="350px" height="200px">
					<%
						}
					%>
					<form id="thumbnailForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" value="<%=shop.getWsNo()%>" name="WsNo"
							id="shopNo"> <input type="hidden" value="<%=fileBtnN%>"
							name="fileBtnN" id="shopNo">
						<%
							boolean userCheck = false;
							if (loginUser != null && loginUser.getUserId().equals(shop.getId())) {
								userCheck = true;
						%>
						<input type="file" id="fileButton" name="file"
							onchange="preview(this,1)"> <input type="button" class="btn btn-success"
							value="<%=fileBtnN%>" id="thumbnailEdit" style="float:right">

						<%
							}
						%>
					</form>
					<br>
					<p id="storeName" style="text-align: center;"><b><%=shop.getWsName()%></b></p>

					<script>
					$(function() {
						$("#thumbnailEdit").click(function() {
							$("#fileButton").click();
						});
						
					});
					
					function preview(value, num) {
						if (value.files && value.files[0]) {
							var reader = new FileReader();

							reader.readAsDataURL(value.files[0]);

							reader.onload = function(e) {
								$("#titleImg").attr("src" + reader.result + " width=350 height=200>");
							}
						}
						picUpdate();
					}
					function picUpdate(){
						 var fm = $("#thumbnailForm")[0];
						 console.log(fm);
						 var fileData = new FormData(fm);

						 $.ajax({
						        url :"shopThumbnail.sh",
						        data:fileData,
						        type:"post",
						        cache:false,
						        contentType:false,
						        processData:false,
						    	success: function(file){
						    	$("#titleImg").attr("src","<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/"+file);
						    }
						 });	
					}
				</script>
				</section>
				<br> <br> <br> 


				<!-- 주소,전화번호,sns계정 등 공방 정보  -->
				<section id="introl1_2">
					<div id="introl1_2_1">
						<p id="addr">주소: <%=shop.getAddress()%></p>
						<p id="phone">연락처☎: <%=shop.getWsTel()%></p>
						<p id="sns">
							<%String[] snslist =shop.getSns().split(",");
							for(String sns : snslist){%>
							<a><%=sns%></a><br>
							<%} %>
						</p>
						<p>사업자 번호: <%=shop.getAccountNum() %></p>
					</div>
				</section>
				<%
					if (!userCheck&&shop.getSns().contains("카카오톡")) {
						int kakaoNum= shop.getSns().indexOf("카카오톡 :");
				%>
				<div id="kakao">
				<a href="javascript:void chatChannel()"> <img
					src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png" />
				</a>
				<script type='text/javascript'>
				
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('37bf650bd71c1e125e49c40d96c383e1');
						function chatChannel() {
							Kakao.Channel.chat({
								channelPublicId : '<%=shop.getSns().substring(kakaoNum+7,(shop.getSns().substring(kakaoNum).indexOf(",")+kakaoNum))%>' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
							});
						}
						//]]>
						
					</script>
					</div>
				<%
					}
				%>
			</section>


			<section id="first_intro2">
				<!-- 공방 위치 지도 API -->

				<section id="mapArea">
					<h5>&lt;오시는 길&gt;</h5>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<!-- <div id="map" style="width: 550px; height: 90%;"></div> -->
						<ul id="category">
							<li id="PK6" data-order="0"><span class="category_bg bank"></span>
								주차장</li>
						</ul>
					</div>
				</section>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2afbe1f7936e7a946254f01d5b3a8e79&libraries=services"></script>
				<script>
				// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
				var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
				    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
				    markers = [], // 마커를 담을 배열입니다
				    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
				    
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 4
					};
					
					// 지도를 생성합니다 
					var map = new kakao.maps.Map(container, options);
					
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places(map); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					console.log("<%=shop.getAddress()%>");
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
					
					// 지도에 idle 이벤트를 등록합니다
					kakao.maps.event.addListener(map, 'idle', searchPlaces);

					// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
					contentNode.className = 'placeinfo_wrap';

					// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
					// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
					addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
					addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

					// 커스텀 오버레이 컨텐츠를 설정합니다
					placeOverlay.setContent(contentNode);  

					// 각 카테고리에 클릭 이벤트를 등록합니다
					addCategoryClickEvent();

					// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
					function addEventHandle(target, type, callback) {
					    if (target.addEventListener) {
					        target.addEventListener(type, callback);
					    } else {
					        target.attachEvent('on' + type, callback);
					    }
					}

					// 카테고리 검색을 요청하는 함수입니다
					function searchPlaces() {
					    if (!currCategory) {
					        return;
					    }
					    
					    // 커스텀 오버레이를 숨깁니다 
					    placeOverlay.setMap(null);

					    // 지도에 표시되고 있는 마커를 제거합니다
					    removeMarker();
					    
					    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
					}

					// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
					function placesSearchCB(data, status, pagination) {
					    if (status === kakao.maps.services.Status.OK) {

					        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
					        displayPlaces(data);
					    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
					        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

					    } else if (status === kakao.maps.services.Status.ERROR) {
					        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
					        
					    }
					}

					// 지도에 마커를 표출하는 함수입니다
					function displayPlaces(places) {

					    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
					    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
					    var order = document.getElementById(currCategory).getAttribute('data-order');

					    

					    for ( var i=0; i<places.length; i++ ) {

					            // 마커를 생성하고 지도에 표시합니다
					            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

					            // 마커와 검색결과 항목을 클릭 했을 때
					            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
					            (function(marker, place) {
					                kakao.maps.event.addListener(marker, 'click', function() {
					                    displayPlaceInfo(place);
					                });
					            })(marker, places[i]);
					    }
					}

					// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
					function addMarker(position, order) {
					    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
					        imgOptions =  {
					            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
					            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
					        },
					        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
					            marker = new kakao.maps.Marker({
					            position: position, // 마커의 위치
					            image: markerImage 
					        });

					    marker.setMap(map); // 지도 위에 마커를 표출합니다
					    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

					    return marker;
					}

					// 지도 위에 표시되고 있는 마커를 모두 제거합니다
					function removeMarker() {
					    for ( var i = 0; i < markers.length; i++ ) {
					        markers[i].setMap(null);
					    }   
					    markers = [];
					}

					// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
					function displayPlaceInfo (place) {
					    var content = '<div class="placeinfo">' +
					                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

					    if (place.road_address_name) {
					        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
					                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
					    }  else {
					        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
					    }                
					   
					    content += '    <span class="tel">' + place.phone + '</span>' + 
					                '</div>' + 
					                '<div class="after"></div>';

					    contentNode.innerHTML = content;
					    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
					    placeOverlay.setMap(map);  
					}


					// 각 카테고리에 클릭 이벤트를 등록합니다
					function addCategoryClickEvent() {
					    var category = document.getElementById('category'),
					        children = category.children;

					    for (var i=0; i<children.length; i++) {
					        children[i].onclick = onClickCategory;
					    }
					}

					// 카테고리를 클릭했을 때 호출되는 함수입니다
					function onClickCategory() {
					    var id = this.id,
					        className = this.className;

					    placeOverlay.setMap(null);

					    if (className === 'on') {
					        currCategory = '';
					        changeCategoryClass();
					        removeMarker();
					    } else {
					        currCategory = id;
					        changeCategoryClass(this);
					        searchPlaces();
					    }
					}

					// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
					function changeCategoryClass(el) {
					    var category = document.getElementById('category'),
					        children = category.children,
					        i;

					    for ( i=0; i<children.length; i++ ) {
					        children[i].className = '';
					    }

					    if (el) {
					        el.className = 'on';
					    } 
					} 
					
				</script>

				<!-- 후기 목록 -->
				<section id="store_review">
					<div class="tableArea" class="tableScroll">
						<h4>&lt; 후기 &gt;</h4>
						&nbsp;
						<div id="score">
							★<%=shop.getGrade()%>/ 5.0
						</div>
						<a href="<%=request.getContextPath()%>/review.search?searchReviewInput=<%=shop.getWsNo()%>&searchReviewCondition='공방'" id="reviewMore">더보기&gt;&gt;</a>
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
									} else {
										int idx = 1;
										for (Review r : rlist) {
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
									if(idx==4){
										break;
									}
									}
								%>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</section>
			</section>

		</section>

		<!-- 클래스 목록 -->
		<section id="classEdit">
			<br>
			<h4>&lt;클래스&gt;</h4>
			<br> <br>
			<div class="tableArea">
				<table class="table table-hover" id="classList" class="tableScroll">
					<thead>
						<tr>
							<th style="display:none;"></th>
							<th>No.</th>
							<th>클래스명</th>
							<th>가격</th>
							<th>기간</th>
						</tr>
					</thead>
					<tbody id="classlistBody">
						<%
							boolean isclass=false;
							if (clist.isEmpty()) {
						%>
						<tr>

							<td colspan="5">존재하는 클래스가 없습니다.</td>

						</tr>
						<%
							} else {
								int idx = 1;
								isclass=true;
								for (Workclass c : clist) {
						%>
						<tr>
							<td style="display:none;"><%=c.getWcNo()%></td>
							<td><%=idx%> <%idx++;%></td>
							<td><%=c.getWcName()%></td>
							<td><%=c.getWcNOP()%></td>
							<td><%=c.getStartdate()%> - <%= c.getEnddate() %></td>
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
			<%
				if (loginUser != null && loginUser.getUserId().equals(shop.getId())) {
			%>
			<div class="classbtn">
				<button id="class_openclass" class="btn btn-outline-secondary"
					onclick="location.href='<%=request.getContextPath()%>/views/classdetail/insertClass.jsp?wsNo=<%= shop.getWsNo() %>'">클래스
					열기</button>
				&nbsp;
				<%if(isclass){ %>
				<button id="class_updateclass" class="btn btn-outline-secondary">수정하기</button>
				&nbsp;
				<button id="class_deleteclass" class="btn btn-outline-secondary" data-toggle="modal" data-target=".classDelmodal">삭제하기</button>
				<%} %>
			</div>
		</section>
		<!-- 삭제하기 Modal -->
		<form action="<%=request.getContextPath()%>/delete.class" method="post">
			<div class="modal fade classDelmodal" tabindex="-1"
				role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">삭제하고자 하는 클래스를 선택해주세요</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<input type="hidden" name="wsNo" value="<%=shop.getWsNo()%>">
						<div class="modal-body">
						<table>
							<% int idx = 1;
								for (Workclass c : clist) {
							%>
							<tr>
								<td><input type="checkbox" class="custom-control-input"
									value="<%=c.getWcNo()%>" id="<%=idx%>d" name="deleteCName"> 
									<label class="custom-control-label" for="<%=idx%>d"><%=c.getWcName()%>(<%=c.getStartdate() %> - <%= c.getEnddate() %>)</label> &nbsp;&nbsp;&nbsp;</td>
							</tr>
							<%
								idx++;
								}
							%>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<input type="submit" id="deleteCheckClassBtn" value="체크한 클래스 삭제하기"
								class="btn btn-primary"></button>
						</div>
					</div>
				</div>
			</div>
			</form>
		<%
			}
		%>
		<script>
					$(function(){
						$("#classList tr").click(function(){
							var num = $(this).children().eq(0).html();
							console.log(num);
							location.href="<%=request.getContextPath()%>/godetail.class?wcNo=" + num;
						});
						

					});
				
		</script>

		<br> <br>

		<!-- 공방 소개글  변경-->
		<section id="intro3_third">
			<h4>&lt;공방 소개 글 &gt;</h4>
			&nbsp;
			<%
				if (loginUser != null && loginUser.getUserId().equals(shop.getId())) {
			%>
			<input type="button" value="소개글 변경" id="intro3Edit"  class="btn btn-success" name="intro3Edit" 
				data-toggle="modal" data-target=".bd-example-modal-lg">
				
			<!-- Modal -->
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
							<textarea cols="80" rows="10" id="modalText" style="resize:none;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" id="updateIntro3" data-dismiss="modal"
								class="btn btn-primary">수정완료</button>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
			<br> <br>

			<!-- 공방 소개글  -->
			<%
				if (shop.getIntro() != null) {
			%>
			<textarea id="introContent" cols="900" readonly><%=shop.getIntro()%></textarea>
			<%
				} else {
			%>
			<textarea id="introContent" cols="900" readonly></textarea>
			<%
				}
			%>
		</section>
		<script>

			$(function() {
				
				<%-- $("#deleteCheckClassBtn").click(function() {
					var checkC = "";
					$("input[name='deleteCName']:checked").each(function(i) {
						checkC += $(this).val()+",";
					});
					if(checkC==""){
						alert("삭제를 취소하였습니다.");
					}else{
					var WsNo="<%=shop.getWsNo()%>";
						location.href="delete.class?wsNo="+WsNo+"&wcNo="+checkC;
						/* $.ajax({
							url : "delete.class",
							data : {
								input : checkC,
								WsNo : WsNo
							},
							
							type : "post",
							success : function(result) {
								$("#classlistBody").html("");

								console.log(checkC);
							},
							error : function(e) {
								alert();
							}
						}); */
					}
				}); --%>
				
				$("#updateIntro3").click(function() {
					var input = $("#modalText").val();
					if(input==0){
						alert("수정을 취소하였습니다.");
					}else{
					var WsNo="<%=shop.getWsNo()%>";

						$.ajax({
							url : "updateIntro.sh",
							data : {
								input : input,
								WsNo : WsNo
							},
							type : "post",
							success : function(result) {
								$("#introContent").val(result);
							},
							error : function(e) {
								alert();
							}
						});
					}
				});
			});
		</script>
		<br> <br>

		<!-- 사진... -->
		<%
			if (!cPictures.isEmpty()) {
		%>
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
							src="<%=request.getContextPath()%>/resources/class_uploadFiles/<%=cPictures.get(1).getChangeName()%>">
					</div>

					<%
						for (int i = 2; i < cPictures.size(); i++) {
							System.out.println(cPictures.get(i).getChangeName());
					%>
					<div class="carousel-item">
						<img id="detailImg" class="d-block w-100" height="300px" alt="..."
							src="<%=request.getContextPath()%>/resources/class_uploadFiles/<%=cPictures.get(i).getChangeName()%>">
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
		<%
			}
		%>


	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>


