<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String loginmsg = (String)request.getAttribute("loginmsg");
%>
<html>
<head>

<meta charset="utf-8" />

<title>공방신기에 오신걸 환영합니다.</title>


<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style>
body {
	width: 1300px;
	margin: auto;
/* 	background-color: beige;
	background-size: cover; */
} *{
	font-family: 'Nanum Pen Script', cursive;
	font-size:large;

}
  
#logoimg {
	margin-top: 18%;
}

#searchdiv {
	width: 100%;
	height: 50px;
	margin-top: 18%;
	
}

#searchinput {
	width: 60%;
	height: 100%;
	margin: 0px;
	padding: 0px;
}

#searchbtn {
	width: 10%;
	height: 100%;
}

#nav>ul {
	list-style: none;
	
}
.nav-item{
	width:15%;
	margin-left:5%;
	margin-right:5%;
	height:80px;
}
.nav-link {
	text-align: center;
	width: 100%;
	height:100%;
	line-height: 50px;
}

#logindiv {
	float: left;
	width: 24%;
	height: 70%;
	margin-top:50px;
	
}

#loginform {
	background-color: lightgrey;
	width: 80%;
	height: 70%;
	margin: 30px;
	margin-top: 50px;
}

#loginbtn {
	font-size: 85%;
}

.searchspan {
	margin-top: 10px;
	float: left;
	margin-right: 15px;
}

#userdiv {
	background-color: lightgrey;
	width: 80%;
	height: 70%;
	margin: 30px;
	margin-top: 50px;
	border: 1px solid black;
}

#usericon {
	background:
		url('<%=request.getContextPath()%>/resources/images/city1.PNG')
		no-repeat;
	background-size: cover;
	width: 35%;
	height: 60%;
	margin-left: 8%;
	margin-top: 6%;
	border-radius: 50%;
	float: left;
	border: 1px solid black;
}

#testinfo>* {
	margin: 10px;
	margin-top:0px;
}

#logoimg:hover {
	cursor: pointer;
}

#signArea {
	padding-top: 15px;
	width:100%;
}
.textdivarea{
	width:100%;
	margin:auto;
	text-align:left;
	font-size:0.9em;
}
.inputdivarea{
	width:100%;
	margin:auto;
	height:40px;
}
.commentarea{
	width: 100%;
	margin:auto;
	height:10px;
	font-size:0.8em;
}
.inputdivarea > input{
	width:100%;
	height:100%;
}
#myInterest{
	background:white;
	width:100%;
	margin:auto;
	border:1px solid grey;
}
#joinMemberbtn{
	width: 100%;
	height: 40px;
	background: darkgray;
	border : 3px double gray;
	text-align: center;
	border-radius: 5px;
	margin-top:15px;
	
}
#newMember ,#gomypage{
	margin-left:42px;
}
.idpwdinputouter{
	width: 90%; 
	height: 40%;
	margin: 5%;
	
}
 .idpwdinput{
	width:100%;
	height: 100%;
}
#alarmicon{
	text-align: center;
	float: right;
	width: 30%;
	height: 30%;
	border-radius:100%;
	border: 1px solid black;
	line-height:20px;
	
	color:white;
	background-color:rgb(231, 80, 80);
}
</style>
<script>
var msg = "<%= loginmsg %>";
$(function(){
	if(msg != "null"){
		alert(msg);
		<% session.removeAttribute("loginmsg"); %>
	}
});

</script>
</head>
<body>
	<div id="menubar"
		style="width: 1300px; height: 300px;">
		<div id="mainlogo"
			style="width: 18%; height: 80%; float: left;margin-right: 20px; margin-left: 30px;">
			<img src='<%=request.getContextPath()%>/resources/images/city1.PNG'
				id="logoimg" style="width: 100%; height: 80%; margin-top:30%;">
		</div>
		<div id="middlediv"
			style="float: left; width: 54%; height: 100%; margin-right: 0px;">
			<form>
				<div id="searchdiv">
					<input type="text" placeholder="클래스를 검색해주세요." id="searchinput"
						style="margin-left: 80px; margin-right: 20px;">
					<button type="button" id="searchbtn">검색</button>
				</div>
			</form>
			<div
				style="width: 70%; height: 50px; margin-left: 80px;">
				<span class="searchspan">인기 검색어 : </span> <span class="searchspan">도자기</span>
				<span class="searchspan">반지</span> <span class="searchspan">악세사리</span>
				<!-- span 태그에 온클릭 달아서 눌르면 그 단어로 검색되게 펑션처리 해야함-->
			</div>
		</div>
		<div id="logindiv">
			<%
				if (loginUser == null) {
			%>
			<form id="loginform" action="<%= request.getContextPath() %>/login.me" method="post" ><!-- onsubmit="return validate();" -->
				<div id="idpwddiv" style="width: 63%; height: 60%; float: left; margin: 5%; margin-right: 2%;">
					<div id="iddiv" class="idpwdinputouter" >
						<input type="text" name="idinput" id="idinput" class="idpwdinput"  placeholder="아이디">
					</div>
					<div id="pwddiv" class="idpwdinputouter">
						<input type="password" name="pwdinput" id="pwdinput" class="idpwdinput" placeholder="패스워드">
					</div>
				</div>
				<div id="loginbtndiv"
					style="width: 25%; height: 60%; float: left; margin: 5%; margin-left: 0%;">
					<button id="loginbtn" type="submit"
						style="width: 100%; height: 89%; margin-bottom: 5%; margin-top: 10%;">로그인</button>
				</div>
				<div id="newmemberdiv" style="background-color: lightgrey;">
					<a id="newMember" href="#newMembermodal">회원가입</a> / <a id="findmyid"
						href="#">아이디</a>, <a id="findmypwd" href="#">비밀번호 찾기</a>
					<!-- Button trigger modal -->
					<button id="newMemberbtn"type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#newMembermodal" style="display:none"></button>
					<button id="findmyidbtn"type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#findmyiddiv" style="display:none"></button>
					<button id="findmypwdbtn"type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#findmypwddiv" style="display:none"></button>
				</div>
			</form>
			<%
				} else {
			%>
			<div id="userdiv">
				<div id="usericon">
					<div id="alarmicon"	>1</div>
				</div>
				<div
					style="text-align: center; width: 45%; height: 30%; margin-left: 8%; margin-top: 8%; float: left; background-color: lightgrey;">
					<div style="margin-top:10px;">
						예약건수 : <span id="myreservation">2</span>
					</div>
					<div style="margin-top:10px;">
						 나의 등급 : <span id="mydunggul">Pt</span>
					</div>
				</div>
				<div id="testinfo"
					style="float: left;background-color: lightgrey; width: 80%; margin: 10%; margin-top:5%;">
					 <a id="gomypage" href="#">마이페이지</a><a id="logout"
						href="<%= request.getContextPath()%>/logout.me">로그아웃</a>
						<!-- 마이페이지 눌렀을때 연결하도록 설정해야함 -->
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
	
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/views/">공방</a></li>
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/views/classcategory/category.jsp">클래스</a></li>
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/views/review/reviewList.jsp">리뷰</a></li>
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/views/notice/board.jsp">고객센터</a></li>
	</ul>
	<script>
		$(function(){
			$("#newMember").click(function(){
				//window.open("views/member/JoinMember.jsp", "?", "width=700, height=660");
				$("#newMemberbtn").click();
			});
			$("#logoimg").click(function(){
				location.href='<%=request.getContextPath()%>';
			});
			$("#findmyid").click(function(){
				$("#findmyidbtn").click();
			});
			$("#findmypwd").click(function(){
				$("#findmypwdbtn").click();
			})
			$("#logout").click(function(){
				location.href='<%=request.getContextPath() %>/logout.me';
			})
		});
	</script>
	<!-- 회원가입 하는 모달 -->
	<div class="modal fade" id="newMembermodal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="width:90%; background:grey;">
        <h5 class="modal-title" id="staticBackdropLabel" >회원가입</h5>
        <button type="button" class="close"  data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="width:90%;">
        <form>
			<div id="signArea">
				<div class="textdivarea">아이디</div>
				<div class="inputdivarea"><input type="text" id="userId"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">비밀번호</div>
				<div class="inputdivarea"><input type="password" id="userPwd"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">비밀번호 확인</div>
				<div class="inputdivarea"><input type="password" id="userPwdCk"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">이름</div>
				<div class="inputdivarea"><input type="text" id="userName"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">이메일</div>
				<div class="inputdivarea"><input type="email" id="userEmail"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">전화번호</div>
				<div class="inputdivarea"><input type="text" id="userPhone" placeholder="-를 빼고 입력해주세요"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">생년월일</div>
				<div class="inputdivarea"><input type="text" id="userBirth" placeholder="ex:19750524"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">비밀번호 찾기 질문</div>
				<select class="inputdivarea" style="margin-bottom:10px;">
        			<option selected value="1">나의 어머니의 이름은?</option>
        			<option value="2">나의 출생도시는?</option>
        			<option value="3">내가 졸업한 초등학교는?</option>
   				</select>
				<div class="inputdivarea"><input type="text" id="userhint"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">관심분야</div>
				<div id="myInterest">
					<input type="checkbox" name="도자기"><label>도자기</label> <input
						type="checkbox" name="액세서리"><label>액세서리</label> <input
						type="checkbox" name="가구"><label>가구</label> <input
						type="checkbox" name="향수"><label>향수</label>
						<br>  
						<input type="checkbox" name="제과"><label>제과</label>
						<input type="checkbox" name="원예"><label>원예</label> 
						<input type="checkbox" name="가죽"> <label>가죽</label>
						<input type="checkbox" name="기타"><label>기타</label>
						<br>
				</div>
			<button type="submit" id="joinMemberbtn">가입하기</button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- 아이디 찾는 모달 -->
<div class="modal fade" id="findmyiddiv" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="width:90%; background:grey;">
        <h5 class="modal-title" id="staticBackdropLabel" >ID찾기</h5>
        <button type="button" class="close"  data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="width:90%;">
        <form>
			<div id="signArea">
				<div class="textdivarea">이메일</div>
				<div class="inputdivarea"><input type="text" id="findEmail"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">전화번호</div>
				<div class="inputdivarea"><input type="text" id="findPhone" placeholder="-를 빼고 입력해주세요"></div>
				<div class="commentarea"></div>
				
			<button type="submit" id="findmyidformbtn">아이디 찾기</button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- 비밀번호 찾는 모달 -->
<div class="modal fade" id="findmypwddiv" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="width:90%; background:grey;">
        <h5 class="modal-title" id="staticBackdropLabel" >비밀번호찾기</h5>
        <button type="button" class="close"  data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="width:90%;">
        <form>
			<div id="signArea">
				<div class="textdivarea">아이디</div>
				<div class="inputdivarea"><input type="text" id="findId"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">비밀번호 찾기 질문</div>
				<select class="inputdivarea" >
        			<option selected value="1">나의 어머니의 성함은?</option>
        			<option value="2">나의 출생도시는?</option>
        			<option value="3">내가 졸업한 초등학교는?</option>
   				</select>
				<div class="inputdivarea"><input type="text" id="findhint"></div>
				<div class="commentarea"></div>
			<button type="submit" id="findmypwdformbtn">비밀번호 찾기</button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- ajax로 연결해야함 비밀번호 변경하는 모달 -->
<div class="modal fade" id="findmypwddiv" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="width:90%; background:grey;">
        <h5 class="modal-title" id="staticBackdropLabel" >비밀번호 변경</h5>
        <button type="button" class="close"  data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="width:90%;">
        <form>
			<div id="signArea">
				<div class="textdivarea">비밀번호</div>
				<div class="inputdivarea"><input type="password" id="changePwd"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">비밀번호 확인</div>
				<div class="inputdivarea"><input type="password" id="changePwdCk"></div>
				<div class="commentarea"></div>
				<button type="submit" id="changepwdformbtn">비밀번호 변경</button>
			</div>
		</form>
      </div>
    </div>

  </div>
</div>

</body>
</html>
