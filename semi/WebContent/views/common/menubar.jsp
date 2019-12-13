<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
	
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	String loginmsg = (String) request.getAttribute("loginmsg");
	String msg = (String) session.getAttribute("msg");
%>
<html>
<head>

<meta charset="utf-8" />

<title>공방신기에 오신걸 환영합니다.</title>


<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
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
}

* {
	 font-family: 'Nanum Pen Script', cursive; 
	
	font-size: large;
	
}

#logoimg {
	margin-top: 18%;
}

#searchdiv {
	width: 100%;
	height: 150px;
	margin-top:130px;
	
}

#searchinput {
	width: 60%;
	height: 50px;
	margin: 0px;
	padding: 0px;
	margin-left: 10px;
	margin-right: 10px;
	float: left
}

#searchbtn {
	width: 10%;
	height: 50px;
}

#nav>ul {
	list-style: none;
}

.nav-item {
	width: 15%;
	margin-left: 5%;
	margin-right: 5%;
	height: 80px;
}

.nav-link {
	text-align: center;
	width: 100%;
	height: 100%;
	line-height: 50px;
}

#logindiv {
	float: left;
	width: 24%;
	height: 70%;
	margin-top: 50px;
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

#newMember, #gomypage {
	margin-left: 42px;
}

.idpwdinputouter {
	width: 90%;
	height: 40%;
	margin: 5%;
}

.idpwdinput {
	width: 100%;
	height: 100%;
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
	<div id="menubar" style="width: 1300px; height: 300px;">
		<div id="mainlogo"
			style="width: 18%; height: 80%; float: left; margin-right: 20px; margin-left: 30px;">
			<img src='<%=request.getContextPath()%>/resources/images/logo.jpg'
				id="logoimg" style="width: 100%; height: 80%; margin-top: 30%;">
		</div>
		<div id="middlediv"
			style="float: left; width: 54%; height: 100%; margin-right: 0px;" >
			<form method="post" action="<%=request.getContextPath()%>/search.all" >
				<div class="input-group mb-3" id="searchdiv" >
    				<button class="btn btn-outline-secondary dropdown-toggle"id="searchtype"name="searchtype" type="button" style="height:50px; width:71px;margin-left:50px;" >클래스</button>
  					<input type="text"style="display:none;" id="searchtypeinput" name="searchtypeinput" value="클래스">
  					<input type="text"placeholder="클래스를 검색해주세요."
						id="searchinput" name="searchinput" >
  					<button type="submit" class="btn btn-outline-success"
						id="searchbtn">검색</button> 
					
					<div style="width: 70%; height: 50px;margin-top:-50px; margin-left: 150px; ">
						<span class="searchspan">인기 검색어 : </span> <span class="searchspan">도자기</span>
						<span class="searchspan">반지</span> <span class="searchspan">악세사리</span>
					<!-- span 태그에 온클릭 달아서 눌르면 그 단어로 검색되게 펑션처리 해야함-->
					</div>
				</div>
				
			</form>
		</div>
		
		
		<div id="logindiv">
			<%
				if (loginUser == null) {
			%>
			<form id="loginform" action="<%=request.getContextPath()%>/login.me"
				method="post">
				<!-- onsubmit="return validate();" -->
				<div id="idpwddiv"
					style="width: 63%; height: 60%; float: left; margin: 5%; margin-right: 2%;">
					<div id="iddiv" class="idpwdinputouter">
						<input type="text" name="idinput" id="idinput" class="idpwdinput"
							placeholder="아이디">
					</div>
					<div id="pwddiv" class="idpwdinputouter">
						<input type="password" name="pwdinput" id="pwdinput"
							class="idpwdinput" placeholder="패스워드">
					</div>
				</div>
				<div id="loginbtndiv"
					style="width: 25%; height: 60%; float: left; margin: 5%; margin-left: 0%;">
					<button id="loginbtn" type="submit" class="btn btn-primary"
						style="width: 100%; height: 89%; margin-bottom: 5%; margin-top: 10%;">로그인</button>
				</div>
				<div id="newmemberdiv" style="background-color: lightgrey;">
					<a id="newMember" href="#">회원가입</a> / <a id="findmyid" href="#">아이디</a>,
					<a id="findmypwd" href="#">비밀번호 찾기</a>
					<!-- Button trigger modal -->
					<button id="newMemberbtn" type="button" data-toggle="modal"
						data-target="#newMembermodal" style="display: none"></button>
					<button id="findmyidbtn" type="button" data-toggle="modal"
						data-target="#findmyiddiv" style="display: none"></button>
					<button id="findmypwdbtn" type="button" data-toggle="modal"
						data-target="#findmypwddiv" style="display: none"></button>
				</div>
			</form>
			<%
				} else {
			%>
			<div id="userdiv">
				<div id="usericon">
					<div id="alarmicon">1</div>
				</div>
				<div
					style="text-align: center; width: 45%; height: 30%; margin-left: 8%; margin-top: 8%; float: left; background-color: lightgrey;">

					<div>
						<%=loginUser.getUserName()%>님 <br>
						<%
							if (loginUser.getAuthority() != 3) {
						%>
						예약건수 : <span id="myreservation">2</span><br> 나의 등급 : <span
							id="mydunggul">Pt</span>
						<!-- 포인트 등급으로 if문처리 -->
						<%
							} else {
						%>
						문의개수 : <span id="qna"> 2</span><br> 승인요청 : <span
							id="acceptalert">3</span>
						<%
							}
						%>
					</div>
				</div>
				<div id="testinfo"
					style="float: left; background-color: lightgrey; width: 80%; margin: 10%; margin-top: 5%;">
					<a id="gomypage" href="#">마이페이지</a><a id="logout"
						href="<%=request.getContextPath()%>/logout.me">로그아웃</a>

				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
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
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/shopList.sh">공방</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/views/classcategory/category.jsp">클래스</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/views/review/reviewList.jsp">리뷰</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/views/notice/board.jsp">고객센터</a></li>
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
			});
			$("#logout").click(function(){
				location.href='<%=request.getContextPath()%>/logout.me';
			});
			$("#gomypage").click(function(){
				
				<%if (loginUser != null) {%>
				<%if (loginUser.getAuthority() == 3) {%>
					location.href='<%=request.getContextPath()%>/Admin.go';
				<%} else if (loginUser.getAuthority() == 2) {%>
					
				<%} else {%>
					
				<%}
			}%>
				 
				
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
								<input type="checkbox" id="inter3" value="가구" name="interest"><label for="inter3">가구</label>
								<input type="checkbox" id="inter4"value="향수" name="interest"><label for="inter4">향수</label>
								<br> 
								<input type="checkbox" id="inter5" value="제과"name="interest"><label for="inter5">제과</label>
								 <input	type="checkbox" id="inter6" value="원예" name="interest"><label for="inter6">원예</label> 
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
