<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String today = sdf.format(date);
	
	String wsNo = (String)request.getParameter("wsNo");
	String wcNo = (String)request.getParameter("wcNo");
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
		<font class="font_underline"> <u><p class="font"> 문의글 작성하기<br>
				</p></u>
		</font> <br>
		<form action="<%=request.getContextPath()%>/insert.class.qna" name="form" method="post">
			<input type="text" id="wsNo" name="wsNo" value="<%= wsNo %>" style="display:none;">
			<input type="text" id="wcNo" name="wcNo" value="<%= wcNo %>" style="display:none;">
			<table class="table table-hover">
				<tr>
					<th>문의</th>
					<th colspan="5">운영에 관한 문의는 고객센터를 통해 문의 부탁드립니다.</th>
				</tr>
				<tr>
					<th>제목</th>
					<td><textarea name="title" cols="60" rows="1"
							style="resize: none" placeholder="제목을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr>
					<th>작성자</th>
					<td><input name="writer" type="text" value="<%= loginUser.getUserId() %>" name="writer" readonly></td>
					<th>작성일</th>
					<td><input type="text" name="date" value="<%=today%>" style="display:none;">
							<%=today %></td>
				</tr>
				<tr>
				<th>비밀글 설정</th>
					<td>
					<input type="radio" value="Y" name="secret" id="private" checked> 
					<label for="private" style="cursor:pointer;"> <i class="fas fa-lock"></i></label> &nbsp; 
					<input type="radio" value="N" name="secret" id="public"> 
					<label for="public" style="cursor:pointer;"><i class="fas fa-lock-open"></i></label>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea name="content" cols="115" rows="10"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<hr>

			<div id="qna4_wrap2">
				<input type="submit" class="btn btn-outline-secondary" value="WRITE" /> <input type="button"
					class="btn btn-outline-secondary" value="CANCEL"
					onclick="javascript:history.back();">
			</div>
		</form>
	</div>

	<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>