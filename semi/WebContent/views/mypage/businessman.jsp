<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, reservation.model.vo.*, member.model.*, review.model.vo.*, qna.model.vo.*, workshop.model.vo.* "%>
<%
	ArrayList<Reservation> list = (ArrayList<Reservation>) request.getAttribute("list");
	ArrayList<Review> relist = (ArrayList<Review>) request.getAttribute("reviewlist");
	ArrayList<Qna> qnalist = (ArrayList<Qna>) request.getAttribute("qnalist");
	String WsNo = (String)request.getAttribute("wsNo");
	int num = (int)request.getAttribute("canI");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 사업자 마이 페이지</title>
<style>
#nomalPage-maindiv {
	width: 1300px;
	min-height: 600px;
	position: relative;
}

header {
	width: 230px;
}

aside {
	width: 16%;
	height: 97%;
	float: left;
	margin: 1%;
	text-align: center;
	border-right: 1px solid lightgray;
}

#menu {
	
}

#menu>li {
	list-style: none;
	margin-top: 30px;
	margin-botton: 30px;
}

section {
	margin: 1%;
	width: 75%;
	height: 97%;
	float: left;
	position: absolute;
	top: -10px;
	right: 60px;
}

#ReserTable tr td {
	border-top: none;
}

#ReviewTable, #QnaTable, #PayTable, #changeInfoForm, #deleteMember {
	display: none;
}

#menu>li:hover {
	cursor: pointer;
}

#sum {
	float: right;
}

.ckhobby {
	
}

.header-info {
	display: inline-block;
	margin-left: 9px;
}

#profile {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	border-radius: 50px;
	margin-left: 75px;
	margin-top: 10px;
	overflow: hidden;
	background:
		url('<%=request.getContextPath()%>/resources/images/city1.PNG')
		no-repeat;
}

#profile:hover {
	cursor: pointer;
}

#header-info {
	margin-left: 50px;
}

.cancel {
	position: absolute;
	right: 65px;
	border: 2px solid orangered;
	background-color: white;
	border-radius: 10px;
}

.cancel:hover {
	
}

#B-Reservation {
	color: green;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="nomalPage-maindiv">
		<header>
			<div></div>
		</header>
		<aside>
			<ul id="menu">
				<li class="menuLi" id="B-Reservation">예약 내역</li>
				<li class="menuLi" id="B-Review">공방 후기</li>
				<li class="menuLi" id="B-Qna">공방 문의</li>
				<li class="menuLi" id="B-Update-info">회원정보 수정하기</li>
				<li class="menuLi" id="B-Delete-Member">회원 탈퇴</li>
				<li class="menuLi" id="Go-MyWorkShop">내 공방 페이지</li>
			</ul>
		</aside>

		<script>								
			$(function(){
				$("#Go-MyWorkShop").click(function(){
					location.href="<%=request.getContextPath()%>/detail.sh?WsNo=<%= WsNo %>";	<%-- 공방 페이지 이동 detail.sh?WsNo= --%>
				});
				$("#profile").click(function(){
					
				});
				$("#B-Reservation").click(function(){		//메뉴 스크립트
					$(this).css("color","green");
					$("#B-Review").css("color","black");
					$("#B-Qna").css("color","black");
					$("#B-Update-info").css("color","black");
					$("#B-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","block");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#B-Review").click(function(){			//메뉴 스크립트
					$("#B-Reservation").css("color","black");
					$(this).css("color","green");
					$("#B-Qna").css("color","black");
					$("#B-Update-info").css("color","black");
					$("#B-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","block");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#B-Qna").click(function(){				//메뉴 스크립트
					$("#B-Reservation").css("color","black");
					$("#B-Review").css("color","black");
					$(this).css("color","green");
					$("#B-Update-info").css("color","black");
					$("#B-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","block");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
			
				$("#B-Update-info").click(function(){		//메뉴 스크립트
					$("#B-Reservation").css("color","black");
					$("#B-Qna").css("color","black");
					$("#B-Review").css("color","black");
					$(this).css("color","green");
					$("#B-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","block");
					$("#deleteMember").css("display","none");
				});
				$("#B-Delete-Member").click(function(){		//회원 탈퇴
					$("#B-Reservation").css("color","black");
					$("#B-Qna").css("color","black");
					$("#B-Review").css("color","black");
					$("#B-Update-info").css("color","black");
					$(this).css("color","red");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","block");
				});
			});
			 function deleteMember(){
				 if( <%=loginUser.getUserPwd()%> == $("#ckPwd").val() ){
						if(window.confirm("정말 탈퇴하시겠습니까?")){
							window.alert("회원 탈퇴 완료");
							location.href = "<%=request.getContextPath()%>/deleteMember.nomal";
					}
				} else {
					window.alert("비밀번호가 일치하지 않습니다.")
				}
			}
		</script>
		<style>
			scroll-tb{border-collapse:collapse;}
			.scroll-tb thead{float:left; width:100%;}
			.scroll-tb tbody{overflow-x:hidden; float:left; width:100%; height:370px}
			.scroll-tb tbody tr{display:table; width:100%;}
			.scroll-tb td{width:100px}
		</style>
		<section>
			<div id="ReserTable">
				<h2>예약 현황</h2>
				<table class="table scroll-tb">
					<thead>
						<tr>
							<th>예약 일자</th>
							<th>예약자 이름</th>
							<th>클래스 이름</th>
							<th>인원 수</th>
							<th>가격</th>
							<th>결제상태</th>
						</tr>
					</thead>
					
					<tbody>
						<%if (list.isEmpty()) {%>
						<tr>
							<td colspan="6" style="text-align: center">조회된 예약 내역이 없습니다.</td>
						</tr>
						<% } else { %>
								<% for (Reservation r : list) { %>
								<tr>
									<td><%=r.getResDate()%></td>
									<td><%=r.getcName()%></td>
									<td><%=r.getWcName()%></td>
									<td><%=r.getResNop()%>명</td>
									<td><%=r.getTotalPrice()%>원</td>
									<td><%=r.getResState()%></td>
								</tr>
								<% } %>
							<% } %>
					</tbody>
				</table>
				<hr>

				<div style="float: right;">
					<h4 style="float: right;">총 결제 금액</h4>
					<br> <input type="text" disabled="disabled" id="Payment" style="text-align: center;">
					<% if (!list.isEmpty()) { %>
					<script>
						$("#Payment").val(<%= request.getAttribute("show")%>)
					</script>
					<% } else { %>
					<script>
						$("#Payment").val("결제 금액 기록 없음")
					</script>
					<% } %>
				</div>
				
			</div>

			<div id="ReviewTable">
				<h2>공방 후기</h2>
				<table class="table" style="max-height: 500px; overflow: hidden;">
					<thead>
						<tr>
							<th>작성자</th>
							<th>클래스 이름</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일자</th>
							<th>별점</th>
						</tr>
					</thead>
					<tbody>
						<% if (relist.isEmpty()) { %>
						<tr>
							<td colspan="6" style="text-align: center">조회된 후기가 없습니다.</td>
						</tr>
						<% } else { %>
						<% for (Review re : relist) { %>
						<tr>
							<td><%=re.getcName()%></td>
							<td><%=re.getWcName()%></td>
							<td><%=re.getRTitle()%></td>
							<td><%=re.getRContent()%></td>
							<td><%=re.getREnDate()%></td>
							<td><%=re.getRGrade()%></td>
						</tr>
						<% } %>
						<% } %>
					</tbody>
				</table>
				<hr>
				<button type="button" onclick="location.href='<%= request.getContextPath()%>/review.search';" style="float: right;">후기 더 보기</button>
			</div>
			<div id="QnaTable">
				<h2>공방 문의</h2>
				<table class="table">
					<thead>
						<tr>
							<th>작성자</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일자</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<% if (qnalist.isEmpty()) { %>
						<tr>
							<td colspan="5" style="text-align: center">조회된 문의 내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for (Qna q : qnalist) { %>
						<tr>
							<td><%=q.getqTitle()%></td>
							<td><%=q.getqContent()%></td>
							<td><%=q.getqEntdate()%></td>
							<% if (q.getqReplayck().contains("Y")) { %>
							<td>
								<p style="color: green;">답변 완료</p>
							</td>
							<% } else { %>
							<td>
								<p style="color: red">답변 없음</p>
							</td>
							<% } %>
						</tr>
						<% } %>
						<% } %>
					</tbody>
				</table>
			</div>
			<div id="changeInfoForm">
				<h2>회원정보 수정</h2>
				<hr>
				
				
				<form action="location.href='<%=request.getContextPath()%>/updatePwd.normal'" onsubmit="return true">
					<h4>비밀번호 변경</h4>
					<table>
						<tr>
							<td>새 비밀번호 입력 :</td>
							<td><input type="password" id="pwd1" name = "newPwd"></td>
						</tr>
						<tr>
							<td>비밀번호 확인 :</td>
							<td><input type="password" id="pwd2"></td>
						</tr>
					</table>
					<div>
						<button id="changePwd" type="button" onclick="identiSame()">변경하기</button>
					</div>
					 <script>
					 $(function(){
						function identiSame(){
							 if($("#pwd1").val() != $("#pwd2").val()){
								window.alert("비밀번호가 일치하지 않습니다."); 
							}
						};
					});
					</script> 
				</form>
				
				
				<%-- ------------------------------------------------------------------ 
					<script>
						$(function() {
							$("#changePwdCk").focusin(
									function() {
										$(this).focusout(
											function() {
												if ($("#changePwd").val() != $("#changePwdCk").val()) {
													$("#changePwdCk").parent().next().html("비밀번호가 일치하지 않습니다.");
												} else {
													$("#changePwdCk").parent().next().html("");
												}
											});
										});
									});
							function checkChangePwd() {
								var test = $("#changePwdCk").parent().next().html();
								if (test.length > 0) {
									return false;
								}
								return true;
							};
					</script>
					------------------------------------------------------------------ --%>
				<hr>
				
				
				<form action="<%=request.getContextPath()%>/updateAddress" onsubmit="return false">
					<h4>공방주소 변경</h4>
						주소 입력 <br> <input name ="address" type="text" maxlength="40" style="width: 300px; height: 20px;"> <br>
					<button id="addr">주소 변경하기</button>
				</form>
			</div>
			<div id="deleteMember">
				<h4>회원 탈퇴 신청</h4>
				<hr>
				<% if (num > 0) { %>
				<small style="color: red; display: block;">*공방 예약 현황이 없어야 가능합니다*</small><br>	
				<% } %>

				비밀번호 확인 : <input type="password" id="ckPwd"><br> <br>
				
				<% if (num > 0) { %>
				<button type="button" class="deleteMember-btn" disabled="disabled">탈퇴하기</button>
				<% } else if (num == 0){ %>
				<button type="button" class="deleteMember-btn" onclick="deleteMember()">탈퇴하기</button>
				<% } %>
			</div>
		</section>
	</div>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>