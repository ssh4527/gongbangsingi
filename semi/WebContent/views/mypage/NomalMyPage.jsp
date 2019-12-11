<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	#nomalPage-maindiv{
		width: 1300px;
		min-height: 600px;
		position: relative;
	}
	header{
		width: 230px;
	}
	aside{
		width: 16%;
		height: 97%;
		float: left;
		margin: 1%;
		text-align: center;
		border-right:1px solid lightgray;
	}
	#menu>li{
		margin-top:30px;
		margin-botton:30px;
	}
	.menuLi{
	
	}
	section{
		margin: 1%;
		width: 75%;
		height: 97%;
		float: left;
		
		position: absolute;
		top: -10px;
		right:60px;
	}
	#ReviewTable,#QnaTable,#PayTable,#changeInfoForm{
		display:none;
	}
	#menu>li:hover{
		cursor: pointer;
	}
	#sum{
		float:right;
	}
	.ckhobby{
		
	}
	.header-info{
		display:inline-block;
		margin-left:9px;
	}
	#profile{
		width:100px;
		height:100px;
		border: 1px solid black;
		border-radius: 50px;
		margin-left:75px;
		margin-top: 10px;
		overflow: hidden;
	}
	#profile:hover{
		cursor:pointer;
	}
	#header-info{
		margin-left:50px;
	}
	
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	<div id="nomalPage-maindiv">
		<header>
			<div id="profile">
            	<p style="text-align:center; padding-top: 25px;">프로필 사진</p>
            </div>
            <table id ="header-info">
            	<tr>
            		<td width=110px>등급</td>
            		<td>GOLD</td>
            	</tr>
            	<tr>
            		<td>포인트</td>
            		<td>99999</td>
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
					
					$("#ReserTable").css("display","block");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
				});
				$("#N-Review").click(function(){			//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$(this).css("color","green");
					$("#N-Qna").css("color","black");
					$("#N-PayMent").css("color","black");
					$("#N-Update-info").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","block");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
				});
				$("#N-Qna").click(function(){				//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-PayMent").css("color","black");
					$("#N-Update-info").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","block");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","none");
				});
				$("#N-PayMent").click(function(){			//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					$("#N-Update-info").css("color","black");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","block");
					$("#changeInfoForm").css("display","none");
				});
				$("#N-Update-info").click(function(){		//메뉴 스크립트
					$("#N-Reservation").css("color","black");
					$("#N-Qna").css("color","black");
					$("#N-PayMent").css("color","black");
					$("#N-Review").css("color","black");
					$(this).css("color","green");
					
					$("#ReserTable").css("display","none");
					$("#ReviewTable").css("display","none");
					$("#QnaTable").css("display","none");
					$("#PayTable").css("display","none");
					$("#changeInfoForm").css("display","block");
				});
				$("#N-Delete-Member").click(function(){		//회원 탈퇴
					if(window.confirm("정말 탈퇴하시겠습니까?")){
						window.prompt("비밀번호를 입력하세요","")	
					}
				});
				
			});
			/* function application(){			// 사업자 전환
				var test1 = /^[0-9]$/;
				if(test1.test(window.prompt("사업자 등록번호를 입력하세요",""))){
					window.alert("숫자만 입력하세요");
				}
				
			} */
		</script>
		<section>
		<div id="ReserTable">
			<h2>예약 내역</h2>
			<table class="table">
				<thead>
					<tr>
						<th>예약일자</th>
						<th>예약번호</th>
						<th>인원수</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2020/02/02</td>
						<td>32</td>
						<td>6명</td>
						<td>90,000 원</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div id="ReviewTable">
			<h2>내 후기</h2>
			<table class="table">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>작성일자</th>
						<th>좋아요 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>너무 좋네요^^</td>
						<td>아이와 함께 만들어서 너무 즐거운 시간이였..</td>
						<td>2019/11/30</td>
						<td>42</td>
					</tr>
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
					<tr>
						<td>택배로 배송 가능..</td>
						<td>만든 도자기를 택배로 보내 주실 수 있..</td>
						<td>2019/9/25</td>
						<td>답변 완료</td>
					</tr>
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
			<h4 id="sum">합계 : <input type="text" disabled="disabled"></h4>
			</div>
			<div id="changeInfoForm">
			<h2>회원정보 수정</h2>
			<hr>
				<form action="">
					<h4>비밀번호 변경</h4>
					비밀번호 입력 : <input type="password"><br><br>
					비밀번호 확인 : <input type="password">
					<hr>
					<h4>관심분야</h4>
					<input class="ckhobby" type="checkbox" name="hobby" value="도자기">도자기
					<input class="ckhobby" type="checkbox" name="hobby" value="액세서리">액세서리
					<input class="ckhobby" type="checkbox" name="hobby" value="가구">가구
					<input class="ckhobby" type="checkbox" name="hobby" value="향수">향수
					<br>
					<input class="ckhobby" type="checkbox" name="hobby" value="제과">제과
					<input class="ckhobby" type="checkbox" name="hobby" value="원예">원예
					<input class="ckhobby" type="checkbox" name="hobby" value="가죽">가죽
					<input class="ckhobby" type="checkbox" name="hobby" value="기타">기타
					<hr>
					<h3>공방 사업자 신청하기</h3>
					<button type="button" onclick="location.href ='<%= request.getContextPath() %>/views/mypage/businessmember.jsp'">신청하기</button>
					<hr>
					<button type="submit">변경 완료</button>
				</form>
			</div>
		</section>
	</div>
	
	<div id="jjim list">
		
	</div>

	<%@ include file ="../common/footbar.jsp" %>
</body>
</html>