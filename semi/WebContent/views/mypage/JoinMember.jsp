<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">

<title>회원가입</title>

<style>
#logoimg{
        margin-top:18%;
    }
    #searchdiv{
        width:100%;
        height:50px;
        margin-top: 18%;
    }
    #searchinput{
        width: 60%;
        height: 100%;
        margin:0px;
        padding: 0px;
    }
    #searchbtn{
        width:10%;
        height:100%;
    }
    #nav >ul{
        list-style: none;
        border:1px solid red;
    }
    .nav-link{
        text-align: center;
        width:200px;
        margin-left:150px;
    }
    #logindiv{
        float: left; 
        width:24%; 
        height:100%;
        
    }
    #loginform{
        background-color: lightgrey;
        width:80%;
         height:70%;
          margin:30px; 
          margin-top:50px;
        
    }
   #loginbtn{
       font-size: 85%;
   }
#signArea-Bg {
	width: 700px;
	height: 400px;
	margin: auto;
	background: lightgray;
	border-radius: 15px;
}

#signArea {
	padding-top: 15px;
}

#userName, #pName, #pType {
	width: 100px;
	height: 20px;
	border: 2px solid darkgray;
}

#userId, #pAdd {
	width: 300px;
	height: 20px;
	border: 2px solid darkgray;
}

#userPwd, #userPwdCk, #pNum {
	height: 20px;
	border: 2px solid darkgray;
}

.phoneNum  {
	width: 60px;
	height: 20px;
	border: 2px solid darkgray;
}

#nomalShow, #businessShow {
	display: none;
}

#n {
	margin-left: 150px;
	display: inline-block;
}

#b {
	display: inline-block;
	float: right;
	margin-right: 150px;
}

.r {
	width: 15px;
	height: 15px;
}
.join{
	width: 88px;
	height: 30px;
	background: darkgray;
	border : 3px double gray;
	text-align: center;
	border-radius: 15px;
	margin-left:10px; 
}
</style>

</head>

<body>
<div id="menubar" style="width:1300px; height:300px">
        <div id="mainlogo" style="width:14%; height:100%; float: left; margin-right:40px; margin-left:30px;">
            <img src="../4_JQuery/image/cute1.gif" id="logoimg" style="width:100%; height:70%">
        </div>
        <div id="middlediv" style="float: left; width:54%; height: 100%; margin-right:30px;">
            <div id="searchdiv">
                <input type="text" placeholder="공방을 검색해주세요." id="searchinput"style="margin-left:80px;margin-right:20px;"> 
                <button type="button" id="searchbtn">검색</button>
            </div>
        </div>
        <div id="logindiv">
            <form id="loginform" method="post" >
                <div id="idpwddiv" style="width:63%; height:60%; float: left; margin:5%; margin-right:2%;">
                    <div id="iddiv" style="width:90%; height:40%; margin:5%; ">
                        <input type="text" id="idinput" style="width:100%; height:100%;">
                    </div>
                    <div id="pwddiv"style="width:90%; height:40%; margin:5%;">
                        <input type="password" id="pwdinput" style="width:100%; height:100%;">
                    </div>
                </div>
                <div id="loginbtndiv"style="width:25%;height:60%; float: left; margin:5%; margin-left:0%;">
                    <button id="loginbtn" type="submit" style="width:100%; height:89%; margin-bottom:5%; margin-top:10%;" >로그인</button>
                </div>
                <div id="newmemberdiv">
                        &nbsp;&nbsp;<a href="">회원가입</a> / <a href="">아이디</a>, <a href="">비밀번호</a>찾기
                    <!-- if 문 추가하기 -->
                </div>
            </form>

        </div>
    </div>
    <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link" href="#">공방</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">리뷰</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">고객센터</a>
            </li>
          </ul>

<br><br><br>
	<div id="signArea-Bg">

		<form>

			<div id="signArea">
				<table>
					<tr>
						<td>이름 :</td>
						<td><input type="text" id="userName"></td>
					</tr>
					<tr>
						<td>아이디(이메일) :</td>
						<td><input type="email" id="userId"></td>
					</tr>
					<tr>
						<td>비밀번호 :</td>
						<td><input type="password" id="userPwd"></td>
					</tr>
					<tr>
						<td>비밀번호 확인 :</td>
						<td><input type="password" id="userPwdCk"></td>
					</tr>
					<tr>
						<td>전화번호 :</td>
						<td><input type="text" size="3" class="phoneNum">-<input
							type="text" size="4" class="phoneNum">-<input type="text"
							size="4" class="phoneNum"></td>
					</tr>
				</table>
				<br>
				<div id="n">
					<input type="radio" name="selMem" id="nck" class="r" checked>일반 회원가입
				</div>

				<div id="b">
					<input type="radio" name="selMem" id="bck" class="r">사업자
					회원가입
				</div>

				<hr>

				<div id="nomalShow">
					<h5>관심분야</h5>
					<input type="checkbox" name="도자기"><label>도자기</label> <input
						type="checkbox" name="액세서리"><label>액세서리</label> <input
						type="checkbox" name="가구"><label>가구</label> <input
						type="checkbox" name="향수"><label>향수</label> <br> <input
						type="checkbox" name="제과"><label>제과</label> <input
						type="checkbox" name="원예"><label>원예</label> <input
						type="checkbox" name="가죽"><label>가죽</label> <input
						type="checkbox" name="기타"><label>기타</label>
						<br> <br>
					<button type="submit" class="join">가입하기</button>
				</div>


				<div id="businessShow">
					<table>
						<tr>
							<td>공방 이름 :</td>
							<td><input type="text" id="pName"></td>
						</tr>
						<tr>
							<td>공방 주소 :</td>
							<td><input type="text" id="pAdd"></td>
						</tr>
						<tr>
							<td>공방 카테고리 :</td>
							<td><select id="pType">
									<option>-----</option>
									<option>도자기</option>
									<option>액세서리</option>
									<option>가구</option>
									<option>제과</option>
									<option>원예</option>
									<option>가죽</option>
									<option>기타</option>
							</select></td>
						</tr>
						<tr>
							<td>사업자 인증 번호 :</td>
							<td><input type="text" id="pNum"></td>
						</tr>
					</table> <br>
					<button type="submit" class="join">가입하기</button>
				</div>

				<script>
				
					$(function() {
						$("#n").click(function() {
							if ($("#nck").attr("checked", true)) {
								$("#nomalShow").css("display", "block");
								$("#businessShow").css("display", "none");
								// 선택 될 경우 사업자 입력 삭제
							}
						});
						$("#b").click(function() {
							if ($("#bck").attr("checked", true)) {
								$("#businessShow").css("display", "block");
								$("#nomalShow").css("display", "none");
								// 선택 될 경우 일반회원 입력 삭제
							}
						});
					});
				</script>
			</div>

		</form>

	</div>



</body>

</html>