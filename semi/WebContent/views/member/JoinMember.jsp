<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">

<title>회원가입</title>

<style>
body{
	margin:auto;
}

#signArea-Bg {
	width: 700px;
	height: 650px;
	margin: auto;
	margin-top:5px;
	background: lightgray;
	border-radius: 15px;
}

#signArea {
	padding-top: 15px;
	width:100%;
}
#userInfoTable{
	width:70%;
	margin:auto;
}
.textdivarea{
	width:50%;
	margin:auto;
	text-align:left;
	font-size:0.9em;
}
.inputdivarea{
	width:50%;
	margin:auto;
	height:40px;
}
.commentarea{
	width: 50%;
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
	width:50%;
	margin:auto;
	border:1px solid grey;
}
#joinMemberbtn{
	width: 50%;
	height: 40px;
	background: darkgray;
	border : 3px double gray;
	text-align: center;
	border-radius: 5px;
	margin-top:15px;
	
}
</style>

</head>

<body>
	
	<div id="signArea-Bg" style="text-align:center;">
		<h1>회원가입</h1>
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
				<div class="textdivarea">전화번호</div>
				<div class="inputdivarea"><input type="text" id="userPhone" placeholder="-를 빼고 입력해주세요"></div>
				<div class="commentarea"></div>
				<div class="textdivarea">생년월일</div>
				<div class="inputdivarea"><input type="text" id="userBirth" placeholder="ex:19750524"></div>
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


	
</body>

</html>