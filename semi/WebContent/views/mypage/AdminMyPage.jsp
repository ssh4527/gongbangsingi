<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="main.css" />
<script src="main.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#adminpage_maindiv {
	width: 1300px;
	min-height: 600px;
}

aside {
	width: 16%;
	height: 97%;
	float: left;
	
	margin: 1%;
	text-align: center;
}

#menu>li {
	margin-top: 30px;
	margin-bottom: 30px;
}

#menu>li>a {
	text-decoration: none;
	color: blueviolet;
	
}

section {
	margin: 1%;
	width: 75%;
	height: 97%;
	float: left;
}

.textalign {
	text-align: center;
}

aside>button {
	display: none;
}

#change {
	margin-left: 90%;
}

.table {
	width: 70%;
	margin: auto;
	margin-top: 30px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="adminpage_maindiv">
		<aside>
			<ul id="menu">
				<li><a href="#" id="accept1">사업회원가입승인</a></li>
				<li><a href="#" id="accept2">공방상세정보승인</a></li>
				<li><a href="#" id="accept3">클래스승인</a></li>
				<li><a href="#" id="accept4">수입통계</a></li>
			</ul>
			<button type="button" id="acceptbtn1"></button>
			<button type="button" id="acceptbtn2"></button>
			<button type="button" id="acceptbtn3"></button>

		</aside>
		
		<script>
			$(function() {
				$("#accept1").click(function() {
					$("#acceptbtn1").click();
				})
				$("#acceptbtn1").click(function() {
					$("#accepttable1").css("display", "table");
					$("#accepttable2").css("display","none");
					$("#accepttable3").css("display","none");
				});
				$("#accept2").click(function() {
					$("#acceptbtn2").click();
				})
				$("#acceptbtn2").click(function() {
					$("#accepttable2").css("display", "table");
					$("#accepttable1").css("display","none");
					$("#accepttable3").css("display","none");
				});
				$("#accept3").click(function() {
					$("#acceptbtn3").click();
				})
				$("#acceptbtn3").click(function() {
					$("#accepttable3").css("display", "table");
					$("#accepttable2").css("display","none");
					$("#accepttable1").css("display","none");
				});

			});
		</script>
		<div style="width:0px; min-height:600px; border:0.5px solid lightgrey; float:left;"></div>
		<section>
			<table class="table" id="accepttable1" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign">회원아이디</th>
						<th scope="col" class="textalign">사업자명</th>
						<th scope="col" class="textalign">사업자등록번호</th>
						<th scope="col" class="textalign">가입승인여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="textalign">tdsfs23</th>
						<td class="textalign">신승환</td>
						<td class="textalign">010-546532-554</td>
						<td class="textalign"><input type="radio" name="enroll1"
							value="y">&nbsp;Y <!-- name속성값 받아와서 각자 지정해줘야함-->
							&nbsp;&nbsp; <input type="radio" name="enroll1" value="n">&nbsp;N
						</td>
					</tr>

				</tbody>
			</table>

			<table class="table" id="accepttable2" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign">회원아이디</th>
						<th scope="col" class="textalign">공방이름</th>
						<th scope="col" class="textalign">공방 카테고리</th>
						<th scope="col" class="textalign">페이지승인여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="textalign">tdsfs23</th>
						<td class="textalign">스타일디쉬</td>
						<td class="textalign">도작;</td>
						<td class="textalign"><input type="radio" name="enroll1"
							value="y">&nbsp;Y <!-- name속성값 받아와서 각자 지정해줘야함-->
							&nbsp;&nbsp; <input type="radio" name="enroll1" value="n">&nbsp;N
						</td>
					</tr>

				</tbody>
			</table>
			<table class="table" id="accepttable3" style="display: none;">
				<thead>
					<tr>
						<th scope="col" class="textalign">공방아이디</th>
						<th scope="col" class="textalign">클래스명</th>
						<th scope="col" class="textalign">카테고리</th>
						<th scope="col" class="textalign">페이지승인여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="textalign">tdsfs23</th>
						<td class="textalign">도자기 만들기</td>
						<td class="textalign">도자기</td>
						<td class="textalign"><input type="radio" name="enroll1"
							value="y">&nbsp;Y <!-- name속성값 받아와서 각자 지정해줘야함-->
							&nbsp;&nbsp; <input type="radio" name="enroll1" value="n">&nbsp;N
						</td>
					</tr>

				</tbody>
			</table>

		</section>

	</div>
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>
