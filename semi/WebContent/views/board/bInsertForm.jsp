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
	width: 1000px;
	height: 700px;
	margin: auto;
}

#qna4_wrap2 {
	text-align: center;
}

.font {
	font-size: 20px;
	color: black;
	margin-left: 40%;
}

.font_underline {
	color: lightgray;
}
</style>

<script>

	function pass() {
		var bpwd = document.getElementById('password');
		if (!chk(/^[0-9]{4}$/, bpwd, "비밀번호는 숫자 4자리 입력해주세요!"))
			return false;
		function chk(re, e, msg) { //정규식, element, 메세지
			if (re.test(e.value)) {
				document.form.submit();
				// 관리자에게 알람 !!
				
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
		<font class="font_underline"> <u><p class="font">
					WRITE<br>
				</p></u>
		</font> <br>
		<form action="<%=request.getContextPath()%>/insert.qna" name="form" method="post">
			<table class="table">
				<tr>
					<td>문의</td>
					<td colspan="3">공방 (클래스) 관련 문의는 각 공방 (클래스) 페이지에서 해주세요</td>
				</tr>
				<tr>
					  <td>제목</td>
					  <td colspan="3"><input type="text" name="title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td>작성자</td>
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
					<td>작성일</td>
					<td><input type="text" name="date" value="<%=today%>"></td>
					</tr>
					<%-- <th>비밀번호</th>
					<td><% if(loginUser==null){%> <input name="password" type="password" id="password" placeholder="숫자 4자리 입력" maxlength="4" > 
					<%} else{ %>
					<input name="password" type="password" id="password" placeholder="비회원만 비밀번호입력" readonly> <%}%>
					</td> --%>
					<tr>
					<td>비밀글 설정</td>
					<td><input type="radio" value="true" name="secret"
						id="private"> <label for="private"> <img src="../../img/111.jpg" width="30px" height="30px"></label> &nbsp;
						<input type="radio" value="false" name="secret" id="public"
						checked> <label for="public"><img src="../../img/222.jpg" width="30px" height="30px"></label></td>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password"
						placeholder="숫자 4자리 입력" maxlength="4"></td>
				</tr>
				<tr>
                <td>내용</td>
                <td colspan="3" rowspan="5"><textarea name="content" cols="80" rows="8" placeholder="내용을 입력해주세요"></textarea></td>
                </tr>
			</table>
			<hr><hr>
			
	<div id="qna4_wrap2">
		<input type="button" class="btn btn-outline-secondary" value="WRITE"
			onclick="pass()" /> <input type="button"
			class="btn btn-outline-secondary" value="CANCEL"
			onclick="javascript:history.back();">
	</div>
	</form>
	</div>

	<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>