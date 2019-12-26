<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String wsNo = request.getParameter("wsNo");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>클래스 미리보기</title>
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
	width: 1400px;
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
	<div class="positioning fixed-area">
		<div>
			<p id="insertImg">이미지 추가</p>
		</div>
		<div>
			<p id="insertText">글쓰기</p>
		</div>
		<div>
			<p id="inserMap">맵추가</p>
		</div>
	</div>

	<script>
        	$(function(){
        		$("#pre").click(function(){
        			var sdate = $("#startDate").val();
        			var edate = $("#closeDate").val();
        			location="<%=request.getContextPath()%>";
        		});
        	});
        </script>

		<form action="<%= request.getContextPath() %>/insert.class" method="post" enctype="multipart/form-data">
		<input type="text" value="<%= wsNo %>" style="display:none;" name="wsNo">
	<div id="outer">
		<div id="top_div">
			<div id="detail_img_div" style="padding: 10px;">
				<img style="border:1px solid black; height:500px; width:490px;  cursor:pointer;" id="titleImg0">
				<div style="padding: 10px; margin: 10px; margin-left: 10px; cursor: pointer;">
					<img style="width:100px; height:100px; border:1px solid black; display:inline-block;" id="titleImg1">
					<img style="width:100px; height:100px; border:1px solid black; display:inline-block;" id="titleImg2">
					<img style="width:100px; height:100px; border:1px solid black; display:inline-block;" id="titleImg3">
					<img style="width:100px; height:100px; border:1px solid black; display:inline-block;" id="titleImg4">
				
				<!-- 파일 입력하는 부분 -->	
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
						<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
						<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)">
						<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4)">
					</div>
				<script>
				$(function(){
					$("#fileArea").hide();
					
					$("#titleImg0").click(function(){
						$("#thumbnailImg1").click();
					});
					
					$("#titleImg1").click(function(){
						$("#thumbnailImg1").click();
					});
					
					$("#titleImg2").click(function(){
						$("#thumbnailImg2").click();
					});
					
					$("#titleImg3").click(function(){
						$("#thumbnailImg3").click();
					});
					
					$("#titleImg4").click(function(){
						$("#thumbnailImg4").click();
					});
					
					//////////////////////////////////////
					$("#titleImg5").click(function(){
						console.log("dd");
						$("#thumbnailImg5").click();
					});
					
					
					$("#titleImg6").click(function(){
						console.log("dd");
						$("#thumbnailImg6").click();
					});
					$("#titleImg7").click(function(){
						console.log("dd");
						$("#thumbnailImg7").click();
					});
					$("#titleImg8").click(function(){
						$("#thumbnailImg8").click();
					});
					$("#titleImg9").click(function(){
						$("#thumbnailImg9").click();
					});
					$("#titleImg10").click(function(){
						$("#thumbnailImg10").click();
					});
					$("#titleImg11").click(function(){
						$("#thumbnailImg11").click();
					});
					$("#titleImg12").click(function(){
						$("#thumbnailImg12").click();
					});
					$("#titleImg13").click(function(){
						$("#thumbnailImg13").click();
					});
					$("#titleImg14").click(function(){
						$("#thumbnailImg14").click();
					});
					$("#titleImg15").click(function(){
						$("#thumbnailImg15").click();
					});
					$("#titleImg16").click(function(){
						$("#thumbnailImg16").click();
					});
				});
				
				
				function loadImg(value, num){
						// value => input type="file"
						// num => 조건문을 통해 미리보기 div 지정
						// file이 존재하는지 조건문
						if(value.files && value.files[0]){
							// 파일을 읽어 들일 FileReader 객체 생성
							var reader = new FileReader();
							
							// 파일 읽기가 완료 되었을 때 실행 되는 메소드 설정
							reader.onload = function(e){
								switch(num){
								case 1:
									$("#titleImg0").attr("src", e.target.result);
									$("#titleImg1").attr("src", e.target.result);
									console.log("dd");
									console.log(e.target.result);
									break;
								case 2:
									$("#titleImg2").attr("src", e.target.result);
									break;
								case 3:
									$("#titleImg3").attr("src", e.target.result);
									break;
								case 4:
									$("#titleImg4").attr("src", e.target.result);
									break;
								case 5:
									$("#titleImg5").attr("src", e.target.result);
									break;
								case 6:
									$("#titleImg6").attr("src", e.target.result);
									break;
								case 7:
									$("#titleImg7").attr("src", e.target.result);
									break;
								case 8:
									$("#titleImg8").attr("src", e.target.result);
									break;
								case 9:
									$("#titleImg9").attr("src", e.target.result);
									break;
								case 10:
									$("#titleImg10").attr("src", e.target.result);
									break;
								case 11:
									$("#titleImg11").attr("src", e.target.result);
									break;
								case 12:
									$("#titleImg12").attr("src", e.target.result);
									break;
								case 13:
									$("#titleImg13").attr("src", e.target.result);
									break;
								case 14:
									$("#titleImg14").attr("src", e.target.result);
									break;
								case 15:
									$("#titleImg15").attr("src", e.target.result);
									break;
								case 16:
									$("#titleImg16").attr("src", e.target.result);
									break;
								}
							
							}
							// 파일 읽기 하는 메소드
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				</div>
			</div>
			<div id="detail_detail_div">
				<hr>
				<div id="detail1">
					<!-- 클래스 이름 -->
					<input type="text" name="className" placeholder="클래스의 이름을 입력해주세요!d" style="width:300px; required">
					<input type="text" name="outtime" id="outtime" style="display:none">
				</div>
				<hr>
				<div id="detail2">
					<!-- 가격,적립금,포인트 -->
					<table>
						<tr>
							<td width=150px;><small style="color: gray">1인 기준 금액</small></td>
							<td><input type="text" placeholder="1인 기준 금액을 입력해주세요!" name="price"></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="detail3" style="height: 120px;">
					<textarea rows="4" cols="50" name="intro" style="resize: none;">
클래스 리스트에 보일 소개를 써주세요 (30자 이내)
					</textarea>
				</div>
				<hr>
				<div id="detail4">
					<!-- 시간넣는 스크립트 -->
					<script>
						$(function(){
							var index = 1;
							var str = "";
							$("#inputoption").click(function(){
								var inputtime = $("#inputtime").val();
								var input = $("#inputtime");
								var outtime = $("#outtime");
								
								if(!inputtime){
									alert("시간대를 입력해주세요!");
								}else{
									$("#time").append("<option value=" + (index++) + ">" + inputtime + "</option>");
									input.val('');
									input.focus();
									
									str += inputtime +",";
									$("#outtime").val(str);
								}
							});
						});
					</script>
					<table>
						<!-- 날짜넣는부분 -->
						<tr>
							<td><small>> 시작 날짜 </small></td>
							<td><input type="date" name="startDate"></td>
						</tr>
						<tr>
							<td><small>> 종료 날짜</small></td>
							<td><input type="date" name="closeDate"></td>
						</tr>
						<tr>
							<td><small>> 시간대</small></td>
							<td><input type="text" placeholder="ex)12:00 - 14:00" name="inputtime" id="inputtime"></td>
							<td><button type="button" class="btn btn-outline-secondary"
						style="float: right" id="inputoption">시간 넣기</button></td>
						</tr>
						<tr>
							<td width=150px;><small> > 날짜/시간
							</small></td>
							<td><select name="time" id="time" style="font-size: 15px">
									<option value="">-[필수] 시간대를 입력해주세요 -</option>
							</select></td>
							<td><button type="button" class="btn btn-outline-secondary"
						style="float: right" id="deleteoption">시간 삭제</button></td>
						</tr>
						<tr>
							<td><small> > 최대인원수 </small></td>
							<td><input type="number" width="10px" min="0" max="100" name="count"
								id="count"></td>
						</tr>
						<tr>
							<td rowspan="2" style="text-align: right;"></td>
						</tr>
					</table>
					<hr>
					<div>
						<textarea rows="4" cols="50" rows="intro" style="resize: none;" name="warning">
유의사항을 적어주세요
						</textarea>
					</div>
				</div>
			</div>
		</div>
		<hr>
		</div>
		
	<!-- 여기서부터 메인 페이지 !! -->	
		
		<div id="insertdiv" style="text-align: center;">
			
		</div>
	<script>
		var preImg = 5;
		var preText = 0;
		$(function(){
			$("#insertImg").click(function(){
				$("#insertdiv").append("<img name='titleImg" + preImg + "' id='titleImg" +  preImg + "' style='display:inline_block; margin-top:30px; cursor:pointer;'><br>");
				$("#insertdiv").append("<input type='file' id='thumbnailImg" + preImg + "' name='thumbnailImg" + preImg + "' onchange='loadImg(this,"+(preImg++)+")'><br>");
				
			});
			$("#insertText").click(function(){
				$("#insertdiv").append("<textarea id='text" + preText + "' name='text" + (preText++) +"' cols='50' rows='10' style='margin-top:30px'></textarea>");
			});
		});
		
	</script>	
	

	<div style="text-align:center;">
		<button type="submit" class="btn btn-outline-secondary" style="width:100px;">완료</button>
	</div>
</form>
	<%@ include file="../common/footbar.jsp"%>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>