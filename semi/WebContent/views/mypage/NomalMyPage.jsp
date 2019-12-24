<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, reservation.model.vo.*, member.model.*, review.model.vo.*, qna.model.vo.*, jjim.model.vo.* "%>
	<%
    	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list"); 
    	ArrayList<Review> relist = (ArrayList<Review>)request.getAttribute("reviewlist");
    	ArrayList<Qna> qnalist = (ArrayList<Qna>)request.getAttribute("qnalist");
    	ArrayList<Jjim> jlist = (ArrayList<Jjim>)request.getAttribute("jlist");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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

#menu{
	
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

#N-Reservation {
	color: green;
}
.ChangePwdInMyPage{
	width: 200px !important;
	height: 30px !important;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="nomalPage-maindiv">
		<header>
			<br>
			<table id="header-info">
				<tr>
					<td width=110px>등급</td>
					<td>
						<%= (String) session.getAttribute("usergrade") %>
					</td>
				</tr>
				<tr >
					<td>포인트</td>
					<td><%= loginUser.getPoint()%></td>
				</tr>
			</table>
		</header>
		<aside>
			<ul id="menu">
				<li class="menuLi" id="N-Reservation">예약 내역</li>
				<li class="menuLi" id="N-Review">내 후기</li>
				<li class="menuLi" id="N-Qna">문의 내역</li>
				<li class="menuLi" id="N-Update-info">회원정보 수정하기</li>
				<li class="menuLi" id="N-Delete-Member">회원 탈퇴</li>
			</ul>
		</aside>
		
		<script>								
			$(function(){
				$("#profile").click(function(){
					
				});
				$("#N-Reservation").click(function(){		//메뉴 스크립트
					$(this).css("color","green");
					$("#N-Review").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","block");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Review").click(function(){			//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$(this).css("color","green");
					$("#N-Qna").css("color","black");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","block");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Qna").click(function(){				//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","block");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Update-info").click(function(){		//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","block");
					$("#deleteMember").css("display","none");
				});
				$("#N-Delete-Member").click(function(){		//회원 탈퇴
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-Review").css("color","black");
					$("#N-Update-info").css("color","black");
					$(this).css("color","red");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","block");
				});
			});
			 function deleteMember(){
				 if( <%= loginUser.getUserPwd() %> == $("#ckPwd").val() ){
						if(window.confirm("정말 탈퇴하시겠습니까?")){
							window.alert("회원 탈퇴 완료");
							location.href = "<%= request.getContextPath()%>/deleteMember.nomal";
					}
				}else{
					window.alert("비밀번호가 일치하지 않습니다.")
				}
			}
		</script>
		<section>
			<div id="ReserTable">
				<h2>예약 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th>예약 일자</th>
							<th>공방 이름</th>
							<th>클래스 이름</th>
							<th>인원 수</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="6" style="text-align: center">조회된 예약 내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Reservation r : list) {%>
						<tr>
							<td><%=r.getResDate()%></td>
							<td><%=r.getWsName()%></td>
							<td><%=r.getWcName() %></td>
							<td><%=r.getResNop() %>명</td>
							<td><%=r.getTotalPrice()%>원</td>
							<%-- <td><button type="button" class="cancel">취소하기</button></td> --%>
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
				<h2>내 후기</h2>
				<table class="table">
					<thead>
						<tr>
							<th>클래스 이름</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일자</th>
							<th>별점</th>
						</tr>
					</thead>
					<tbody>
						<% if(relist.isEmpty()){ %>
						<tr>
							<td colspan="5" style="text-align: center">조회된 후기가 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Review re : relist) {%>
						<tr>
							<td><%=re.getcName()%></td>
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
				<button type="button" onclick="location.href='<%= request.getContextPath()%>/review.search';">후기 더 보기</button>
				
			</div>
			<div id="QnaTable">
				<h2>문의 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>작성일자</th>
							<th>답변 여부</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="4" style="text-align: center">조회된 문의 내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Qna q : qnalist) {%>
						<tr>
							<td><%=q.getqTitle()%></td>
							<td><%=q.getqContent()%></td>
							<td><%=q.getqEntdate()%></td>
							<% if (q.getqReplayck().contains("TRUE")){ %>
								<td>
									<p style="color:green;">답변 완료</p>
								</td>
							<% } else {%>
								<td>
									<p style="color:red">답변 없음</p>
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
					<form id="changePwdForm" method="post" action="<%=request.getContextPath()%>/change.pwd" onsubmit="return checkChangePwd();">
						<div id="signArea">
						  <div class="textdivarea">비밀번호</div>
						    <div class="inputdivarea">
								<input type="password" id="changePwd" class="ChangePwdInMyPage" width: 200px name="changePwd" required>
							</div>
							<input type="text" id="changeId" name="changeId" style="display: none;">
						  <div class="commentarea"></div>
						  <div class="textdivarea">비밀번호 확인</div>
						  <div class="inputdivarea">
							<input type="password" id="changePwdCk" class="ChangePwdInMyPage" name="changePwdCk" required>
						  </div>
							<div class="commentarea"></div>
							<button type="submit" id="changepwdformbtn">비밀번호 변경</button>
						</div>
					</form>
					<script>
						$(function() {
							$("#changePwdCk").focusin(
									function() {
										$(this).focusout(
											function() {
												if ($("#changePwd").val() != $(
														"#changePwdCk").val()) {
													$("#changePwdCk").parent().next().html(
															"비밀번호가 일치하지 않습니다.");
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
					<hr>
					<form action="location.href ='<%= request.getContextPath() %>/updateMember.nomal'">
					<h4>관심분야</h4>
					<input class="ckhobby" type="checkbox" name="hobby" value="도자기">도자기
					<input class="ckhobby" type="checkbox" name="hobby" value="액세서리">액세서리
					<input class="ckhobby" type="checkbox" name="hobby" value="가구">가구
					<input class="ckhobby" type="checkbox" name="hobby" value="향수">향수
					<br> <input class="ckhobby" type="checkbox" name="hobby"
						value="제과">제과 <input class="ckhobby" type="checkbox"
						name="hobby" value="원예">원예 <input class="ckhobby"
						type="checkbox" name="hobby" value="가죽">가죽 <input
						class="ckhobby" type="checkbox" name="hobby" value="기타">기타
					<hr>
					<h3>공방 사업자 신청하기</h3>
					<button type="button"
						onclick="location.href ='<%= request.getContextPath() %>/views/notice/businessmember.jsp'">신청하기</button>
					<hr>
					<button type="submit">변경 완료</button>
				</form>
			</div>
			<div id="deleteMember">
				<h4>회원 탈퇴</h4>
				<hr>
					비밀번호 확인 : <input type="password" id="ckPwd"><br>
				<br>
				<button type="button" id="deleteMember-btn" onclick="deleteMember()">탈퇴하기</button>
			</div>
		</section>
	</div>
	
	<style>
		#jjim-list{
			border : 1px solid red;
		}
	</style>
	
	<div id="jjim-list" >
		<h4>찜 목록</h4><hr>
			<table>
				<% if(jlist.isEmpty()){ %>
						<tr>
							<td colspan="5" style="text-align: center">찜 목록이 비어있습니다.</td>
						</tr>
						<% } else { %>
						<% for(Jjim j : jlist) {%>
						<tr>
							<td><%=j.getWc_name()%></td>
						</tr>
						<% } %>
						<% } %>
			</table>
		
	</div>
	
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>