<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String today = sdf.format(date);

	String wcNo = request.getParameter("wcNo");
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
</style>
</head>
<body>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<form action="<%=request.getContextPath()%>/insert.re" method="post" enctype="multipart/form-data">
		<div id="qna4_wrap">
			<br> <br>
			<!-- <table class="table table-dark table-striped"> -->
			<h3 align="center">R E V I E W</h3>
			<br>
			<table class="table table-hover">
				<tr>
					<th>문의</th>
					<th colspan="5">클래스 문의 &lt; 운영 관련 문의는 고객센터 페이지를 이용해주세요 &gt;</th>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><textarea name="title" cols="60" rows="1"
							style="resize: none" placeholder="제목을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td width=20%;><p><%=loginUser.getUserId()%></p></td>
					<th>작성일</th>
					<td><p id="date"><%=today%></p></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr id="grade">
					<th width="10%">평점</th>
					<td width="18%"><input type="radio" name="grade" id="grade1" value="1" 
						checked><label for="grade1" style="cursor:pointer;">★☆☆☆☆</label></td>
					<td width="18%"><input type="radio" name="grade" id="grade2" value="2"><label for="grade2" style="cursor:pointer;">★★☆☆☆</label></td>
					<td width="18%"><input type="radio" name="grade" id="grade3" value="3"><label for="grade3" style="cursor:pointer;">★★★☆☆</label></td>
					<td width="18%"><input type="radio" name="grade" id="grade4" value="4"><label for="grade4" style="cursor:pointer;">★★★★☆</label></td>
					<td width="18%"><input type="radio" name="grade" id="grade5" value="5"><label for="grade5" style="cursor:pointer;">★★★★★</label></td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea name="content" cols="115" rows="10"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name='img1' onchange="uploadImg(this,1)"> <input
						type="button" value="추가" onclick="addFile()"> <input
						type="button" value="삭제" onclick="delFile()" id="addfilebtn">
					</td>
				<tr>
			</table>
			<hr>
			<input type="text" name="lastgrade" id="lastgrade"
				style="display: none;" value="1"> <input type="text"
				name="wcNo" id="wcNo" value="<%=wcNo%>" style="display: none;">
			<input type="text" name="user" id="user" value="<%=loginUser.getUserId()%>"
				style="display: none;">
			<div id="imgArea">
				<img id="titleImg1" style="display:none;">
				<img id="titleImg2" style="display:none;">
				<img id="titleImg3" style="display:none;">
			</div>

			<script>
				var count = 0;

				$(function() {
					$("#fileArea").hide();
					
					$(":input:radio[name=grade]").click(function() {
						var st = $(":input:radio[name=grade]:checked").val();
						console.log(st);
						$("#lastgrade").val(st);
						console.log($("#lastgrade").val());
					});

				});

				function addFile() {
					if (count < 2) {
						if (count == 0) {
							$("#addfilebtn")
									.after(
											"<br><input type=file name='img2' onchange='uploadImg(this,2)' id='Fbtn'>");
						} else if (count == 1) {
							$("#Fbtn")
									.after(
											"<br><input type=file name='img3' onchange='uploadImg(this,3)'>");
						} 
						count++;
					} else {
						alert("파일은 3개까지 업로드할수 있습니다.");
					}
				}

				function delFile() {
					$("input:file:last").remove();
					$("br:last").remove();
				}

				function uploadImg(value,num) {
					if (value.files && value.files[0]) {
						var reader = new FileReader();
						
						reader.onload = function(e) {
							switch (num) {
							case 1:
								$("#titleImg1").attr("src", e.target.result);
								break;
							case 2:
								$("#titleImg2").attr("src", e.target.result);
								break;
							case 3:
								$("#titleImg3").attr("src", e.target.result);
								break;
							}
							console.log(e.target.result);
						}
						
						reader.readAsDataURL(value.files[0]);
					}
				}
			</script>
		</div>
		<div>
			<button type="submit" class="btn btn-outline-secondary">WRITE</button>
			<button type="button" class="btn btn-outline-secondary"
				onclick="javascript:history.back();">CANCEL</button>
		</div>
	</form>

	<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>