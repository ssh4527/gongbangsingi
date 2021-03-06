<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
	<%@page import="java.util.*"%>
	<%@page import="workshop.model.vo.*"%>
<%
	ArrayList<Workshop> wsList = (ArrayList<Workshop>)request.getAttribute("wsList"); 	
	ArrayList<Workshop> wsList2 = (ArrayList<Workshop>)request.getAttribute("wsList2"); 
	ArrayList<String[]> wcList = (ArrayList<String[]>)request.getAttribute("wcList"); 
	ArrayList<Map> statistics = (ArrayList<Map>)request.getAttribute("statistics");
	ArrayList<String> category = (ArrayList<String>)request.getAttribute("category");
	int year = (int)request.getAttribute("year");
	int month = (int)request.getAttribute("month");
	String text  = year+"년";
	String tagname = "월";
	if(month!=0){
		text += " "+month+"월";
		tagname = "일";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	function drawVisualization() { 
		var stringtext = ['<%=tagname%>',
		<% for(int b=0; b<category.size(); b++){ %>
			'<%=category.get(b) %>'
			<%if(b != category.size()-1){ %>,<%}%>
		<%} %>
		];
		var data = google.visualization.arrayToDataTable([
			stringtext,
			<% for(int i=0;i<statistics.size();i++){%>
				
				 <%if(!statistics.get(i).isEmpty()) {%> 
					[ 	'<%=(i+1)%><%=tagname%>' , 
				<%for(int b=0; b<category.size(); b++){ %>
					<%if(statistics.get(i).get(category.get(b))!=null ){%>
						<%=statistics.get(i).get(category.get(b))%>
					<%}else{%>
						<%=0%>
					<%}%>
					<%if(b != category.size()-1){ %>,<%}%>
				<%} %>]	
				<%}%> 
				
			<% if (i != statistics.size()-1 && !statistics.get(i).isEmpty()){ %>,<%}%>
			<%}%>
			]);
		var options = {
				title : '<%=text%>'+' 카테고리별 예약금액',
				vAxis: {title: '금액'},
				hAxis: {title: '<%=tagname%>'}, 
				seriesType: 'bars',
				series: {<%=category.size()%>: {type: 'line'}}
			};
		
		var chart = new google.visualization.ComboChart(document.getElementById('yearchart_div'));
		chart.draw(data, options);
	}
		
		
	</script>
<style>
#adminpage_maindiv {
	width: 1300px;
	min-height: 800px;
	border:1px solid black;
}

aside {
	width: 16%;
	height: 97%;
	float: left;
	
	margin: 1%;
	text-align: center;
}

#menu>li {
	margin-top: 30px;
	margin-bottom: 30px;
}

#menu>li>a {
	text-decoration: none;
	color: blueviolet;
	
}

section {
	margin: 1%;
	width: 75%;
	height: 97%;
	float: left;
}

.textalign {
	text-align: center;
}

aside>button {
	display: none;
}

#change {
	margin-left: 90%;
}

.table {
	width: 80%;
	margin: auto;
	margin-top: 30px;
}
.chart_div{
	width:90%;
	height:400px;
}
.acceptclick{
	background:lightgrey;
}
#yearselect{
	width:120px;
	float:center;
	margin:auto;
}
#monthselect{
	width:120px;
	float:center;
	margin:auto;
}
#datadiv{
	width:340px;
	height:50px;
}
#selectstatus{
	width:100%;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="adminpage_maindiv">
		<aside>
			<ul id="menu">
				<li><a href="#" id="accept1">사업회원가입승인</a></li>
				<li><a href="#" id="accept2">공방상세정보승인</a></li>
				<li><a href="#" id="accept3">클래스승인</a></li>
				<li class="acceptclick"><a href="#" id="accept4">수입통계</a></li>
			</ul>
			

		</aside>
		
		<script>
			$(function() {
				
	
				$("#accept1").click(function() {
					$("#menu").children().removeClass("acceptclick");
					$(this).parent().addClass("acceptclick");
					$("#accepttable1").css("display", "table");
					$("#accepttable2").css("display","none");
					$("#accepttable3").css("display","none");
					$(".chart_div").css("display","none");
					$("#selectstatus").css("display","none");
				});
				
				$("#accept2").click(function() {
					$("#menu").children().removeClass("acceptclick");
					$(this).parent().addClass("acceptclick");
					$("#accepttable2").css("display", "table");
					$("#accepttable1").css("display","none");
					$("#accepttable3").css("display","none");
					$(".chart_div").css("display","none");
					$("#selectstatus").css("display","none");
				});
				
				$("#accept3").click(function() {
					$("#menu").children().removeClass("acceptclick");
					$(this).parent().addClass("acceptclick");
					$("#accepttable3").css("display", "table");
					$("#accepttable2").css("display","none");
					$("#accepttable1").css("display","none");
					$(".chart_div").css("display","none");
					$("#selectstatus").css("display","none");
				});
				
				$("#accept4").click(function(){
					$("#menu").children().removeClass("acceptclick");
					$(this).parent().addClass("acceptclick");
					$("#accepttable3").css("display", "none");
					$("#accepttable2").css("display","none");
					$("#accepttable1").css("display","none");
					$(".chart_div").css("display","block"); 
					$("#selectstatus").css("display","block");
				});
			});
		</script>
		<div style="width:0px; min-height:600px; border:0.5px solid lightgrey; float:left;"></div>
		<section >
			<table class="table" id="accepttable1" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign" style="width:10%;">아이디</th>
						<th scope="col" class="textalign"style="width:13%;">공방명</th>
						<th scope="col" class="textalign"style="width:30%;">사업자등록번호</th>
						<th scope="col" class="textalign"style="width:25%;">공방주소</th>
						<th scope="col" class="textalign"style="width:10%;">전화번호</th>
						<th scope="col" class="textalign"style="width:12%;">승인여부</th>
					</tr>
				</thead>
				<tbody id="checkGongBang">
					<% 
					for(int i=0; i<wsList.size();i++){
						String enrolluser = "enrolluser"+i;
						%>
					<tr>
						<th class="textalign"><%= wsList.get(i).getId()%></th>
						<td class="textalign"><%= wsList.get(i).getWsName()%></td>
						<td class="textalign"><%= wsList.get(i).getAccountNum() %></td>
						<td class="textalign"><%= wsList.get(i).getAddress()%></td>
						<td class="textalign"><%= wsList.get(i).getWsTel()%></td>
						
						<td class="textalign"><input type="radio" class="enrolluser" name=<%=enrolluser %>
							value="y">&nbsp;Y 
							&nbsp;&nbsp; <input type="radio" name=<%=enrolluser %> value="n" checked>&nbsp;N
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>

			<table class="table" id="accepttable2" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign">공방아이디</th>
						<th scope="col" class="textalign">공방이름</th>
						<th scope="col" class="textalign">공방 카테고리</th>
						<th scope="col" class="textalign">페이지승인여부</th>
					</tr>
				</thead>
				<tbody class="goCheckPage">
					<% 
					for(int i=0; i<wsList2.size();i++){
						String enrollshop = "enrollshop"+i;
						%>
					<tr>
						<th class="textalign"><%= wsList2.get(i).getWsNo()%></th>
						<td class="textalign"><%= wsList2.get(i).getWsName()%></td>
						<td class="textalign"><%= wsList2.get(i).getCategory() %></td>
						<td class="textalign"><input type="radio" class="enrollshop" name=<%=enrollshop %>
							value="y">&nbsp;Y 
							&nbsp;&nbsp; <input type="radio" name=<%=enrollshop %> value="n" checked>&nbsp;N
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<table class="table" id="accepttable3" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign">공방명</th>
						<th scope="col" class="textalign">클래스명</th>
						<th scope="col" class="textalign">카테고리</th>
						<th scope="col" class="textalign">페이지승인여부</th>
					</tr>
				</thead>
				<tbody class="goCheckClassPage">
					<% 
					for(int i=0; i<wcList.size();i++){
						String enrollclass = "enrollclass"+i;
						%>
					<tr>
						<td style="display:none;"><%=(wcList.get(i))[0]%> </td>
						<th class="textalign"><%= (wcList.get(i))[1]%></th>
						<td class="textalign"><%= (wcList.get(i))[2]%></td>
						<td class="textalign"><%= (wcList.get(i))[3] %></td>
						
						
						<td class="textalign"><input type="radio" class="enrollclass" name=<%=enrollclass %>
							value="y">&nbsp;Y 
							&nbsp;&nbsp; <input type="radio" name=<%=enrollclass %> value="n" checked>&nbsp;N
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<div id="yearchart_div" class="chart_div" ></div>
			<div id="selectstatus" align="center">
				
				<input name="selectstatus" type="radio" id="yearradio"checked>년도별 /&nbsp; 
				<input name="selectstatus" type="radio" id="monthradio"> 월별 
				
				<br>
				<form id="datadiv" method="get" action="<%=request.getContextPath()%>/statistic.admin" >
				<select name="yearselect" class="custom-select my-1 mr-sm-2" id="yearselect">
					<option selected value="2019">2019년</option>
					<option value="2020">2020년</option>
					<option value="2021">2021년</option>
				</select>
				<select name="monthselect" class="custom-select my-1 mr-sm-2" id="monthselect"  style="display:none;">
					<option selected value="0">----</option>
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
				
				<button type="submit" class="btn btn-info" style="float:center; margin:4px;" >조회</button>
				</form>
				
				계 : <span><%= request.getAttribute("sum") %>원</span> <br>
				순익 : <span><%=((int)request.getAttribute("sum"))/100*5 %>원</span>
			</div>
		</section>

	</div>
	<script>
		$(function(){
			
			$("#monthradio").click(function(){
				$("#monthselect").css("display","inline-block");
			});
			
			$("#yearradio").click(function(){
				$("#monthselect").css("display","none");
			});
			
			$(".goCheckClassPage > tr").click(function(){
				var id = $(this).children().eq(0).html();
				window.open("<%=request.getContextPath()%>/godetail.class?wcNo="+id);	
			});
			 $("#checkGongBang > tr").click(function(){
				 	var $biz = $(this).children().eq(2);
					var bizNum = $biz.html();
		            $.ajax({
		                url:'https://business.api.friday24.com/closedown/'+bizNum,
		                headers : {"Authorization" : 'Bearer PHrcybTCv31Sit809Bld'},
		                 type: 'get',
		                    success: function(result){
		                    	var text = result.state;
		                    	var msg ="";
		                    	console.log(text);
		                    	if(text == 'normal'){
		                    		msg = "정상영업중"
		                    	}else if(text == 'down'){
		                    		msg = "휴업중"
		                    	}else if(text =='close'){
		                    		msg = "폐업중"
		                    	}else{
		                    		msg = "미등록"
		                    	}
		                    	$biz.html(bizNum+" "+msg);	
		                    },
		                    error:function(e){
		                    	$biz.html(bizNum+" 번호가 맞지않습니다.");	
		                   }
		            });
		            
		         });
			
			$(".enrolluser").click(function(){
				
				var $enroll = $(this).parent().parent();
				var userId = $enroll.children().eq(0).html();
				
				if(confirm("공방회원으로 변경하시겠습니까?")){
					$.ajax({
						url : "<%=request.getContextPath()%>/change.auth",
						data : {userId:userId},
						type : "post",
						success : function(data){
							
							if(data=="fail"){
								alert("알수없는 오류가 발생했습니다.");
							}else{
								$("#acceptalert").html($("#acceptalert").html()-1);
								$enroll.css("display","none");
								
							}
						}, error : function(){
							console.log("서버 통신 안됨");
						}
						
					});
				}else{
					$(this).next().click();
				}
				
			});
			$(".enrollshop").click(function(){
				var $enroll = $(this).parent().parent();
				var shopId = $enroll.children().eq(0).html();
				
				if(confirm("공방페이지를 승인하시겠습니까?")){
					$.ajax({
						url : "<%=request.getContextPath()%>/change.shop",
						data : {shopId:shopId},
						type : "post",
						success : function(data){
							
							if(data=="fail"){
								alert("알수없는 오류가 발생했습니다.");
							}else{
								
								$enroll.css("display","none");
								$("#acceptalert").html($("#acceptalert").html()-1);
							}
						}, error : function(){
							console.log("서버 통신 안됨");
						}
						
					});
				}else{
					$(this).next().click();
				}
			});
			
			$(".enrollclass").click(function(){
				var $enroll = $(this).parent().parent();
				var classId = $enroll.children().eq(0).html();
				if(confirm("클래스페이지를 승인하시겠습니까?")){
					$.ajax({
						url : "<%=request.getContextPath()%>/change.class",
						data : {classId:classId},
						type : "post",
						success : function(data){
							
							if(data=="fail"){
								alert("알수없는 오류가 발생했습니다.");
							}else{
								
								$enroll.css("display","none");
								$("#acceptalert").html($("#acceptalert").html()-1);
							}
						}, error : function(){
							console.log("서버 통신 안됨");
						}
						
					});
				}else{
					$(this).next().click();
				}
			});
		});
		
	     
	
	</script>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>
