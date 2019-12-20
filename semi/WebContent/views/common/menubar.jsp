<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
	
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	String loginmsg = (String) request.getAttribute("loginmsg");
	String msg = (String) session.getAttribute("msg");
	String[] search = (String[]) session.getAttribute("search");

	
	// 2019 12 15 Hy 찜용
		String userId = "";	
		String log = "";
		if(loginUser != null){
			log =  loginUser.getUserId();	
		}else{
			log = "asd";	
		}
		
%>
<html>
<head>

<meta charset="utf-8" />

<title>공방신기에 오신걸 환영합니다.</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:700&display=swap" rel="stylesheet">
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

	<script src="https://kit.fontawesome.com/1f49e42371.js"
	crossorigin="anonymous"></script> <!--  폰트어썸 라이브러리 -->
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
}

* {
	font-family: 'Nanum Myeongjo', serif;
	/* border:0.5px solid black; */
}


#searchdiv {
	width: 100%;
	height: 150px;
	margin-top:130px;
	
}

#nav>ul {
	list-style: none;
}


.nav-link {
	text-align: center;
	width: 100%;
	height: 100%;
	
}

#loginbtn {
	width:90%;
	height:80%;
	margin-left:5%;
	margin-right:5%;
	margin-top:3.5%;
	font-size:0.8em;
} 

.searchspan {
	margin-top: 5px;
	float: left;
	margin-right: 15px;
}


#testinfo>* {
	margin: 10px;
	margin-top: 0px;
}

#logoimg:hover {
	cursor: pointer;
}

#signArea {
	padding-top: 15px;
	width: 100%;
}

.textdivarea {
	width: 100%;
	margin: auto;
	text-align: left;
	font-size: 0.9em;
}

.inputdivarea {
	width: 100%;
	margin: auto;
	height: 40px;
}

.commentarea {
	width: 100%;
	margin: auto;
	height: 15px;
	font-size: 0.8em;
	color:red;
}

.inputdivarea>input {
	width: 100%;
	height: 100%;
}

#myInterest {
	background: white;
	width: 100%;
	margin: auto;
	border: 1px solid grey;
}

#joinMemberbtn {
	width: 100%;
	height: 40px;
	background: darkgray;
	border: 3px double gray;
	text-align: center;
	border-radius: 5px;
	margin-top: 15px;
}

#newMember  {
	margin-left: 10px;
}
#gomypage{
	margin-left: 30px;
}


.idpwdinput {
	width:90%;
	height:90%;
	margin-left:5%;
	margin-right:5%;
	margin-top:5%;
	
} 

#alarmicon {
	text-align: center;
	float: right;
	width: 30%;
	height: 30%;
	border-radius: 100%;
	border: 1px solid black;
	line-height: 20px;
	color: white;
	background-color: rgb(231, 80, 80);
	font-size:0.9em;
	line-height:22px; 
}
#alarmicon:hover{
	cursor: pointer;
}
.searchspan:hover{
cursor: pointer;
}
.newmemberdiv > a{
	line-height:40px;
}
#mainlogo{
	width: 20%;
	height: 100%;
	float: right;
	margin-right:10%;
}
#maintitle{
	float:left;
	margin-left:240px;
	width:50%;
	height:100%;
	text-align:center;
}
#idpwddiv{
	float: left;
	height:100%;
	width:250px;
}
.idpwdinputdiv{
	float:left;
	width:50%;
	height:100%;
}
#loginbtndiv{
	float:left;
	height:100%;
	width:100px;
}
.newmemberdiv{
	float:left;
	height:100%;
}
#myinfo{
	float:left;
	height:100%;
	width:150px;
}
#mynameinfo{
	float:left;
	width:100%;
	height:100%;
	line-height:40px;
	text-align:center;
}
#mydetailinfo{
	float:left;
	height:100%;
	width:230px;
	line-height:40px;
	text-align:center;
}
.nav-item{
	margin-right:20px;
}
</style>
<script>
var loginmsg = "<%=loginmsg%>";
var msg = "<%=msg%>";
$(function(){
	if(loginmsg != "null"){
		alert(loginmsg);
		<%request.removeAttribute("loginmsg");%>
	}
	if(msg != "null"){
		alert(msg);
		<%session.removeAttribute("msg");%>
	}
});

</script>
</head>
<body>

	<div style="width:100%; height:40px; background: lightgrey;">
	
	<%	if (loginUser == null) { %>
			<form id="loginform" action="<%=request.getContextPath()%>/login.me"method="post">

				<div id="idpwddiv">
					<div class="idpwdinputdiv" >
					<input type="text" name="idinput" id="idinput" class="idpwdinput"placeholder="아이디">
					</div>
					<div class="idpwdinputdiv" >
					<input type="password" name="pwdinput" id="pwdinput"class="idpwdinput" placeholder="패스워드">
					</div>
				</div>
				
				<div id="loginbtndiv">
					<button id="loginbtn" type="submit" class="btn btn-primary"	>로그인</button>
				</div>
				
				<div class="newmemberdiv" >
					<a id="newMember" href="#">회원가입</a> / <a id="findmyid" href="#">아이디</a>,
					<a id="findmypwd" href="#">비밀번호 찾기</a>
					
					<!-- Button trigger modal -->
					<button id="newMemberbtn" type="button" data-toggle="modal"
						data-target="#newMembermodal" style="display: none"></button>
					<button id="findmyidbtn" type="button" data-toggle="modal"
						data-target="#findmyiddiv" style="display: none"></button>
					<button id="findmypwdbtn" type="button" data-toggle="modal"
						data-target="#findmypwddiv" style="display: none"></button>
					<input style="display:none;" name="returnPath" value=<%= request.getRequestURI() %>>
					<input style="display:none;" name="loginwcNo" value=<%=request.getParameter("wcNo") %>>
					<input style="display:none;" name="loginwsNo" value=<%=request.getParameter("wsNo") %>>
					
				</div>
			</form>
			
			<%	} else {%>
			<div id="myinfo">
					<div id="mynameinfo">
						<%=loginUser.getUserName()%>님
						<%	if (loginUser.getAuthority() != 3) {	%>
						<span id="alarmicon" class="badge badge-light"><%=(int) session.getAttribute("useralarm") %></span>
					
					<div id="alarmtextdiv" style="background:white; float:right; width:150%; height:80%; text-align:left; display:none;" >
						<span style="font-size:12px; ">내문의에 <%=(int) session.getAttribute("useralarm") %>개의
						<br> 답변이 있습니다.</span>		
					</div>
					<%	}	%>
					</div>	
			</div>
				
			<div id="mydetailinfo" >
				<%if(loginUser.getAuthority() != 3) {%>
					예약건수 : <span id="myreservation"><%=(int) session.getAttribute("reservationcount") %></span> /
					등급 : <span	id="mydunggul">	<%= (String) session.getAttribute("usergrade") %></span>
					<%	} else {%>
					문의개수 : <span id="qna"><%=(int)request.getSession().getAttribute("qnacount") %>	</span> /
					승인요청 : <span id="acceptalert"><%=(int)request.getSession().getAttribute("alarm") %></span>
					<%}%>
			</div>
				
				<div class="newmemberdiv">
					<a id="gomypage" href="#" >마이페이지</a> / <a id="logout"href="<%=request.getContextPath()%>/logout.me">로그아웃</a>
				</div>
		
			<%	}%>
			<div id="topkeyworddiv" style="float:right">
    		<span class="searchspan">인기 검색어 : </span>
    		<% if(search != null){ %>
				<%for(int i=0; i<search.length; i++){ %>
					<span class="searchspan"><%= search[i] %></span>
				<%} %>
			<%}%>
    </div>
	</div>
	<div id="menubar" align="center" style="width: 1300px; height: 200px;">
		<div id="maintitle">
			<br><br><br>
			<h1>공 방 신 기</h1>
		</div>
		<div id="mainlogo">
			<img src='<%=request.getContextPath()%>/resources/images/logo.jpg'
				id="logoimg" style="width: 100%; height: 100%;">
		</div>
	</div>
	<script>
			$(function(){
				$("#alarmicon").click(function(){
					if($(this).html()!=0){
						if($("#alarmtextdiv").css("display")=="block"){
							$("#alarmtextdiv").css("display","none");
						}else{
							$("#alarmtextdiv").css("display","block");
						}
					}
				});
				$(".searchspan").click(function(){
					$("#searchinput").val($(this).html());
				});			
			});
	</script>

	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">

		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="#" style="margin-left:10px; margin-right:30px;">공방신기</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="margin-left:30px;" >
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/shopList.sh">공방</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/views/classcategory/category.jsp">클래스</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/views/review/reviewList.jsp">리뷰</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/list.qna">고객센터</a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0" method="post"
				action="<%=request.getContextPath()%>/search.all" style="float:right; margin-right:0px;">
				<button class="btn btn-outline-secondary dropdown-toggle"
					id="searchtype" name="searchtype" type="button"
					style="width: 80px; margin-right: 5px;">클래스</button>
				<!-- 안보이는 밸류값  -->
				<input type="text" style="display: none;" id="searchtypeinput"
					name="searchtypeinput" value="클래스"> <input
					class="form-control mr-sm-2" type="text" placeholder="클래스를 검색해주세요."
					id="searchinput" name="searchinput">

				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>

		</div>
	</nav>

	<script>
		$(function(){
			$("#searchtype").click(function(){
				var text = $(this).html();
				if(text=="클래스"){
					
					$(this).html("공방");
					$("#searchtypeinput").val("공방");
					$("#searchinput").attr("placeholder","공방을 검색해주세요");
				}else{
					$(this).html("클래스");
					$("#searchtypeinput").val("클래스");
					$("#searchinput").attr("placeholder","클래스를 검색해주세요");
				}
			});
		});
	</script>
	
	<script>
		$(function(){
			$("#newMember").click(function(){
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
			});
			$("#logout").click(function(){
				location.href='<%=request.getContextPath()%>/logout.me';
			});
			$("#gomypage").click(function(){
				<%if (loginUser != null) {%>
				<%if (loginUser.getAuthority() == 3) {%>
					location.href='<%=request.getContextPath()%>/Admin.go';
				<%} else {%>
				    location.href="<%= request.getContextPath() %>/showReservation.nomal"
				<%} %>
				<%}%>	
			});	
		});
	</script>
	<!-- 회원가입 하는 모달 -->
	<div class="modal fade" id="newMembermodal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="width: 100%; background: beige;">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="margin-left: 45%;">회원가입</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="width: 90%;">
					<form id="insertMemberForm" method="post"
						onsubmit="return insertcheck();"
						action='<%=request.getContextPath()%>/insert.me'>
						<div id="signArea">
							<div class="textdivarea">아이디</div>
							<div class="inputdivarea">
								<input type="text" name="userId" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">비밀번호</div>
							<div class="inputdivarea">
								<input type="password" name="userPwd" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">비밀번호 확인</div>
							<div class="inputdivarea">
								<input type="password" name="userPwdCk" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">이름</div>
							<div class="inputdivarea">
								<input type="text" name="userName" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">이메일</div>
							<div class="inputdivarea">
								<input type="email" name="userEmail" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">전화번호</div>
							<div class="inputdivarea">
								<input type="text" name="userPhone" placeholder="-를 빼고 입력해주세요"
									required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">생년월일</div>
							<div class="inputdivarea">
								<input type="text" name="userBirth" placeholder="ex:19750524"
									required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">비밀번호 찾기 질문</div>
							<select class="inputdivarea" name="pwdHint">
								<option selected value="1">내 어머니의 성함은?</option>
								<option value="2">나의 출생도시는?</option>
								<option value="3">내가 졸업한 초등학교는?</option>
							</select>
							<div class="inputdivarea">
								<input type="text" name="userHint" required>
							</div>

							<div class="textdivarea">관심분야</div>
							<div id="myInterest">
								<input type="checkbox" id="inter1" value="도자기" name="interest"><label	for="inter1">도자기</label> 
								<input type="checkbox" id="inter2" value="악세서리" name="interest"><label for="inter2">악세서리</label>
								<input type="checkbox" id="inter3" value="비누" name="interest"><label for="inter3">비누</label>
								<input type="checkbox" id="inter4"value="향수" name="interest"><label for="inter4">향수</label>
								<br> 
								<input type="checkbox" id="inter5" value="목걸이"name="interest"><label for="inter5">목걸이</label>
								 <input	type="checkbox" id="inter6" value="반지" name="interest"><label for="inter6">반지</label> 
								 <input type="checkbox" id="inter7"	value="가죽" name="interest"> <label for="inter7">가죽</label>
								<input type="checkbox" id="inter8" value="기타" name="interest"><label for="inter8">기타</label> 
								<br>
							</div>
							<div class="commentarea"></div>
							<button type="submit" id="joinMemberbtn">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	$(function(){
		var useable = false;
		
		$("#insertMemberForm input[name=userPwdCk]").focusin(function(){
			$(this).focusout(function(){
				if($("#insertMemberForm input[name=userPwd]").val() != $("#insertMemberForm input[name=userPwdCk]").val()){
					$("#insertMemberForm input[name=userPwdCk]").parent().next().html("비밀번호가 일치하지 않습니다.");
				}else{
					$("#insertMemberForm input[name=userPwdCk]").parent().next().html("");
				}
			});
		});
		$("#insertMemberForm input[name=userId]").focusin(function(){
			$(this).focusout(function(){
				var userId = $(this);
				if(userId.val().length > 3){
					$(this).parent().next().html("");
					if(!useable){
						useable=true;
					$.ajax({
						url : "<%=request.getContextPath()%>/idCheck.me",
						data : {userId:userId.val()},
						type : "post",
						success : function(data){
							
							if(data=="fail"){
								$("#insertMemberForm input[name=userId]").parent().next().html("중복된 아이디입니다").css("color","red");
								userId.focus();
								useable=false;
							}else{
								if(confirm("사용 가능한 아이디입니다 사용하시겠습니까?")){
									$(this).parent().next().html("");
									useable=true;
									userId.prop("readonly",true);
									userId.css("background","lightgray");
								}else{
									userId.val("");
								}
								
							}
						}, error : function(){
							console.log("서버 통신 안됨");
						}
						
					});}
				}else{
					$(this).parent().next().html("아이디는 4글자 이상이여야 합니다.");
				}
			});
		});
	});
	$("#insertMemberForm input[name=userName]").change(function(){
		console.log($(this).val().indexOf("관리자"));
		if($(this).val().length <3){
			$(this).parent().next().html("이름은 3글자이상");
		}
		else{
			$(this).parent().next().html("");
		}
		if($(this).val().indexOf("관리자")>-1){
			$(this).parent().next().html("이 이름은 사용이불가합니다.");
		}else{
			$(this).parent().next().html("");
		}
	});
	function insertcheck(){
		var count=0;
		var check = $("#insertMemberForm .commentarea");
		for(var i =0; i<8;i++){
			if($("#inter"+(i+1)).prop("checked")){
				count++;
			}
		}
		if(count<1){
			$("#myInterest").next().html("최소 1개이상 선택해주세요");
			return false;
		}else{
			$("#myInterest").next().html("");
		}
		
		
		
		 for(var i =0; i<8; i++){
			if(check[i].innerHTML.length >0){
				console.log(check[i].innerHTML);
				check[i].focus();
				return false;
			}
		} 
		return true;
	}
	</script>
	<!-- 아이디 찾는 모달 -->
	<div class="modal fade" id="findmyiddiv" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="width: 100%; background: beige;">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="margin-left: 45%;">ID찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="width: 90%;">
					<form id="findmyidform" method="post"
						action="<%=request.getContextPath()%>/email.ck">
						<div id="signArea">
							<div class="textdivarea">이메일</div>
							<div class="inputdivarea">
								<input type="text" id="findEmail" name="findEmail" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">전화번호</div>
							<div class="inputdivarea">
								<input type="text" name="findPhone" id="findPhone"
									placeholder="-를 빼고 입력해주세요" required>
							</div>
							<div class="commentarea"></div>

							<button type="submit" id="findmyidformbtn">아이디 찾기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾는 모달 -->
	<div class="modal fade" id="findmypwddiv" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="width: 100%; background: beige;">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="margin-left: 42%;">비밀번호찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="closefindpwdbtn">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="width: 90%;">
					<form method="post">
						<div id="signArea">
							<div class="textdivarea">아이디</div>
							<div class="inputdivarea">
								<input type="text" id="findId" name="findId" required>
							</div>
							<div class="commentarea"></div>
							<div class="textdivarea">비밀번호 찾기 질문</div>
							<select class="inputdivarea" name="findcheckhint"
								id="findcheckhint">
								<option selected value="1">나의 어머니의 성함은?</option>
								<option value="2">나의 출생도시는?</option>
								<option value="3">내가 졸업한 초등학교는?</option>
							</select>
							<div class="inputdivarea">
								<input type="text" id="hintpwd" name="finduserhint" required>
							</div>
							<div class="commentarea"></div>
							<button type="button" id="findmypwdformbtn">비밀번호 찾기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<button id="changemypwdbtn" type="button" data-toggle="modal"
		data-target="#changemypwd" style="display: none"></button>
	<script>
		$(function(){
			$("#findmypwdformbtn").click(function(){
				
				var userId = $("#findId");
				var checkHint = $("#findcheckhint");
				console.log(checkHint.val());
				var userHint = $("#hintpwd");
				$.ajax({
					url : "<%=request.getContextPath()%>/findpwd.chk",
					data : {
						userId : userId.val(),
						checkHint : checkHint.val(),
						userHint : userHint.val()
					},
					type : "post",
					success : function(data) {

						if (data == "fail") {
							alert("비밀번호 찾기 질문이 틀렸거나 아이디가 없습니다.");
						} else {
							$("#changeId").val(userId.val());
							$("#closefindpwdbtn").click();
							$("#changemypwdbtn").click();

						}
					},
					error : function() {
						console.log("서버 통신 안됨");
					}

				});
			});
		});
	</script>
	<!-- ajax로 연결해야함 비밀번호 변경하는 모달 -->
	<div class="modal fade" id="changemypwd" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="width: 100%; background: beige;">
					<h5 class="modal-title" id="staticBackdropLabel"
						style="margin-left: 40%;">비밀번호 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="width: 90%;">
					<form id="changePwdForm" method="post"
						action="<%=request.getContextPath()%>/change.pwd"
						onsubmit="return checkChangePwd();">
						<div id="signArea">
							<div class="textdivarea">비밀번호</div>
							<div class="inputdivarea">
								<input type="password" id="changePwd" name="changePwd" required>
							</div>
							<input type="text" id="changeId" name="changeId"
								style="display: none;">
							<div class="commentarea"></div>
							<div class="textdivarea">비밀번호 확인</div>
							<div class="inputdivarea">
								<input type="password" id="changePwdCk" name="changePwdCk"
									required>
							</div>
							<div class="commentarea"></div>
							<button type="submit" id="changepwdformbtn">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
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
										$("#changePwdCk").parent().next().html(
												"");
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

</body>
</html>
