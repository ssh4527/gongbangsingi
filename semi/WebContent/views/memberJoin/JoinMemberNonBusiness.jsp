<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style>
.r {
	width: 15px;
}

#email, #name, #pass, #pass1, #userid {
	width: 200px;
	height: 25px;
}

#tel1, #tel2, #tel3 {
	width: 55px;
}

#ttt {
	text-decoration: none;
}

#log {
	margin-top: 8px;
}

#pwd {
	margin-top: 2px;
}

#find {
	color: black;
	font-size: 11px;
	text-decoration: none;
	text-align: left;
}

#wrap {
	border: 1px solid lightgray;
	width: 600px;
	height: 650px;
	padding-top: 15px;
	background: lightgray;
	border: 3px dashed gray;
	border-radius: 15px;
}

#join {
	font-size: 11px;
}

#login_p1 {
	text-align: center;
	font-weight: bolder;
}

#login_p2 {
	text-align: center;
	color: gray;
	font-size: 14px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

#joinin {
	border-collapse: separate;
	border-spacing: 30px;
	margin-left: 60px;
}

#nomalShow {
	text-align: center;
	margin-top: 40px;
}

#businessShow {
	margin-left: 130px;
	margin-top: 20px;
}

#bt2 {
	margin-left: 100px;
}

h1 {
	text-align: center;
}
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}
.hr-sect::before,
.hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>
</head>
<body>

	<section id="joinMemberWrap">
		<div class="container" id="wrap">
			<!-- 회원가입 폼 -->
			<form action="" method="post" onsubmit="return validate()";>
				<h1>JOIN</h1>
				<table id="joinin">
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>

					<tr>
						<td>아이디(이메일)</td>
						<td><input type="email" name="email" id="email"></td>
					</tr>

					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass" id="pass">
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pass1" id="pass1"></td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td><input type="text" name="tel1" id="tel1" maxlength="3">
							- <input type="text" name="tel2" id="tel2" maxlength="4">
							- <input type="text" name="tel3" id="tel3" maxlength="4">
						</td>
					</tr>
				</table>
				<!-- <p>JOIN</p>
				<label>이름 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br> <br>
				<label>아이디(이메일) </label> <br>
				<br> <label for="pass">비밀번호 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br> <br>
				<label for="pass1">비밀번호 확인 </label>&nbsp; <br> <br> <label
					for="tel1">전화번호 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <br>
				<br> <br> -->

				<div id="nomalShow">
					<div class="hr-sect">관심분야</div>
					<input type="checkbox" name="도자기" class="ckb"><label>도자기</label>
					<input type="checkbox" name="액세서리" class="ckb"><label>액세서리</label>
					<input type="checkbox" name="가구" class="ckb"><label>가구</label>
					<input type="checkbox" name="향수" class="ckb"><label>향수</label>
					<br> <input type="checkbox" name="제과" class="ckb"><label>제과</label>
					<input type="checkbox" name="원예" class="ckb"><label>원예</label>
					<input type="checkbox" name="가죽" class="ckb"><label>가죽</label>
					<input type="checkbox" name="기타" class="ckb"><label>기타</label>
					<br> <br>
					<!-- ----------------------------------------------------------------- -->
					<input type="submit" class="btn btn-outline-secondary" value="가입하기">
					<!-- ----------------------------------------------------------------- -->
				</div>
		</div>
		</form>

		<script>
				function validate() {
					// 이름 검사
					// 한글 2글자 이상만 가능
					// "한글로 2글자 이상 입력"
					var name = document.getElementById('name');
					if (!chk(/^[가-힣]{2,}$/, name, "한글로 2글자 이상을 넣으세요~"))
						return false;

					// 이메일 검사
					// -> input 태그 type="email"로 하면 자동으로 검사
					// 4글자 이상 @ 1글자 이상 . 1~3글자
					// "이메일 형식에 어긋납니다"
					var email = document.getElementById('email');
					if (!chk(/^[\w]{4,}@[\w]+\.[\w]{1,3}$/, email,
							"이메일 형식에 어긋납니다."))
						return false;

					var pass = document.getElementById("pass");
					var pass1 = document.getElementById("pass1");

					// 반드시 영문 대소문자, 숫자, 특수문자 포함하여 8 자리 이상
					// ?= : 문자열을 전방부터 쭉 검사함
					if (!chk(
							/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣]).{8,}/,
							pass, "영문 대소문자, 숫자, 특수문자 반드시 포함"))
						return false;

					// 비밀번호 확인 검사
					if (pass.value != pass1.value) {
						alert('비밀번호 일치하지 않습니다.!');
						return false;
					}

					// 전화번호 검사
					// 전화번호 앞자리는 3자리 숫자, 두번째 자리는 3~4자리 숫자
					// 세번째 자리는 4자리 숫자
					// "전화번호 자리수가 잘못되었습니다"
					var tel1 = document.getElementById('tel1');
					var tel2 = document.getElementById('tel2');
					var tel3 = document.getElementById('tel3');
					if (!chk(/^01[01679]$/, tel1, "올바른 번호 입력"))
						return false;
					if (!chk(/^[0-9]{3,}$/, tel2, "번호 3자리 이상 입력"))
						return false;
					if (!chk(/^[0-9]{4}$/, tel3, "4자리 번호 입력"))
						return false;
				}

				function chk(re, e, msg) { //정규식, element, 메세지
					if (re.test(e.value)) {
						return true;
					}

					else {
						alert(msg);
						e.value = "";
						e.focus();
						return false;
					}

				}
				});
			</script>
		</div>
	</section>

</body>
</html>