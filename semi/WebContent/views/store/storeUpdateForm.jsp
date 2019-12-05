<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
section, div, header {
	box-sizing: border-box;
	display: block;
}

#outer {
	width: 1000px;
	height: 1500px;
	/* div를 화면 가운데로 오게 하기 */
	margin: auto;
	padding: 3%;
}

/* #content_first {
	height: 30%;
	width: 100%;
} */

/* #imageEnr {
	border-top: 1px solid black;
	float: left;
	width: 100%;
	height: 10%;
} */

#intro2_second {
	border-top: 1px solid black;
	padding: 2%;
}
/* 
#content_finish {
	text-align: right;
	width: 100%;
	height: 20%;
}

#intro1 {
	text-align: center;
	width: 40%;
	float: left;
	height: 100%;
	border-right: 1px solid black;
}
#introl1_1 {
	float: left;
	width: 100%;
	height: 80%;
	padding: 10px;
	border : 1px solid black;
} */

/* #introl1_2 {
	float: left;
	width: 100%;
	height: 20%;
	padding: 10px;
} */

/* #intro2 {
	border: 1px solid black;
}

#classEdit {
	padding: 5%;
	text-align: center;
	float: left;
	height: 70%;
	width: 60%;
}
 */
.thumbnail {
	border: 2px solid lightgray;
	width: 350px;
	height: 200px;
}
h5{
display:inline-block}
</style>
</head>
<body>
	<div id="outer">
		<section id="content_first">
			<section id="intro1">
			<h5>* 프로필 사진 :</h5> 
			<input type="file" id="imgfile1" name="imgfile1"
							onchange="preview(this,1)">
				 프로필 이미지는 가로 161px 섬네일로 생성됩니다.
			<div id="thumbnail1" class="thumbnail"></div>
					<!-- <div id="files" style="display: none;">
						<input type="file" id="imgfile1" name="imgfile1"
							onchange="preview(this,1)">
					</div> -->
					
			<!-- 	<section id="intro1_1">
					<div id="thumbnail1" class="thumbnail">클릭하여 프로필 사진을 선택하세요</div>
					<div id="files" style="display: none;">
						<input type="file" id="imgfile1" name="imgfile1"
							onchange="preview(this,1)">
					</div>
					<p id="storeName">공방 이름</p>
					<div id="storeIntro">
						<textarea rows="6" cols="40" placeholder="공방 소개글을 작성하세요"></textarea>
					</div>
				</section> -->
				<!-- <br>
				<br>
				<br>
				<section id="introl1_2">
					<div id="intro2">
						<p id="addr">주소</p>
						<p id="phone">전화번호</p>
						<p id="sns">sns 계정</p>
					</div>
				</section> -->
			</section>
			
			<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
				/* 	$(function() {
						$("#files").hide();
						$("#thumbnail1").hide();
						$("#thumbnail1").click(function() {
							$("#imgfile1").click();
						});
					}); */
					function preview(value, num) {
						// value => input type="file"
						// num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

						// file이 존재하는지 조건문
						if (value.files && value.files[0]) {
							// 파일을 읽어들일 FileReader 객체 생성
							var reader = new FileReader();

							// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
							reader.readAsDataURL(value.files[0]);

							// 파일 읽기가 다 완료되었을 때 실행되는 메소드
							reader.onload = function(e) {
								$("#thumbnail" + num)
										.html(
												"<img src=" + reader.result + " width=350 height=200>");
							}
						}
					}
				</script>

		

		</section>

<br><br>
		<section id="intro2_second">
			<h4>&lt;공방 소개 글 &gt;</h4>
			<textarea rows="10" cols="130" placeholder="공방 소개글을 작성하세요"></textarea>
		</section>

		<!-- <section id="imageEnr">
			<p>* 공방 사진 등록: 여러 사진을 선택할 시 슬라이드 사진으로 보이게 됩니다.^^*</p>
			<input type="file"> <input type="button" value="추가"
				onclick="addFile();">
		</section>
		<script>
				function addFile() {
					$('<input type="file">').insertAfter('input[value="추가"]')
							.css("display", "block");
				}
			</script> -->

		<section id="content_finish">
			<button id="enroll" class="btn btn-outline-secondary">등록하기</button> &nbsp;
			<button id="delete" class="btn btn-outline-secondary">취소하기</button>
		</section>
	</div>

</body>
</html>


