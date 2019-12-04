<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★리뷰 작성하는 페이지★ -->
<meta charset="UTF-8">
<title>리뷰작성</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}

#review2_wrap {
	width: 1000px;
	height: 900px;
	margin: auto;
}

#review2_wrap2, h3 {
	text-align: center;
}
</style>
</head>
<body>
<body>

	<div id="review2_wrap">
		<br> <br>
		<h3>리뷰 작성하기</h3>
		<br>
		<!-- <table class="table table-dark table-striped"> -->
		<table class="table table-hover">
			<tr>
				<th>제목</th>
				<td><textarea cols="30" rows="1" style="resize: none"
						placeholder="제목을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
					<div class="starRev">
						<span class="starR on">별1</span> 
						<span class="starR">별2</span> 
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</div>
				</td>
				<script type="text/javascript">
					$('.starRev span').click(function() {
						$(this).parent().children('span').removeClass('on');
						$(this).addClass('on').prevAll('span').addClass('on');
						return false;
					});
				</script>
			<tr>
				<th>내용</th>
				<td><textarea cols="60" rows="8" style="resize: none"
						placeholder="내용을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file"> <input type="button" value="추가"
					onclick="addFile()"> <input type="button" value="삭제"
					onclick="delFile()"></td>
			<tr>
		</table>
		<hr>


		<script>
			function addFile() {
				$("input:last").after("<br><input type=file>");
			}
			function delFile() {
				$("input:file:last").remove();
				$("br:last").remove();
			}
		</script>

		<div id="review2_wrap2">
			<button type="button" class="btn btn-outline-secondary">WRITE</button>
			<button type="button" class="btn btn-outline-secondary">CANCEL</button>
		</div>

		<script type="text/javascript">
			function oneCheckbox(a) {

				var obj = document.getElementsByName("score");

				for (var i = 0; i < obj.length; i++) {

					if (obj[i] != a) {

						obj[i].checked = false;

					}

				}

			}
		</script>
</body>
</html>