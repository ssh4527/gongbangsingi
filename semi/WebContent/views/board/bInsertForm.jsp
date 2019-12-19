<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String today = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>




<!--  ★문의글 쓰기(고객센터/공방)★ -->
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#qna4_wrap {
	width: 1300px;
	height: 900px;
	margin: auto;
}

#qna4_wrap2 {
	text-align: center;
}

.font {
	font-size: 30px;
	color: black;
	margin-left: 40%;
}

.font_underline {
	color: #fbd6db;
}

#titleImgArea, #contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 150px;
	height: 100px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover,
	#contentImgArea3:hover {
	cursor: pointer;
}
</style>
<script>
	/* if($('input:radio[name=secret]').is(':checked')){
	 	  $('input[name="secret"]').val(['Y']);
	 } else {
		 $('input[name="secret"]').val(['N']);
	 } */
	function addFile() {
		$("input:button:eq(1)").after("<br><input type=file>");
	}
	function delFile() {
		$("input:file:last").remove();
		$("br:last").remove();
	}

	function pass() {
		var bpwd = document.getElementById('password');
		if (!chk(/^[0-9]{4}$/, bpwd, "비밀번호는 숫자 4자리 입력해주세요!"))
			return false;
		function chk(re, e, msg) { //정규식, element, 메세지
			if (re.test(e.value)) {
				document.form.submit();
				return true;
			} else {
				alert(msg);
				e.value = "";
				e.focus();
				return false;
			}
		}
	}
</script>

</head>

<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div id="qna4_wrap">
		<br>

		<!-- <table class="table table-dark table-striped"> -->

		<font class="font_underline"> <u><p class="font">
					문의글 작성하기<br>
				</p></u>
		</font> <br>
		<form action="<%=request.getContextPath()%>/insert.qna" name="form" method="post">
			<table class="table table-hover">
				<tr>
					<th>문의</th>
					<th colspan="5">고객센터문의 <공방 (클래스) 관련 문의는 각 공방(클래스) 페이지에서 해주세요></th>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><textarea name="title" cols="30" rows="1"
							style="resize: none" placeholder="제목을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<%
							if (loginUser == null) {
						%> <input name="writer" type="text" value="비회원"> <%
 						} else {
 							%> <input name="writer" type="text"
						value="<%=loginUser.getUserName()%>" readonly> <%
 						}
 						%>
					</td>
					<th>작성일</th>
					<td><input type="text" name="date" value="<%=today%>"></td>

					<%-- <th>비밀번호</th>
					<td><% if(loginUser==null){%> <input name="password" type="password" id="password" placeholder="숫자 4자리 입력" maxlength="4" > 
					<%} else{ %>
					<input name="password" type="password" id="password" placeholder="비회원만 비밀번호입력" readonly> <%}%>
					</td> --%>
					<th>비밀번호</th>
					<td><input type="password" name="password" id="password"
						placeholder="숫자 4자리 입력" maxlength="4"></td>
					<th>비밀글 설정</th>
					<td><input type="radio" value="true" name="secret"
						id="private"> <label for="private"> <img src="../../img/111.jpg" width="30px" height="30px"></label> &nbsp;
						<input type="radio" value="false" name="secret" id="public"
						checked> <label for="public"><img src="../../img/222.jpg" width="30px" height="30px"></label></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea name="content" cols="115" rows="10"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<div id="titleImgArea">
							<img id="titleImg" width="150" height="100">
						</div>
					</td>
					<td>
						<div id="contentImgArea1">
							<img id="contentImg1" width="150" height="100">
						</div>
					</td>
					<td>
						<div id="contentImgArea2">
							<img id="contentImg2" width="150" height="100">
						</div>
					</td>
					<td>
						<div id="contentImgArea3">
							<img id="contentImg3" width="150" height="100">
						</div>
					</td>
				</tr>
			</table>

			<!-- 파일 업로드 하는 부분 -->
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" name="thumbnailImg1"
					onchange="loadImg(this,1)"> <input type="file"
					id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
				<input type="file" id="thumbnailImg3" name="thumbnailImg3"
					onchange="loadImg(this,3)"> <input type="file"
					id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4)">
			</div>
			<hr>

			<script>
				// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정
				$(function() {
					$("#fileArea").hide();

					$("#titleImgArea").click(function() {
						$("#thumbnailImg1").click();
					});

					$("#contentImgArea1").click(function() {
						$("#thumbnailImg2").click();
					});

					$("#contentImgArea2").click(function() {
						$("#thumbnailImg3").click();
					});

					$("#contentImgArea3").click(function() {
						$("#thumbnailImg4").click();
					});
				});

				// 파일을 첨부했을 때 미리보기 공간에 이미지를 출력
				function loadImg(value, num) {
					// value => input type="file"
					// num => 조건문을 통해 미리보기 div 지정
					// file이 존재하는지 조건문
					if (value.files && value.files[0]) {
						// 파일을 읽어 들일 FileReader 객체 생성
						var reader = new FileReader();

						// 파일 읽기가 완료 되었을 때 실행 되는 메소드 설정
						reader.onload = function(e) {
							switch (num) {
							case 1:
								$("#titleImg").attr("src", e.target.result);
								break;
							case 2:
								$("#contentImg1").attr("src", e.target.result);
								break;
							case 3:
								$("#contentImg2").attr("src", e.target.result);
								break;
							case 4:
								$("#contentImg3").attr("src", e.target.result);
								break;
							}

						}
						// 파일 읽기 하는 메소드
						reader.readAsDataURL(value.files[0]);
					}
				}
			</script>
	</div>
	

	<div id="qna4_wrap2">
		<!-- <button type="submit" class="btn btn-outline-secondary" onclick="b_pass();">WRITE</button> -->
		<input type="button" class="btn btn-outline-secondary" value="WRITE"
			onclick="pass()" /> <input type="button"
			class="btn btn-outline-secondary" value="CANCEL"
			onclick="javascript:history.back();">
		</form>
	</div>

	<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>