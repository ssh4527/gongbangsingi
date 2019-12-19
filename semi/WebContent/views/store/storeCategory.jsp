<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, workshop.model.vo.*"%>
<%
	ArrayList<Workshop> list = (ArrayList<Workshop>) request.getAttribute("list");
	ArrayList<ShopFile> flist = (ArrayList<ShopFile>) request.getAttribute("flist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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

.gal {
	position: relative;
	width: 350px;
	height: 300px;
	cursor: pointer;
}

#thumbnail {
	position: relative;
	overflow: hidden;
}

.gal:hover {
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

.shortIntro {
	width: 300px;
}

.gradeDis {
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
					<form method="post" id="category">
						<table>
							<%
								int idx = 1;
								for (Workshop shop : list) {
							%>
							<tr>
								<td><input type="checkbox" class="custom-control-input"
									value="<%=shop.getCategory()%>" id="<%=idx%>" name="category"
									checked> <label class="custom-control-label"
									for="<%=idx%>"><%=shop.getCategory()%></label></td>
							</tr>
							<%
								idx++;
								}
							%>

						</table>
						<br> <br> <br> <br> <br> <br>

						<button type="button" class="btn btn-warning" id="btnsort1">적용하기</button>
					</form>

				</div>
			</div>

			<!-- 정렬 2 -->
			<div class="sort2 sort">
				<h2>정렬기준</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<form method="post" id="sort">
						<table>
							<tr>
								<td><input type="checkbox" name="sort"
									class="custom-control-input sort2" value="인기순"
									id="sort2_check1"> <label class="custom-control-label"
									for="sort2_check1">인기순</label></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sort"
									class="custom-control-input sort2" value="최신순"
									id="sort2_check2"> <label class="custom-control-label"
									for="sort2_check2">최신순</label></td>
							</tr>
						</table>
						<br> <br> <br> <br> <br> <br>
						<button type="button" class="btn btn-warning" id="btnsort2">적용하기</button>
					</form>
				</div>
			</div>

		</div>
	</div>


	<!-- 정렬 리스트 script -->
	<script>
		$(function() {
			// 카테고리 버튼 누르면

			$("#sortlist1").click(function() { 
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","inline_block").show();
				$(".sort2").css("display","none");
				$(".distance").css("display","none");
			});
			
			// 정렬기준 버튼 누르면
			$("#sortlist2").click(function() {
				$(".bigWrapper").css("display", "flex").show();

				$(".sort2").css("display","inline_block").show();
				$(".sort1").css("display","none");
				$(".distance").css("display","none");
			});
			
			// 거리순 버튼 누르면
			$("#distance").click(function() {
				distancePopup();
				console.log("dd");
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
					$("#sortlist1").css("color","red");
					sortFunc();
			});
			
			$("#btnsort2").click(function(){
				$(".bigWrapper").css("display","none");
				if($('.sort2').is(":checked")){
					$("#sortlist2").html($(".sort2:checked").val() + " ∨");
					$("#sortlist2").css("color","red");
					sortFunc();
				}
				
			});
			
			function distancePopup() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
						
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {

		                        var result = results[0]; //첫번째 결과의 값을 활용
								console.log(result);
		                       
		                        <%-- location.href="<%=request.getContextPath()%>/distance.sh?addr="+addr;
		                         --%>
		                    }
		                });
		            }
		        }).open();
		    }
			
			function sortFunc() {
				var s = "null";
				$("input[name='sort']:checked").each(function(i) {
					s = $(this).val();
				});
				var category = [];
				$("input[name='category']:checked").each(function(i) {
					/* category.push("'"+$(this).val()+"'"); */
					category.push($(this).val());
				});
				var c = category.join(",");
				console.log(c);
				console.log(s);
				$.ajax({
				url : "sort.sh",
				type : "post",
				data : {
					sort : s,
					category : c
				},
				success : function(slist) {
					$("#glist").html("");

					$.each(slist,function(index, value) {
							console.log("hh");

							var $div1 = $('<div class="col-md-4">');
							var $div2 = $('<div class="card mb-4 shadow-sm shop">');
							var $input1 = $(
									'<input type="hidden">')
									.val(value.WsNo);
							console.log(value.WsNo);
							var $thumbnailDiv = $("<div id='thumbnail'>");

							var $thumbnail = $("<img class='gal'>")/* .attr("src","request.getContextPath()/resources/thumbnail_uploadFiles/value.ReName").css({"width":"100%","height":"100%"}) */;

							var $cardBody = $("<div class='card-body'>");
							var $category = $(
									"<small class='text-muted'>")
									.text(
											value.Category);
							var $name = $(
									"<p class='card-text'>")
									.text(value.WsName);
							var $grade = $("<b>").text(
									"★" + value.grade);
							var $wel = $(
									"<small class='text-muted'>")
									.text("구경하세요");

							$div1.append($div2);
							$div2.append($input1);
							$div2.append($thumbnailDiv);
							$thumbnailDiv
									.append($thumbnail);
							$div2.append($cardBody);
							$cardBody.append($category);
							$cardBody.append($name);
							$cardBody.append($grade);
							$cardBody.append($wel);
							$("#glist").append($div1);

						});
				},

				error : function(e) {
					alert();
				}
			});

			}
		});
	</script>

	<!-- 공방 위치 지도 API -->
	<section id="mapArea">
		<div class="map_wrap">
			<div id="map" style="width: 1000px; height: 300px;"></div>
		</div>
	</section>

	<div id="sortlist">
		<br>
		<a id="sortlist1">카테고리 ∨</a>&nbsp;&nbsp;&nbsp; <a id="sortlist2">정렬기준
			∨</a>&nbsp;&nbsp;&nbsp; <a id="distance">거리순 ∨</a>
	</div>
	<hr>

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
						level : 10
					};
					
					// 지도를 생성합니다 
					var map = new kakao.maps.Map(container, options);
					
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places(map); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다 
					<%for (Workshop s : list) {%>
					geocoder.addressSearch('<%=s.getAddress()%>',function(result, status) {
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
														content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=s.getWsName()%></div>'
													});
											infowindow.open(map, marker);

											//지도의 중심을 결과값으로 받은 위치로 이동합니다.
											map.setCenter(coords);
										}
									});
					<%}%>
					
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

	<!-- 앨범 부분...  -->

	<div class="album py-5 bg-light" id="whole">
		<div class="container">
			<div class="row" id="glist">
				<%-- <div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div id="thumbnail">
							<img
								src="<%=request.getContextPath()%>/resources/images/jar1.jpg"
								width="100%" height="100%" class="gal">
						</div>
						<div class="card-body">
							<small class="text-muted">Dish Factory</small>
							<p class="card-text" align="left">반지나라</p>
							<div class="d-flex justify-content-between align-items-center">
								<small class="text-muted">★4.2</small> <small class="text-muted">구경하세요</small>
							</div>
						</div>
					</div>
				</div> --%>

				<%
					ArrayList<Workshop> viewList = null;
					if (list != null) {
						viewList = list;
					}
					for (Workshop shop : viewList) {
				%>
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm shop">
						<input type="hidden" value="<%=shop.getWsNo()%>">
						<div id="thumbnail">
							<%
								boolean check = true;
									for (ShopFile sf : flist) {
										if (shop.getWsNo().equals(sf.getFs_destination())) {
											check = false;
							%>
							<img
								src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=sf.getReName()%>"
								width="100%" height="100%" class="gal">
							<%
								}
										if (check) {
							%>
							<img width="100%" height="100%" class="gal">
							<%
								}
									}
							%>

						</div>
						<div class="card-body">
							<small class="text-muted"><%=shop.getCategory()%></small>
							<p class="card-text">
								공방명 :
								<%=shop.getWsName()%></p>
							<div class="">
								★<%=shop.getGrade()%>
								<small class="text-muted">구경하세요</small>
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
		
		location.href="<%=request.getContextPath()%>/detail.sh?WsNo="+ WsNo;
	});
	</script>
	<%@ include file="../common/footbar.jsp"%>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>