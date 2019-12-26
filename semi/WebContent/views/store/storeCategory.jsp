<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, workshop.model.vo.*"%>
<%
	ArrayList<Workshop> list = (ArrayList<Workshop>) request.getAttribute("list");
	ArrayList<ShopFile> flist = (ArrayList<ShopFile>) request.getAttribute("flist");
	System.out.println(flist);
	String keyword=(String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

.sortbtn {
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

#menu {
    width:960px;
    height:40px;
}

ul.navi {
    /* 왼쪽 정렬 될 수 있게*/
    float:left;
    width:960px;
    /* 기본적으로 적용되는 margin, padding 제거 */
    margin:0;
    padding:0;
    /* 불렛 없애기 */
    list-style:none;
    background:#39f;

    /* 좌우 상단 둥글게 */
    border-top-right-radius:10px;
    border-top-left-radius:10px;
}

/* 메인 메뉴 inline 속성으로 */
ul.navi li {
    display:inline;
}

ul.navi li a {
    /* 모든 a 태그 왼쪽 정렬 */
    float:left;
    font:bold 14px 굴림;
    line-height: 40px;
    color:#fff;
    /* 기존의 a 태그의 밑줄 없애기 */
    text-decoration:none;
    text-shadow:1px 1px 1px #880000;
    margin:0;
    padding: 0 30px;
    /* 위 오른쪽 아래 왼쪽 */
}

ul.navi li:hover>a {
    background:#36F;

    /* 메인 메뉴 마우스 오버 시 상단 둥글게 */
    border-top-right-radius:10px;
    border-top-left-radius:10px;
}

/* ul의 후손 ul은 보여지지 않게 하기 */
ul.navi ul {
    display:none;
}

/* 내부 ul 자리 잡기 */
ul.navi li:hover>ul {
    position:absolute;
    display:block;
    width:920px;
    height:45px;
    margin:40px 0 0 0;
    background: #33F;

    /* 좌우 하단 둥글게 */
    border-bottom-right-radius:10px;
    border-bottom-left-radius:10px;
}

/* 내부 ul의 a 태그 정렬 */
ul.navi li:hover>ul li a {
    padding: 0 30px 0 0;
    background:#33F;
}

/* 하위 a 태그에 마우스 오버 시 글자 색 변경 */
ul.navi li:hover>ul li a:hover{
    color:#120000;
    text-decoration:none;
    text-shadow:none;
}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%if(list!=null){ %>
	<!-- 정렬창 보이는 곳 -->
	<%-- <div id="menu">
        <ul class="navi">
            <li><a href="#">지역별</a>
            	<ul> <%
            	ArrayList<String> addr= new ArrayList<>();
            
				for (Workshop shop : list) {
					String c=shop.getCategory();
					boolean check=true;
					for(int i=0;i<addr.size();i++){
						if(addr.get(i)==c){
							check=false;
						}
					}
					if(check){
						addr.add(shop.getAddress());
					}
				}
				for(int i=0;i<addr.size();i++){
				
			%>
                	<li><a href="category(<%=addr.get(i)%>);"><%=addr.get(i)%></a></li>
          
                <%} %>
                </ul></ul>
            
            <li><a href="#">카테고리</a>
            <ul>
            <%
            	ArrayList<String> arr= new ArrayList<>();
            
				for (Workshop shop : list) {
					String c=shop.getCategory();
					boolean check=true;
					for(int i=0;i<arr.size();i++){
						if(arr.get(i)==c){
							check=false;
						}
					}
					if(check){
						arr.add(shop.getCategory());
					}
				}
				for(int i=0;i<arr.size();i++){
				
			%>
                	<li><a href="category(<%=arr.get(i)%>);"><%=arr.get(i)%></a></li>
          
                <%} %>
                </ul>
            </li>
            <li><a href="#">게시판</a>
                <ul>
                    <li><a href="#">인기순</a></li>
                    <li><a href="#">최신순</a></li>
                </ul>
            </li>
        </ul>
	</div> --%>
	
	<div class='bigWrapper'>
		<div class="showWrapper">
		<!-- 지역별 -->
			<div class="sort3 sort">
				<h2>지역별</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<form method="post" id="location">
						<table>
							<%
								ArrayList<String> addr= new ArrayList<>();
								HashSet<String> addrh= new HashSet<String>();
								int idx = 1;
								for (Workshop shop : list) {
									addrh.add(shop.getAddress().substring(0,2));
								}
								addr=new ArrayList<>(addrh);
								for(int i=0;i<addr.size();i++){
								
							%>
							<tr>
								<td><input type="checkbox" class="custom-control-input"
									value="<%=addr.get(i)%>" id="<%=idx%>l" name="location"
									checked> <label class="custom-control-label"
									for="<%=idx%>l"><%=addr.get(i)%></label></td>
							</tr>
							<%
								idx++;
								}
							%>

						</table>
						<br> <br> <br> <br> <br> <br>

						<button type="button" class="btn btn-warning sortbtn" id="btnsort3">적용하기</button>
					</form>

				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="sort1 sort">
				<h2>카테고리</h2>
				<br> <br>
				<div class="custom-control custom-checkbox">
					<form method="post" id="category">
						<table>
							<%
								int cidx = 1;
								ArrayList<String> arr= new ArrayList<>();
								HashSet<String> arrh= new HashSet<String>();
								
								for (Workshop shop : list) {
									arrh.add(shop.getCategory());
								}
								arr=new ArrayList<>(arrh);
								for(int i=0;i<arr.size();i++){
							%>
							<tr>
								<td><input type="checkbox" class="custom-control-input"
									value="<%=arr.get(i)%>" id="<%=cidx%>c" name="category"
									checked> <label class="custom-control-label"
									for="<%=cidx%>c"><%=arr.get(i)%></label></td>
							</tr>
							<%
								cidx++;
								}
							%>

						</table>
						<br> <br> <br> <br> <br> <br>

						<button type="button" class="btn btn-warning sortbtn" id="btnsort1">적용하기</button>
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
						<button type="button" class="btn btn-warning sortbtn" id="btnsort2">적용하기</button>
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
				$(".sort3").css("display","none");
			});
			
			// 정렬기준 버튼 누르면
			$("#sortlist2").click(function() {
				$(".bigWrapper").css("display", "flex").show();

				$(".sort2").css("display","inline_block").show();
				$(".sort1").css("display","none");
				$(".sort3").css("display","none");
			});
			
			// 거리순 버튼 누르면
			$("#locationSort").click(function() {
				//distancePopup();
				$(".bigWrapper").css("display", "flex").show();

				$(".sort2").css("display","none");
				$(".sort1").css("display","none");
				$(".sort3").css("display","inline_block").show();
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
			
			$("#btnsort3").click(function(){
				$(".bigWrapper").css("display","none");
				$("#locationSort").css("color","red");
				sortFunc();
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
			
			$(document).on('click', '.shop', function(){
				console.log("g");
					var WsNo = $(this).children().eq(0).val();
					location.href="<%=request.getContextPath()%>/detail.sh?WsNo="+ WsNo;
			});
			
			//정렬
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
				
				var location = [];
				$("input[name='location']:checked").each(function(i) {
					/* category.push("'"+$(this).val()+"'"); */
					location.push($(this).val());
				});
				var loc = location.join(",");
				
				var key='<%=keyword%>';
				console.log(c);
				console.log(s);
				console.log(loc);
				console.log(key);
				$.ajax({
				url : "sort.sh",
				type : "post",
				data : {
					sort : s,
					category : c,
					location : loc,
					keyword : key,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				},
				success : function(slist) {
					$("#glist").html("");
						var $div1 = $('<div class="col-md-4">');
						var $div2 = $('<div class="card mb-4 shadow-sm shop">');
					if(slist){
					$.each(slist,function(index, value) {
							var $div1 = $('<div class="col-md-4">');
							var $div2 = $('<div class="card mb-4 shadow-sm shop">');
							var $input1 = $('<input type="hidden">').val(value.WsNo);
							console.log(value.WsNo);
							var $thumbnailDiv = $("<div id='thumbnail'>");
							
							if(value.reName)
								var $thumbnail = $("<img class='gal' width='100%' height='100%'>").attr("src",'<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/'+value.reName);
							else
								var $thumbnail = $("<img class='gal' width='100%' height='100%'>");
								
							console.log(value.reName);
							var $cardBody = $("<div class='card-body' style='width:100%;'>");
							var $category = $("<small class='text-muted'>").text(value.Category);
							var $name = $("<p class='card-text'>").text(value.WsName);
							var $grade = $("<b id='grade'>").text(value.grade);
							var $gradestar =$("<b>").text("★");
							var $wel = $("<small class='text-muted' style='float:right'>").text("구경하세요");

							$div1.append($div2);
							$div2.append($input1);
							$div2.append($input2);
							$div2.append($thumbnailDiv);
							$thumbnailDiv.append($thumbnail);
							$div2.append($cardBody);
							$cardBody.append($category);
							$cardBody.append($name);
							$cardBody.append($gradestar);
							$cardBody.append($grade);
							$cardBody.append($wel);
							$("#glist").append($div1);
					});}else{
						var $p1 = $('<p>').text("현재 등록된 공방이 없습니다.");
						
						$div1.append($div2);
						$div2.append($p1);
						
						$("#glist").append($div1);
					}
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
		<a id="locationSort">지역별 ∨</a>&nbsp;&nbsp;&nbsp;<a id="sortlist1">카테고리 ∨</a>&nbsp;&nbsp;&nbsp;
		 <a id="sortlist2">정렬기준 ∨</a>
	</div>
	
	<!-- 검색 하였을 때 -->
	<%if(keyword!=null){ %>
	<div>
		<a style="float:right;">'<%=keyword %>'로 검색한 결과</a>
	</div>
	<%} %>
	
	<hr>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2afbe1f7936e7a946254f01d5b3a8e79&libraries=services"></script>
	<script>
				// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
				var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
				    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
				    markers = []; // 마커를 담을 배열입니다
				   
				    
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
					
					
				</script>

	<!-- 앨범 부분...  -->
	<div class="album py-5 bg-light" id="whole">
		<div class="container">
			<div class="row" id="glist">

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
										
									System.out.println(shop.getWsNo()+" , "+sf.getFs_destination());
										if (shop.getWsNo().equals(sf.getFs_destination())) {
											check = false;
							%>
							<img
								src="<%=request.getContextPath()%>/resources/thumbnail_uploadFiles/<%=sf.getReName()%>"
								width="100%" height="100%" class="gal">
							<%
								}
									}if (check) {
										%>
										<img width="100%" height="100%" class="gal">
										<%
											}
							%>

						</div>
						<div class="card-body" style="width:100%; ">
							<small class="text-muted"><%=shop.getCategory()%></small>
							<p class='card-text'>
								<%=shop.getWsName()%></p>
							<div class="">
								<b>★</b><b id="grade"><%=shop.getGrade()%></b>
								<small class="text-muted" style="float:right">구경하세요</small>
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

	<%}else{ %>
	<div style="text-align:center; height:700px"><br><h4> 현재 등록된 공방이 없습니다.</h4></div>
	<%} %>
<%@ include file="../common/footbar.jsp"%>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>