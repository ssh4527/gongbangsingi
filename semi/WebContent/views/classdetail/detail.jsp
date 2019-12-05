<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>클래스 상세 정보</title>
<style>
section, div, header {
	box-sizing: border-box;
	display: block;
}

#detail_img {
	width: 500px;
	height: 490px;
}

#outer {
	width: 1000px;
	/* div를 화면 가운데로 오게 하기 */
	height: 100%;
	margin: auto;
	position: relative;
}

#detail_img_div {
	width: 500px;
	height: 700px;
	float: left;
}

#detail_class_p_title, #detail_class_p_startdate,
	#detail_class_p_enddate {
	font-size: 25px;
	text-align: center;
}

#interest_btn {
	width: 100px;
	height: 50px;
	float: right;
}

#detail_search_btn, #detail_enter_btn {
	padding: 10px;
	width: 180px;
	float: right;
	margin: 10px;
}

#detail_detail_div {
	float: left;
	padding: 30px;
	height: 600px;
	width: 500px;
}

#detail_navi {
	background: rgb(204, 200, 200);
	width: 100%;
	height: 50px;
	font-size: 20px;
	padding: 10px;
	margin: auto;
}

#detail_detail_content {
	padding: 10px;
	text-align: center;
	
}

a {
	color: black;
}

a:hover {
	color: black;
}

#detail_come {
	padding: 10px;
	font-weight: bold;
	font-size: 20px;
}

#detail_comeimg {
	width: 800px;
	height: 300px;
}

#detail_review {
	padding: 10px;
	font-size: 20px;
}

#detail_warning_p {
	font-weight: bold;
}

.positioning {
	border: 1px black solid;
	text-align: center;
}

.fixed-area {
	width: 100px;
	height: 120px;
	position: fixed;
	top: 500px;
	right: 100px;
	box-shadow: 3px 3px 3px;
}

.fixed-area>div:hover {
	background: gray;
	cursor: pointer;
}

#dd {
	display: none;
}

#detail2 {
	padding: 3px;
}

#top_div {
	width: 1200px;
	height: 850px;
}

#tot_table {
	border: 1px solid red;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="positioning fixed-area">
		<div id="dd">
			<a href="#detail_detail_div">상세정보</a><br>
		</div>
		<div>
			<a href="#detail_review">후기</a><br>
		</div>
		<div>
			<a href="#detail_qna">QnA</a><br>
		</div>
		<div>
			<a href="#detail_warning">유의 사항</a>
		</div>
		<div>
			<a id="pre">이전 페이지</a>
		</div>
	</div>

	<script>
        	$(function(){
        		$("#pre").click(function(){
        			location="<%=request.getContextPath()%>";
        		});
        	});
        </script>


	<div id="outer">
		<div id="top_div">
			<div id="detail_img_div" style="padding: 10px;">
				<img src="<%=request.getContextPath()%>/resources/images/jar1.jpg"
					id="detail_img">
				<div
					style="padding: 10px; margin: 10px; margin-left: 10px; cursor: pointer;">
					<img src="<%=request.getContextPath()%>/resources/images/jar1.jpg"
						width=100px height=100px id="minImg1"> <img
						src="<%=request.getContextPath()%>/resources/images/jar2.jpg"
						width=100px height=100px id="minImg2"> <img
						src="<%=request.getContextPath()%>/resources/images/jar3.jpg"
						width=100px height=100px id="minImg3"> <img
						src="<%=request.getContextPath()%>/resources/images/city1.PNG"
						width=100px height=100px id="minImg4">
					<script>
                		$(function(){
                			$("#minImg1").mouseover(function(){
                				var imgsrc = $(this).attr("src");
                				$("#detail_img").attr("src",imgsrc);
                			});
                			$("#minImg2").mouseover(function(){
                				var imgsrc = $(this).attr("src");
                				$("#detail_img").attr("src",imgsrc);
                			});
                			$("#minImg3").mouseover(function(){
                				var imgsrc = $(this).attr("src");
                				$("#detail_img").attr("src",imgsrc);
                			});
                			$("#minImg4").mouseover(function(){
                				var imgsrc = $(this).attr("src");
                				$("#detail_img").attr("src",imgsrc);
                			});
                		});
                	</script>
				</div>
			</div>
			<div id="detail_detail_div">
				<hr>
				<div id="detail1">
					<!-- 클래스 이름 -->
					<p id="title">Dish Factory 도자기 만들기 체험</p>
				</div>
				<hr>
				<div id="detail2">
					<!-- 가격,적립금,포인트 -->
					<table>
						<tr>
							<td width=150px;><small style="color: gray">1인 기준 금액</small></td>
							<td><small>60,000</small></td>
						</tr>
						<tr>
							<td><small style="color: gray">보유 포인트</small></td>
							<td><small>3,000p</small></td>
						</tr>
						<tr>
							<td><small style="color: gray">적립 포인트</small></td>
							<td><small>3,000p</small></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="detail3" style="height: 120px;">
					<small style="color: gray;">도자기를 만드시는 시간이 약 1시간 30분이 소요되기
						때문에 마지막 오후 8시 20분 이전까지는 꼭 방문하여 주시길 부탁드립니다. 아래 일정선택을 통하여 예약 가능하며 기타
						d자세한 내용은 010-8904-0156으로 연락 주시면 감사하겠습니다.</small>
				</div>
				<hr>
				<div id="detail4">
					<table>
						<tr>
							<td width=150px;><small style="color: gray"> > 날짜/시간
							</small></td>
							<td><select name="time" id="time" style="font-size: 15px">
									<option value="">-[필수] 시간대를 선택해주세요 -</option>
									<option value="">----------------------</option>
									<option value="1">12:00 - 14:00</option>
									<option value="2">15:00 - 17:00</option>
							</select></td>
						</tr>
						<tr>
							<td><small style="color: gray"> > 인원수 </small></td>
							<td><input type="number" width="10px" min="0" max="9" id="count"></td>
						</tr>
						<tr>
							<td rowspan="2" style="text-align: right;"></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="detail5" style="text-align: left">
					<button type="button" class="btn btn-outline-secondary"
						style="float: right" id="ckoption">옵션 선택</button>
					<br>
					<br> <small style="color: gray; text-align: right;">최소
						인원 1명 이상</small>
					<table class="table" id="tottable">
						<thead>
							<tr>
								<td>클래스</td>
								<td>인원</td>
								<td>가격</td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<hr>
					<div id="detail6" style="text-align: right; padding: 10px;">
						<small>TOTAL : </small><small id="totprice">0</small>
						<script>
							$(function(){
								$("#ckoption").click(function(){
									var count = $("#count").val();
									var time = $("#time option:selected").text();	
									var $tableBody = $("#tottable tbody");
									$tableBody.html("");
										$("#tottable").append("<tr><td>" + $("#title").text() + "</td>" + "<td>" + count + "</td><td>" + time + "</td></tr>");
										$("#totprice").text(count * 60000);
										totflag = false;
								});
							});
						</script>
					</div>
					<div id="detail7">
						<button type="button" class="btn btn-outline-secondary" id="reservationBtn" style="width:100px">예약 하기</button>
						<button type="button" class="btn btn-outline-secondary" id="gongbangBtn">공방 구경</button>
						<button type="button" class="btn btn-outline-secondary" id="heartBtn">찜 하기</button>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<script>
          var count = 0;
          		$(function(){
          			$("#detail_img").click(function(){
          				var urlArr = new Array();
          				urlArr[0] =  "<%=request.getContextPath()%>/resources/images/jar2.jpg";
          				urlArr[1] =  "<%=request.getContextPath()%>/resources/images/jar3.jpg";
          				urlArr[2] =  "<%=request.getContextPath()%>/resources/images/city1.PNG";
          				urlArr[3] =  "<%=request.getContextPath()%>/resources/images/jar1.jpg";

									if (count > 3) {
										count = 0;
									}
									$("#detail_img").attr("src",
											urlArr[count++]);
								});
			});
		</script>

		
		<!-- 메인 부분 -->
		<div id="detail_main" style="width:1000px; text-align:center; position: relative;">
			<!-- 첫 번째 메인 이미지 -->
			<div style="width:1000px; height:500px; float:left; margin:10px;">
				<img src="<%= request.getContextPath() %>/resources/images/class_img1.jpg" style="width:800px; height:100%;">
			</div>
			
			<!-- 첫 번째 글 -->
			<div style="width:1000px; height:200px; float:left">
					Dish Factory는
					넓고 쾌적하여
					편안하고 단체 모두 즐겁게
					체험할 수 있는 공간이 준비되어있습니다. 
			</div>
			
			<!-- 두 번째 메인 이미지 -->
			<div style="width:1000px; height:500px; float:left; margin:10px;">
				<img src="<%= request.getContextPath() %>/resources/images/class_img1.jpg" style="width:800px; height:100%;">
			</div>
			
			<!-- 두 번째 글 -->
			<div style="width:1000px; height:200px; float:left">
					Dish Factory는
					넓고 쾌적하여
					편안하고 단체 모두 즐겁게
					체험할 수 있는 공간이 준비되어있습니다. 
			</div>
		</div>
		
		
		<!--  Map 부분 !!! -->
		<div id="detail_come" style="text-align: center;">
			<img src="<%=request.getContextPath()%>/resources/images/map1.PNG" id="detail_comeimg">
		</div>
	
		
		<div id="detail_detail_content" style="line-height:2em; ">
			<pre style="text-align:center">
반지만들기 반지카페8그램을 방문해 주셔서 감사합니다.
저희 반지카페는 고객이 직접 체험하는 반지공방으로 당일 만들어서 바로 가져가실 수 있는 공방입니다.
반지, 팔찌, 목걸이 재질은 99.99% 순은이며 반지 1개당 기본가격은
25,000원(폭 2.5mm)으로 반지폭을 증가하거나 탄생석 추가 등에 따라 현장에서 가격이 추가 발생합니다.
은팔찌 기본가격은 40,000원이고 목걸이 기본가격은 60,000만원입니다.
현장에서 직접 체험하면서 당일 만들어서 당일 현장에서 바로 가져가실 수 있으십니다.
반지를 만드시는 평균시간은 약 1시간 30분이 소요됩니다. 
예약방법은 예약금 없이 네이버 예약시스템을 활용하여 예약하시거나 010-8904-0156으로 문자로 연락주시면 됩니다. 
예약 가능한 시간은 오전 11시 부터 오후 8시 20분까지입니다. 
반지를 만드시는 시간이 약 1시간 30분이 소요됩니다.
아래 일정선택을 통하여 예약 가능하며 기타 자세한 내용은 010-8904-0156으로 연락 주시면 감사하겠습니다.
			</pre>
		</div>
		 
		
		
		<!-- 리뷰 -->
		<hr>
		<div id="detail_review">
			<div style="text-align:center;">
				<p>R E V I E W</p>
				<small style="color:gray; font-size:14px;">클래스의 이용후기를 적어주세요.</small>
			</div>
			<table style="color:gray; border-top: 1px solid gray; margin:auto;">
				<tr style="padding:13px; border-top: 1px solid gray; height:30px; margin-top:100px;line-height:3em;">
					<td width=800px style="font-weight: bold; font-size:16px;">감사합니다.</td>
					<td style="font-size:14px;">이름 | 2019-12-05</td>
				</tr>
				<tr>
					<td style="font-size:14px;">좋은 상담과 좋은 클래스 둘다만족해요 다른 클래스도 배우고싶습니다!!</td>
				</tr>
				<tr>
					<td width:>
					
				</tr>
			</table>
			
			
			
			
			
			
			
			
			
			
			
			<div>
				
				<button type="button" class="btn btn-outline-secondary"
					style="float: right">Review Write</button>
			</div>
		</div>
		<br>
		<br>
		<br>

		<div id="detail_qna">
			<p>&lt; QnA &gt;</p>
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>이진혁</td>
							<td>예약 취소는 어떻게하나요?</td>
							<td>2019-12-06</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>이지은</td>
							<td>ㅇㅇ?</td>
							<td>2019-12-07</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>신하은</td>
							<td>ㅇㅅㅇ?</td>
							<td>2019-12-05</td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="btn btn-outline-secondary"
					style="float: right">QnA Write</button>
			</div>
		</div>

		<div id="detail_warning">
			<p id="detail_warning_p">&lt; 유의사항 &gt;</p>
			<div id="detail_warning_text">
				<p>
					반지를 만드시는 시간이 약 1시간 30분이 소요되기 때문에 마지막 오후 8시 20분 이전까지는 꼭 방문하여 주시길
					부탁드립니다.<br> 아래 일정선택을 통하여 예약 가능하며 기타 자세한 내용은 010-8904-0156으로 연락
					주시면 감사하겠습니다.
				</p>
			</div>
		</div>



	</div>
	<%@ include file="../common/footbar.jsp"%>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>