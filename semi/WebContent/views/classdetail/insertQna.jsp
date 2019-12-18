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
</style>

</head>

<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div id="qna4_wrap">
		<br>
		<font class="font_underline"> <u><p class="font">
					문의글 작성하기<br>
				</p></u>
		</font> <br>
		<form action="<%=request.getContextPath()%>/insert.qna" name="form"
			method="post">
			<table class="table table-hover">
				<tr>
					<th>문의</th>
					<th colspan="5">고객센터문의 <공방 (클래스) 관련 문의는 각 공방(클래스) 페이지에서 해주세요></th>
				</tr>
				<tr>
					<th>제목</th>
					<td><textarea name="title" cols="60" rows="1"
							style="resize: none" placeholder="제목을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input name="writer" type="text"
						value="<%= loginUser.getUserName() %>" name="writer"
						readonly></td>
					<th>작성일</th>
					<td><input type="text" name="date" value="<%=today%>"></td>
					<th>비밀번호</th>
					<td><input type="password" name="password" id="password"
						placeholder="숫자 4자리 입력" maxlength="4"></td>
					<th>비밀글 설정</th>
					<td>
					<input type="radio" value="Y" name="secret" id="private" checked> 
					<label for="private"> <img src="../../img/111.jpg" width="30px" heigh="30px"></label> &nbsp; 
					<input type="radio" value="N" name="secret" id="public"> 
					<label for="public"><img src="../../img/222.jpg" width="30px" heigh="30px"></label>
					</td>
					<!-- <td>
							<select name="secret">
								<option value="Y">비밀글</option>
								<option value="N">공개글</option>
							</select>
							</td> -->
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea name="content" cols="115" rows="10"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file"> <input type="button"
						value="추가" onclick="addFile()"> <input type="button"
						value="삭제" onclick="delFile()"></td>
				<tr>
			</table>
			<hr>

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