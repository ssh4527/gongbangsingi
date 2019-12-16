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
								 <td><%= loginUser.getPoint() %></td>
							<% } %>
						</tr>
						<tr>
							<td><small style="color: gray">1인당 적립 포인트</small></td>
							<td><small><%= wc.getWcNOP() %></small></td>
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
							<td><small>60,000</small></td>
						</tr>
						<tr>
							<td><small style="color: gray">보유 포인트</small></td>
							<% if(log.equals("asd")) { %>
								<td> 로그인 후 포인트 확인이 가능합니다.</td>
							<% }  else { %>
								 <td><%= loginUser.getPoint() %></td>
							<% } %>
						</tr>
						<tr>
							<td><small style="color: gray">적립 포인트</small></td>
							<td><small>3,000p</small></td>
						</tr>
						</table>
					<hr>
      				</div>
      				
      				
      				<div>
      					<table>
						<tr>
							<td width=150px;><small style="color: gray"> > 날짜/시간
							</small></td>
							<td><select name="pretime" id="pretime" style="font-size: 15px">
									<option value="">-[필수] 시간대를 선택해주세요 -</option>
									<option value="">----------------------</option>
									<option value="1">12:00 - 14:00</option>
									<option value="2">15:00 - 17:00</option>
							</select></td>
						</tr>
						<tr>
							<td><small style="color: gray"> > 인원수 </small></td>
							<td><input type="number" width="10px" min="0" max="9"
								id="precount2" name="precount2"></td>
						<tr>
							<td rowspan="2" style="text-align: right;"></td>
						</tr>
					</table>
					<hr>
      				</div>
      				
      				
      				<div>
      					<small id="pretotal">TOTAL : 	 </small>
      				</div>
      				
      				<!-- pre모달 토탈부분 -->
      				<script>
      					$(function(){
      						$("#pretime").change(function(){
      							console.log(this.value);
      			
      						});
      						
      						$("#precount").change(function(){
      							var count = $("#precount").val();
      							
								$("#pretotal").text("TOTAL : " + count * 60000 + " 원");
								$("#pretotal").css("fontSize","14px");
								
      						});
      						
      						$("#reservationBtnn").click(function(){
      							location.href = "<%= request.getContextPath() %>/views/cash/cash.jsp";
      						});
      					});
      					
      					$("div").append("");
      				</script>
      				
      				
      				<div>
<!--       				<textarea rows="10" cols="100" style="font-family:나눔고딕; font-size : 14px;" >
WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.
	(1).  안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치
	(2). Service Pack 2에 대한 Microsoft사의 상세안내
	(3). 결제보안을 위한 KCP Active-X가 자동설치되지 않을경우 수동설치하시기 바랍니다. 
	
아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.

	(1). KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우
	(2). 결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능
		(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)
	(3). 최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.
		(무통장, 휴대폰결제 포함)
		
세금계산서 발행 안내

	(1). 부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.
	(2). 세금계산서는 사업자만 신청하실 수 있습니다.
	(3). 배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.
	(4). [세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.
	(5). [세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.
	
부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내

	(1). 변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며
	(2). 신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)
	(3). 상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.
	
현금영수증 이용안내

	(1). 현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.
	(2). 현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.
	(3). 발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.
	(4). 현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)
	(5). 현금영수증이나 세금계산서 중 하나만 발행 가능 합니다
      				</textarea> -->
      				</div>
      				<div style="hegiht:150px;">
      					<button type="button" class="btn btn-outline-secondary"
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
		<% if(rList.isEmpty()) { %>
			리뷰없음
		
		<% } else { %>
		<% for(int i = 0; i < rList.size(); i++) {%>
			<!-- 리뷰2 -->
			<div class="ulpre" style="color: gray; font-size: 14px;">
				<ul class="dept" style="color:black; font-family:나눔고딕">
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
							<li id="asd" style="margin-top:20px;"><%= rList.get(i).getRContent() %>
							<% for(int j = 0 ; j < rfList.size(); j++) { %>
								<% if(rList.get(i).getRNo().equals(rfList.get(j).getDestination())) { %>
								<br><img src="<%= request.getContextPath() %>/resources/review_uploadFiles/<%= rfList.get(j).getChangeName() %>" width="400px" height="400px"><br>
								
								<% } %>
							<% } %>
								<% if(rList.get(i).getcName().equals(log)){ %>
								<br><button class="btn btn-outline-secondary" style="float:right;" id="updateBtn<%= rList.get(i).getRNo() %>">수정</button>
									<button class="btn btn-outline-secondary" style="float:right;" id="deleteBtn<%= rList.get(i).getRNo() %>">삭제</button><br><br>
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
					$(function(){
						$(".updateBtn").click(function(){
							console.log("Dd");
						});
						$(".deleteBtn").click(function(){
							console.log("dd");
						});
					});
				</script>
				

					<!-- 리뷰 페이징 -->
				
				<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous" id="pa-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">1</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">2</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
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
							<tr style="color:black;">
								<th scope="row" >3</th>
								<td><span style="margin-left:250px">가는길 질문좀 드릴게요! &nbsp;</span><i class="fas fa-lock-open" style="float:right;"></i></td>
								<td>이진혁</td>
								<td>2019-10-16</td>
							</tr>
							<tr style="color:black;">
								<th scope="row">2</th>
								<td><span style="margin-left:250px">2번 입니다...&nbsp;</span><i class="fas fa-lock" style="float:right;"></i></td>
								<td>오재원</td>
								<td>2019-10-15</td>
							</tr>
							<tr style="color:black;">
								<th scope="row">1</th>
								<td><span style="margin-left:250px">1번 입니다...&nbsp;</span><i class="fas fa-lock" style="float:right;"></i></td>
								<td>누군가</td>
								<td>2019-10-14</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 리뷰 페이징 -->
					<nav aria-label="Page navigation example" style="text-align: center;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous" id="pa-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">1</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">2</a></li>
							<li class="page-item"><a class="page-link" href="#"
								id="pa-link">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next" id="pa-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
			</div>
			<button type="button" class="btn btn-outline-secondary"
					style="float: right">QnA Write</button>
		</div>
		
		<!-- qna 스크립트 -->
		<script>
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