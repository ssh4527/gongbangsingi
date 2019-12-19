<%@page import="qna.model.vo.QnaRe"%>
<%@page import="qna.model.vo.Qna"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="review.model.vo.Review"%>
<%@page import="workclass.model.vo.ClassTime"%>
<%@page import="workclass.model.vo.Workclass"%>
<%@page import="workclass.model.vo.ClassFile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--  검색후 해당 클래스 디테일 창 -->
<%
	ArrayList<ClassFile> fileList = (ArrayList<ClassFile>)request.getAttribute("cfList");
	Workclass wc = (Workclass)request.getAttribute("wc");
	ClassTime ct = (ClassTime)request.getAttribute("ct");
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ArrayList<ClassFile> rfList = (ArrayList<ClassFile>)request.getAttribute("rfList");
	String wsNo = (String)request.getAttribute("wsNo");
	ArrayList<Qna> qList = (ArrayList<Qna>)request.getAttribute("qList");
	String ornerid = (String)request.getAttribute("ornerid");
	ArrayList<QnaRe> qrList = (ArrayList<QnaRe>)request.getAttribute("qrList");
	
	String[] time = ct.getCtTime().split(",");
	
	ArrayList<ClassFile> tList = new ArrayList<>();
	ArrayList<ClassFile> mList = new ArrayList<>();
	
	// tlist 썸네일 mlist 메인사진
	for(int i = 0 ; i < fileList.size(); i++){
		if(fileList.get(i).getFileLevel() == 0){
			tList.add(fileList.get(i));
		}else{
			mList.add(fileList.get(i));
		}
	}
	
	
	//String[] time = {"dd","ss"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>클래스 미리 보기</title>
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
.textareaa{
		width:90%;
        height:90%;
        padding:0;
        margin:0;
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
	<% if(!log.equals("asd")){ String me = loginUser.getUserId(); }%>
	<div id="outer">
		<div id="top_div">
			<div id="detail_img_div" style="padding: 10px;">
				<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= tList.get(3).getChangeName() %>" id="detail_img">
				<div
					style="padding: 10px; margin: 10px; margin-left: 10px; cursor: pointer;">
					<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= tList.get(3).getChangeName() %>"
						width=100px height=100px id="minImg1"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= tList.get(2).getChangeName() %>"
						width=100px height=100px id="minImg2"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= tList.get(1).getChangeName() %>"
						width=100px height=100px id="minImg3"> <img
						src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= tList.get(0).getChangeName() %>"
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
							<% if(log.equals("asd")) { %>
								<td> 로그인 후 포인트 확인이 가능합니다.</td>
							<% }  else { %>
								 <td><small><%= loginUser.getPoint() %></small></td>
							<% } %>
						</tr>
						<tr>
							<td><small style="color: gray">1인당 적립 포인트</small></td>
							<td><small><%= (int)Math.floor(wc.getWcNOP() * 0.05) %>p</small></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="detail3" style="height: 120px;">
					<small style="color: gray;"><%= wc.getWcWarning() %></small>
				</div>
				<hr>
				<div id="detail4">
					<table>
						<tr>
							<td> > 날짜 </td>
							<td><%= ct.getCtDate() %> - <%= ct.getCtEndDate() %> </td> 
						</tr>
						<tr>
							<td width=150px;><small style="color: gray"> > 시간
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
		<!-- 메인 부분 --> <!--  코등펭 3 2 1 -->
		
		<% int count = mList.size()-1; %>
		<% for(int i = 0; i < mList.size()  ; i++) { %>
		
		<img src="<%= request.getContextPath() %>/resources/class_uploadFiles/<%= mList.get(count--).getChangeName() %>" width="100%">
						
		<% } %>
</div>

<!--  ??-->
<script>
	$(function(){
		$("#reservationBtn").click(function(){
			if(<%= log.equals("asd") %>){
				
				alert("로그인 후 이용가능합니다.");
			}else{
				$("#precount2").val($("#count").val());
			}
		});
	});

</script>

<!-- 예약하기 모달 -->
<form action="<%=request.getContextPath()%>/cash1.go" method="post" onsubmit="return ckform()">
	<script>
		function ckform(){
			console.log($("#outnumber").val());
			if($("#outtime").val() == 100){
				alert("시간대를 입력해주세요!");
				return false;
			}
			if($("#outnumber").val() == 100){
				alert("인원수를 넣어주세요!");
				return false;
			}
			
		}	
	</script>
	<input type="text" name="outtime" id="outtime" style="display:none" value="100">
	<input type="text" name="outnumber" id="outnumber" style="display:none" value="100">
	<input type="text" name="outname" id="outname" style="display:none" value="<%= wc.getWcName() %>">
	<input type="text" name="outprice" id="outprice" style="display:none" value="<%= wc.getWcNOP() %>">
	<% if(!log.equals("asd")){ %>
	<input type="text" name="outusername" id="outusername" style="display:none" value="<%= loginUser.getUserName() %>">
	<input type="text" name="outcId" id="outcId" style="display:none" value="<%= loginUser.getUserId() %>">
	<% } %>
	<input type="text" name="outwcNo" id="outwcNo" style="display:none" value="<%= wc.getWcNo() %>">
		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  			<div class="modal-dialog modal-lg">
    			<div class="modal-content">
      				<div style="width:100%; height:30px; text-align: center;">
      					로맨틱 도자기 만들기
      				<hr>	
      				</div>
      				
      				<div>
      					<table style="margin-top:20px;">
						<tr>
							<td width=80%;><small style="color: gray">1인 기준 금액</small></td>
							<td><small><%= wc.getWcNOP() %></small></td>
						</tr>
						<tr>
							<td><small style="color: gray">보유 포인트</small></td>
							<% if(log.equals("asd")) { %>
								<td> 로그인 후 포인트 확인이 가능합니다.</td>
							<% }  else { %>
								 <td><small><%= loginUser.getPoint() %></small></td>
							<% } %>
						</tr>
						<tr>
							<td><small style="color: gray">적립 포인트</small></td>
							<td><small id="jpoint"><%= (int)Math.floor(wc.getWcNOP() * 0.05) %>p</small></td>
						</tr>
						</table>
					<hr>
      				</div>
      				
      				
      				<div>
      					<table>
      					<tr>
      						<td width=150px;><small style="color: gray"> > 날짜 선택</small></td>
      						<td><input id="ckdate" name="ckdate" type="date" max="<%= ct.getCtEndDate() %>" min="<%= ct.getCtDate() %>"></td>
      						<%
      							String start = ct.getCtDate();
      							String end = ct.getCtEndDate();
      							Date startdate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
      							Date enddate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
      						%>
      						<script>
      							$(function(){
      								$("#ckdate").change(function(){
      									
      								
      								});
      							});
      						</script>
      					</tr>
						<tr>
							<td width=150px;><small style="color: gray"> > 시간
							</small></td>
							<td><select name="pretime1" id="pretime1" style="font-size: 15px">
									<option value="">-[필수] 시간대를 선택해주세요 -</option>
								<% for(int i = 0; i < time.length; i++) { %>								
									<option value="">
										<%= time[i] %>
									</option>
								<% } %>
							</select></td>
						</tr>
						<tr>
							<td><small style="color: gray"> > 인원수 </small></td>
							<td><input type="number" width="10px" min="0" max=<%= wc.getWcMaxP() %>
								id="precount2" name="precount2" value="0"></td>
						<tr>
							<td rowspan="2" style="text-align: right;"></td>
						</tr>
					</table>
					<hr>
      				</div>
      				
      				
      				<div>
      					<small id="pretotal">TOTAL : 0	 </small>
      					
      				</div>
      				
      				<!-- pre모달 토탈부분 -->
      				<script>
      					$(function(){
      						$("#pretime1").change(function(){
      							$("#outtime").val($("#pretime1 option:selected").text());
      						});
      						//$("#pretime1 option:selected").val();
      						
      						$("#precount2").change(function(){
      							$("#outnumber").val($("#precount2").val());
      							
      							
      							
      							
      							var count = $("#precount2").val();
      							$("#jpoint").text(<%= ((int)Math.floor(wc.getWcNOP() * 0.05)) %> * count + "p");
								$("#pretotal").text("TOTAL : " + count * <%= wc.getWcNOP() %> + " 원");
								$("#pretotal").css("fontSize","14px");
								
      						});
      					});
      					
      					$("div").append("");
      				</script>
      				
      				
      				
      				<div style="hegiht:150px;">
      					<button type="submit" class="btn btn-outline-secondary"
							id="reservationBtnn" style="width: 100px; margin:auto; height:50px;">예약 하기</button>
      				</div>
    			</div>
  			</div>
		</div>
		
		
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
	</form>
		<!-- 모달 끝 -->



<!--  Map 부분 !!! -->
		<div id="detail_come" style="text-align: center;">
			<img src="<%=request.getContextPath()%>/resources/images/map1.PNG"
				id="detail_comeimg">
		</div>


		<div id="detail_detail_content" style="line-height: 2em;">
			<pre style="text-align: center">
도자기만들기 도자기의 숲을 방문해 주셔서 감사합니다.
저희 도자기의 숲은 고객이 직접 체험하는 도자기공방으로 당일 만들어서 바로 가져가실 수 있는 공방입니다.
			</pre>
		</div>



		<!-- 리뷰 -->
		<hr>
		<div id="detail_review">
			<div style="text-align: center;">
				<p>R E V I E W</p>
				<small style="color: gray; font-size: 14px;">클래스의 이용후기를
					적어주세요.</small>
				<hr>
			</div>
			<div class="ulpre" style="color: gray; font-size: 14px;"> <!-- 리뷰div -->
		<% if(rList.isEmpty()) { %>
			<div style="text-align:center; margin:auto;">
				<span>리뷰가 존재하지 않습니다.</span>
			</div>
		<% } else { %>
		<% for(int i = 0; i < rList.size(); i++) {%>
			<!-- 리뷰2 -->
			
				<ul class="dept" style="color:black; font-family:나눔고딕" id="ul<%= rList.get(i).getRNo() %>">
					<li style="cursor: pointer" class="reviewtitle">
					<span style="">
							<small id="star">
								<% for(int c = 0; c < rList.get(i).getRGrade(); c++) { %>
									★
								<% } %>
								<% int counttt = 5 - rList.get(i).getRGrade(); %>
								<% for(int d = 0; d < counttt ; d++){  %>
									☆
								<% } %> 
							</small>
							<small style="margin-left: 30px; color:black;"><%= rList.get(i).getRTitle() %></small> 
							<small style="float: right;"><%= rList.get(i).getcName() %> | <%= rList.get(i).getREnDate() %></small>
					</span>
						<ul class="dept02" style="display: none">
							<li id="asd" style="margin-top:20px;"><%= rList.get(i).getRContent().replace("\r\n", "<br>") %>
							<% for(int j = 0 ; j < rfList.size(); j++) { %>
								<% if(rList.get(i).getRNo().equals(rfList.get(j).getDestination())) { %>
								<br><img src="<%= request.getContextPath() %>/resources/review_uploadFiles/<%= rfList.get(j).getChangeName() %>" width="400px" height="400px"><br>
								
								<% } %>
							<% } %>
								<% if(rList.get(i).getcName().equals(log)){ %>
								<br><button class="btn btn-outline-secondary" style="float:right;" id="updateBtn<%= rList.get(i).getRNo() %>" onclick="updatereview('<%= rList.get(i).getRNo() %>')">수정</button>
									<button class="btn btn-outline-secondary" style="float:right;" id="deleteBtn<%= rList.get(i).getRNo() %>" onclick="deletereview('<%= rList.get(i).getRNo() %>')">삭제</button><br><br>
								<% } %>
							</li>
						</ul>
					</li>
					<hr>
				</ul>
				<% } %>
			<% } %>
				<!-- 리뷰 삭제, 수정 -->
				<script>
					function deletereview(review){
						if(window.confirm('게시글을 정말 삭제하시겠습니까?')){
							console.log("ㅇㅇ");
							console.log($("#ul"+review));
							
							$.ajax({ // 아작시작
	      						url : "delete.review",
	      						data : { rNo: review },
	      						type : "get",
	      						success : function(num){ // 석세스 시작
	      						
	      							if(num > 0){
	      								$("#ul"+review).remove();
	      								alert("성공적으로 리뷰가 삭제되었습니다.");
	      								
	      							// 찜목록에 없어서 찜 등록 그리고 꽉찬하트로 벽녕
	      							}else if(num == 0){
	      								
	      							
	      								alert("리뷰 삭제실패..");
	      								
	      								// 찜목록에 있어서 찜 해제 그리고 빈하트로 변경
	      							}else{
	      							alert("리뷰 삭제실패..");	
	      							
	      							}
	      						}, // 석세스끝
	      						
	      						error : function(){
	      							console.log('ajax 통신 실패!');
	      						}
	      					}); // 아작끝 
	      					
						}else{
							console.log("ㄴㄴ");
						}
					}
					
					function updatereview(review){
						if(window.confirm('게시글을 정말 수정하시겠습니까?')){
							alert("수정페이지로 이동합니다.");
							location.href="select.review?rNo=" + review + "&wcNo=<%= wc.getWcNo() %>";
						}
					
					}
					
				</script>
				

					<!-- 리뷰 페이징 -->
				
				<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#detail_review"
								aria-label="Previous" id="pa-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#detail_review"
								id="pa-link">1</a></li>
							<li class="page-item"><a class="page-link" href="#detail_review"
								id="pa-link">2</a></li>
							<li class="page-item"><a class="page-link" href="#detail_review"
								id="pa-link">3</a></li>
							<li class="page-item"><a class="page-link" href="#detail_review"
								aria-label="Next" id="pa-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

			</div>

			<!-- 슬라이드 부분  -->
			<script>
				$(document).on('click', '.reviewtitle>span', function() {
					var submenu = $(this).next("ul");

					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
			</script>
			<!-- 리뷰 버튼 -->
			<div>
				<button type="button" class="btn btn-outline-secondary" id="reviewbtnn"
					style="float: right" onclick="goreviews()"<%-- onclick ="location.href ='<%= request.getContextPath()%>/views/classdetail/insertReview.jsp?wcNo=<%= wc.getWcNo() %>' "--%>>Review Write</button>
				<script>
					function goreviews(){
						if(<%= log.equals("asd") %>){
							alert("로그인 후에 작성가능합니다.");
						}else{
							location.href="<%= request.getContextPath()%>/views/classdetail/insertReview.jsp?wcNo=<%= wc.getWcNo() %>";
						}
					}
				</script>
					<br><br><hr>
			</div>


			<!-- 리뷰 작성 모달 -->
			</div>





			<!-- QnA -->
			<hr>
			<div id="detail_qna">
				<div style="text-align: center;">
					<p>Q & A</p>
					<small style="color: gray; font-size: 14px;">클래스에 대한 궁금한 점을
						해결해 드립니다.</small>
					<hr>
				</div>
				<div id="qna_table">
					<table class="table">
						<thead style="font-size: 14px; color: gray; text-align: center;">
							<tr>
								<td scope="col" width=50px>No
								</td>
								<td scope="col" width=800px><span style="margin-left:250px">Titled</span>
								</td>
								<td scope="col" width="100px">Name
								</td>
								<td scope="col" width="150px">Date
								</td>
							</tr>
						</thead>
						<tbody style="font-size: 14px; color: gray; text-align: center;" id="tbody">
						
						<% if(qList.isEmpty()){ %>
								<tr>
									<td colspan="4">QnA가 존재하지 않습니다.</td>
								</tr>
						<% }else { %>
							<% for(int i = 0 ; i < qList.size(); i++) { %>
							<tr style="color:black;" id="tr<%= qList.get(i).getqNo().replace("Qno","")%>">
								<th scope="row" ><%= qList.get(i).getqNo().replace("Qno","") %></th>
								<td><span style="margin-left:250px"><%= qList.get(i).getqTitle() %></span>
									<% if(qList.get(i).getqSecret().equals("Y")){ %>
										<i class="fas fa-lock" style="float:right;"></i>
									<% } else if(qList.get(i).getqSecret().equals("N")) { %>
										<i class="fas fa-lock-open" style="float:right;"></i>
									<% } %></td>
								<td><%= qList.get(i).getcId() %></td>
								<td><%= qList.get(i).getqEntdate() %></td>
								<td style="display:none;"><%= qList.get(i).getqSecret() %></td>
							</tr>
							<tr style="display:none;text-align:left;" height="200px;"> <!-- 내용 next() -->
								<td><i class="fas fa-reply fa-rotate-180"></i></td>
								<td colspan="2"><%=(qList.get(i).getqContent()).replace("\r\n", "<br>") %>
										<% if(log.equals(qList.get(i).getcId())){ %>
											<br><br>
											<button type="button" class="btn btn-outline-secondary" style="float:right;" onclick=dqna(this) id="dbtn<%= qList.get(i).getqNo()%>">삭제</button>
											<button type="button" class="btn btn-outline-secondary" style="float:right;" onclick=uqna(this) id="ubtn<%= qList.get(i).getqNo()%>">수정</button>
										<% } %>
								</td>
								<td colspan="2"></td>
							</tr>
							
							<tr style="display:none;"> <!--  비밀글next()next() -->
								<td><i class="fas fa-reply fa-rotate-180"></i></td>
								<td colspan="2"><span style="margin-left:50px">비밀글로 작성되어 있습니다.</span></td>
								<td colspan="2"></td>
							</tr>
							
							<tr style="display:none"> <!-- 클래스 주인 답글 달기 next()next()next() -->
								<td><i class="fas fa-reply-all fa-rotate-180"></i></td>
								<td colspan="2"><textarea class="textareaa" rows=4 id="retext<%= qList.get(i).getqNo()%>"></textarea></td>
								<td><button type="button" class="btn btn-outline-secondary" style="text-align:center; margin-top:6px; width:100px; height:80px;"
									 onclick=reqna('<%= qList.get(i).getqNo() %>') id="rebtn<%= qList.get(i).getqNo()%>">작성</button></td>
							</tr>
							
							<tr style="display:none; color:black;"> <!-- 답글 next()next()next()next() -->
							 <% for(int c = 0 ; c < qrList.size(); c++){ %>
								<% if(qrList.get(c).getqNo().equals(qList.get(i).getqNo())){ %>
									<td><i class="fas fa-reply-all fa-rotate-180"></i></td>
									<td style="text-align:left;">
										<%= (qrList.get(c).getRqComment()).replace("\r\n", "<br>") %>
										<% if(log.equals(ornerid)){ %>
										 <button type="button" class="btn btn-outline-secondary" style="text-align:center; width:60px; height:40px; float:right;"
									 		onclick=deleteqnare('<%= qrList.get(c).getRqNo()%>') id="rebtn">삭제</button>
										<% } %>
									</td>
									<th><%= qrList.get(c).getcId() %></th>
									<td style="display:none;">OK</td>
									<td><%= qrList.get(c).getRqEntDate() %></td>
								
								<% } %>
							<% } %> 
							</tr>
							
							<% } %>
						<% } %>
						</tbody>
					</table>
					<!-- QnA 스크립트부분 -->
					<script>
						$(function(){
							$("tr").click(function(){
								console.log($(this).next().next().next().next().children().eq(3).html());
								if($(this).children().last().html()=="N" && "<%= log %>"=="<%=ornerid%>" &&!($(this).next().next().next().next().children().eq(3).html() == 'OK')){ 
									// 공개글이면서 클래스주인이면 답글작성가능
									if($(this).next().css("display")=='none'){
									  	$(this).next().css("display","table-row");
									  	$(this).next().next().next().css("display","table-row");
									}else{
									  	$(this).next().css("display","none");
									  	$(this).next().next().next().css("display",'none');
									}
									
								}else if($(this).children().last().html()=="Y" && $(this).children().eq(2).html() == "<%= log %>"){
									// 비밀글이여도 작성자면 열람가능
									if($(this).next().css("display")=='none'){
									  	$(this).next().css("display","table-row");
									}else{
									  	$(this).next().css("display","none");
									}
								
								}else if($(this).next().next().next().next().children().eq(3).html() == 'OK' && "<%= log %>"=="<%=ornerid%>"){
									// 클래스 주인이고 이미 답글이달려있다면
									if($(this).next().css("display")=='none'){
									  	$(this).next().css("display","table-row");
									  	$(this).next().next().next().next().css("display","table-row"); // 답글 오픈
									}else{
									  	$(this).next().css("display","none");
									  	$(this).next().next().next().next().css("display",'none'); // 답글 오픈
									}
									
								}else if($(this).children().last().html()=="Y" && "<%= log %>"=="<%=ornerid%>" ){
									// 클래스주인이면 열람가능
									if($(this).next().css("display") == 'none'){ 
										$(this).next().css("display","table-row");
										$(this).next().next().next().css("display","table-row");
									}else{
										$(this).next().css("display",'none');
										$(this).next().next().next().css("display",'none');
									}
								}else if($(this).children().last().html()=="Y"){
									// 비밀글 설정인대 작성자도 아니고 클래스 주인도아니면 볼수없음.
									if($(this).next().next().css("display") == 'none'){ 
										$(this).next().next().css("display","table-row");
									}else{
										$(this).next().next().css("display",'none');
									}
								}else if($(this).children().last().html()=="N"){ 
									// 모두가 볼 수 있음
									if($(this).next().css("display")=='none'){
									  	$(this).next().css("display","table-row");
									  	$(this).next().next().next().next().css("display","table-row"); // 답글 오픈
									}else{
									  	$(this).next().css("display","none");
									  	$(this).next().next().next().next().css("display",'none'); // 답글 오픈
									}
								}
							}); // 여기까지가 tr클릭
							
							
							
						}); 
						
						function dqna(qna){
							var Qno = $(qna).attr('id').replace("dbtn","");
							if(window.confirm('게시글을 정말 삭제하시겠습니까?')){
								location.href="delete.class.qna?Qno="+Qno+"&wcNo=<%= wc.getWcNo()%>";
								alert("삭제가 완료되었습니다.");
							}
						}
						function uqna(qna){
							var Qno = $(qna).attr('id').replace("ubtn","");
							location.href="update.class.qna?Qno="+Qno+"&wcNo=<%= wc.getWcNo()%>";
							
						}
						function reqna(qno){
							// qna 는 Qno
							
							var text = $("#retext"+qno).val();
							location.href="insert.class.qna.re?Qno="+qno+"&text="+text+"&wcNo=<%=wc.getWcNo()%>";
							
						}
						function deleteqnare(rqno){
							if(window.confirm('답글을 정말 삭제하시겠습니까?')){
								location.href="delete.class.qna.re?rqno="+rqno+"&wcNo=<%=wc.getWcNo()%>";
							}
						}
					</script>
				</div>
				<!-- 리뷰 페이징 -->
					<nav aria-label="Page navigation example" style="text-align: center;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#detail_qna"
								aria-label="Previous" id="pa-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#detail_qna"
								id="pa-link">1</a></li>
							<li class="page-item"><a class="page-link" href="#detail_qna"
								id="pa-link">2</a></li>
							<li class="page-item"><a class="page-link" href="#detail_qna"
								id="pa-link">3</a></li>
							<li class="page-item"><a class="page-link" href="#detail_qna"
								aria-label="Next" id="pa-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
			</div>
			<button type="button" class="btn btn-outline-secondary" id="goQna"
					style="float: right">QnA Write</button>
		</div>
		
		<!-- qna 스크립트 -->
		<!-- <script>
			$(function(){
				$("#tbody>tr").click(function(){
					var trNum = $(this).closest('tr').prevAll().length;
				
					if(trNum == 0){
						$(this).eq(-1).after("<tr><td colspan='2'>ㅎㅇ</td><td>Manager</td><td>2019-10-17</td></tr>");
						console.log(trNum);
					}
					
					if(trNum == 1){
						$(this).eq(-1).after("<tr><td colspan='4'>작성한 회원만 볼 수 있습니다.</td></tr>");
						console.log(trNum);
					}
					
					if(trNum == 2){
						$(this).eq(-1).after("<tr><td colspan='4'>작성한 회원만 볼 수 있습니다.</td></tr>");
						console.log(trNum);
					}
				
				
				});
			});
		</script> -->
		<!--  QnA작성으로 이동! -->
		<script>
			$(function(){
				$("#goQna").click(function(){
					if(<%=log.equals("asd")%>){
						alert("로그인 후에 작성가능합니다.");
					}else{
						location.href="<%= request.getContextPath()%>/views/classdetail/insertReview.jsp?wcNo=<%= wc.getWcNo() %>";
						location.href="<%= request.getContextPath()%>/views/classdetail/insertQna.jsp?wsNo=<%=wsNo%>&wcNo=<%=wc.getWcNo()%>";
					}
				});
			});
		</script>
		
		<br> <br> <br>

		<div id="detail_warning">
			<p id="detail_warning_p">&lt; 유의사항 &gt;</p>
			<div id="detail_warning_text">
				<p>
					도자기를 만드시는 시간이 약 1시간 30분이 소요되기 때문에 마지막 오후 8시 20분 이전까지는 꼭 방문하여 주시길
					부탁드립니다.<br> 아래 일정선택을 통하여 예약 가능하며 기타 자세한 내용은 010-8904-0156으로 연락
					주시면 감사하겠습니다.
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