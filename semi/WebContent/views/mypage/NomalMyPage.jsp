<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, reservation.model.vo.*, member.model.*, review.model.vo.*, qna.model.vo.*"%>
	<%
    	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list"); 
    	ArrayList<Review> relist = (ArrayList<Review>)request.getAttribute("reviewlist");
    	  ArrayList<Qna> qnalist = (ArrayList<Qna>)request.getAttribute("qnalist");
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

#menu>li {
	margin-top: 30px;
	margin-botton: 30px;
}

.menuLi {
	
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="nomalPage-maindiv">
		<header>
			<div id="profile">
				<p style="text-align: center; padding-top: 25px;">프로필 사진</p>
			</div>
			<table id="header-info">
				<tr>
					<td width=110px>등급</td>
					<td></td>
					<!-- (< % loginUser.get총 결제금액 %>)  -->
				</tr>
				<tr>
					<td>포인트</td>
					<td></td>
					<!-- <  %= loginUser.getPoint() %>   -->
				</tr>
			</table>
		</header>
		<aside>
			<ul id="menu">
				<li class="menuLi" id="N-Reservation">예약 내역</li>
				<li class="menuLi" id="N-Review">내 후기</li>
				<li class="menuLi" id="N-Qna">문의 내역</li>
				<li class="menuLi" id="N-PayMent">결제 내역</li>
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
					$("#N-PayMent").css("color","black");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","block");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Review").click(function(){			//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$(this).css("color","green");
					$("#N-Qna").css("color","black");
					$("#N-PayMent").css("color","black");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","block");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Qna").click(function(){				//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-PayMent").css("color","black");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","block");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-PayMent").click(function(){			//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-Update-info").css("color","black");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","block");
					$("#changeInfoForm").css("display","none");
					$("#deleteMember").css("display","none");
				});
				$("#N-Update-info").click(function(){		//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-PayMent").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-Delete-Member").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","block");
					$("#deleteMember").css("display","none");
				});
				$("#N-Delete-Member").click(function(){		//회원 탈퇴
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-PayMent").css("color","black");
					$("#N-Review").css("color","black");
					$("#N-Update-info").css("color","black");
					$(this).css("color","red");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
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
				}  
			}
		</script>
		<section>
			<div id="ReserTable">
				<h2>예약 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th>예약일자</th>
							<th>공방이름</th>
							<th>클래스이름</th>
							<th>인원수</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="6" style="text-align: center">조회된 예약내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Reservation r : list) {%>
						<tr>
							<td><%=r.getResDate()%></td>
							<td><%=r.getWsName()%></td>
							<td><%=r.getWcName() %></td>
							<td><%=r.getResNop() %></td>
							<td><%=r.getTotalPrice()%></td>
							<td><button type="button" class="cancel">취소하기</button></td>
						</tr>
						<% } %>
						<% } %>
					</tbody>
				</table>
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
							<td colspan="4" style="text-align: center">조회된 예약내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Qna q : qnalist) {%>
						<tr>
							<td><%=q.getqTitle()%></td>
							<td><%=q.getqContent()%></td>
							<td><%=q.getqEntdate()%></td>
							<% if (q.getqReplayck()){ %>
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
			<div id="PayTable">
				<h2>결제 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th>일자</th>
							<th>공방이름</th>
							<th>클래스이름</th>
							<th>인원수</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2019/09/22</td>
							<td>기자도자기</td>
							<td>도자기로 죽부인 만들기</td>
							<td>3명</td>
							<td>70,000</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<h4 id="sum">
					합계 : <input type="text" disabled="disabled">
				</h4>
			</div>
			<div id="changeInfoForm">
				<h2>회원정보 수정</h2>
				<hr>
				<form
					action="location.href ='<%= request.getContextPath() %>/updateMember.nomal'">
					<h4>비밀번호 변경</h4>
					비밀번호 입력 : <input type="password"><br>
					<br> 비밀번호 확인 : <input type="password">
					<hr>
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
						onclick="location.href ='<%= request.getContextPath() %> /views/mypage/businessmember.jsp'">신청하기</button>
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

	<div id="jjim list"></div>

	<%@ include file="../common/footbar.jsp"%>
</body>
</html>