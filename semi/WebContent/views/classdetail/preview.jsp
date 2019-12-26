<%@page import="workclass.model.vo.ClassTime"%>
<%@page import="workclass.model.vo.Workclass"%>
<%@page import="workclass.model.vo.ClassFile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<ClassFile> fileList = (ArrayList<ClassFile>)request.getAttribute("fileList");
	Workclass wc = (Workclass)request.getAttribute("workclass");
	ClassTime ct = (ClassTime)request.getAttribute("classtime");
	
	String[] time = ct.getCtTime().split(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>클래스</title>
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
	width: 1300px;
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
	width: 1000px;
	height: 850px;
}

#tot_table {
	border: 1px solid red;
}

ul {
	list-style: none;
}

#pa-link {
	border: black;
	color: black;
}
#tbody{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div id="outer">
		<div id="top_div">
			<div id="detail_img_div" style="padding: 10px;">
				<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(fileList.size()-1).getChangeName() %>" id="detail_img">
				<div
					style="padding: 10px; margin: 10px; margin-left: 10px; cursor: pointer;">
					<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(fileList.size()-1).getChangeName() %>"
						width=100px height=100px id="minImg1"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(fileList.size()-2).getChangeName() %>"
						width=100px height=100px id="minImg2"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(fileList.size()-3).getChangeName() %>"
						width=100px height=100px id="minImg3"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(fileList.size()-4).getChangeName() %>"
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
					<p id="title"><%= wc.getWcName() %></p>
				</div>
				<hr>
				<div id="detail2">
					<!-- 가격,적립금,포인트 -->
					<table>
						<tr>
							<td width=150px;><small style="color: gray">1인 기준 금액</small></td>
							<td><small><%= wc.getWcNOP() %></small></td>
						</tr>
						<tr>
							<td><small style="color: gray">보유 포인트</small></td>
							
						</tr>
						<tr>
							<td><small style="color: gray">1인당 적립 포인트</small></td>
							<td><small><%= wc.getWcNOP() %></small></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="detail3">
					<small style="color: gray;"><%= wc.getWcIntroduce().replace("\r\n", "<br>") %></small>
				</div>
				<hr>
				<div id="detail4">
					<table>
						<tr>
							<td width=150px;><small style="color: gray"> > 날짜/시간
							</small></td>
							<td>
							<select name="time" id="time" style="font-size: 15px">
								<option value="">-[필수] 시간대를 선택해주세요 -</option>
								<% for(int i = 0; i < time.length; i++) { %>								
									<option value="">
										<%= time[i] %>
									</option>
								<% } %>
							</select>
							</td>
						</tr>
						<tr>
							<td><small style="color: gray"> > 인원수 </small></td>
							<td><input type="number" width="10px" min="0" max=<%= wc.getWcMaxP() %>
								id="count"></td>
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
					<br> <br> <small style="color: gray; text-align: right;">최소
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
						<!-- <button type="button" class="btn btn-outline-secondary"
							id="reservationBtn" style="width: 100px">예약 하기</button> -->
						<button type="button" class="btn btn-outline-secondary"  id="reservationBtn"  style="width: 100px" data-toggle="modal" data-target=".bd-example-modal-lg">예약하기</button>
						<button type="button" class="btn btn-outline-secondary"
							id="gongbangBtn">공방 구경</button>
						<button type="button" class="btn btn-outline-secondary"
							id="heartBtn">찜 하기</button>
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

		<div style="text-align:center">
		<!-- 메인 부분 -->
		<% int count = fileList.size() - 5; %>
		<% for(int i = count; i >= 0 ; i--) { %>
		
		<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= fileList.get(i).getChangeName() %>"><br>
						
		<% } %>
</div>

<br> <br> <br>

		<div id="detail_warning">
			<p id="detail_warning_p">&lt; 유의사항 &gt;</p>
			<div id="detail_warning_text">
				<p>
					<%= wc.getWcWarning().replace("\r\n", "<br>") %>
				</p>
			</div>
		</div>

	</div>
	<%@ include file="../common/footbar.jsp"%>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>