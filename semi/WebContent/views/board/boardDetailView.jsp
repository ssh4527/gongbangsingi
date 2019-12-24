<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="qna.model.vo.*, java.util.*"%>
<%
	Qna q = (Qna) request.getAttribute("qna");

String c1 = "";
String c2 = "";
if(q.getqSecret().equals("true")){
	c1 = "checked";
}else{
	c2 = "checked";
}

// ajax 이후
ArrayList<QnaRe> rlist = (ArrayList<QnaRe>)request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html>
<head>
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
	height: 1000px;
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
    function deleteQna(){
		if(confirm("해당 글을 삭제하시겠습니까?")){
			location.href="<%=request.getContextPath()%>/delete.qna?qno=<%=q.getqNo()%>";
			}
		}
/* 	function pass() {
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
	} */
	
</script>

</head>

<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div id="qna4_wrap">
		<br>
		<font class="font_underline"> <u><p class="font">
					SERVICE CENTER DETAIL<br>
				</p></u>
		</font> <br>
		
		<form action="<%=request.getContextPath()%>/insert.qna" name="form"
			method="post">
			<table class="table">
				<tr>
					<td>문의</td>
					<td colspan="3">공방 (클래스) 관련 문의는 각 공방 (클래스) 페이지에서 해주세요</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"
						value="<%=q.getqTitle()%>" readonly></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input name="writer" type="text" value="<%=q.getcId()%>"
						name="writer" readonly></td>
					<td>작성일</td>
					<td><input type="text" name="date"
						value="<%=q.getqEntdate()%>" readonly></td>
				</tr>
				<tr>
					<td>비밀글 설정</td>
					<td><input type="radio" value="Y" name="secret" id="private" <%= c1 %>> 
					<label for="private">비밀글</label> &nbsp; 
						<input type="radio" value="N" name="secret" id="public" <%= c2 %>> <label for="public">공개글</label></td>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password"
						value="<%=q.getqPwd()%>" maxlength="4"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" rowspan="5"><textarea name="content" cols="80" rows="8"
							readonly>
					<%=q.getqContent()%></textarea></td>
				</tr>
			</table>
		</form>
		<hr>


		<%-- 	<!--  댓글 작성하는 부분 -->
			<form action="<%=request.getContextPath()%>/insert.qna.re" name="form" method="post">
				<table align="center">
				<tr>
					<td>댓글 작성 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</td> 
					<td><textarea rows="3" cols="80" id="text"></textarea></td>
					<% if(loginUser != null){%>
					<td><input type="text" id="writer" size="6" height="10px" value="<%= loginUser.getUserId()%>" readonly></td>
					<% } else { %>
					<td><input type="text" id="writer" size="6" height="10px" value="비회원" readonly></td>
					<% } %>
					<td><button id="addReply">댓글 등록</button></td>
				</tr>
			</table>
			</form>
			<hr> --%>
			
				<!-- ajax를 이용한 댓글 기능 구현 -->
	<div class="replyArea">
		<!-- 댓글 작성하는 부분 -->
		<div class="replyWriterArea">
			<table align="center">
				<tr>
					<td>댓글 작성</td>
					<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
					<td><button id="addReply">댓글 등록</button></td>
				</tr>
			</table>
		</div>
		<!-- 불러온 댓글 리스트 보여주는 부분 -->
		<div id="replySelectArea">
			<table id="replySelectTable" border="1" align="center">
			<% if(rlist != null){ %>
				<% for(QnaRe r : rlist) { %>
					<tr>
						<td width="100px"><%= r.getcId() %></td>
						<td width="400px"><%= r.getRqComment() %></td>
						<td width="200px"><%= r.getRqEntDate() %></td>
					</tr>
				<% } %>
			<% } %>
			</table>
		</div>

	</div>
	
	<script>
	// addReply 버튼 클릭 시 댓글 달기 기능을 실행했을 때 비동기적으로
	// 새로 갱신 된 댓글 리스트를 테이블에 적용 시키는 ajax

	$("#addReply").click(function(){
		var writer = '<%= loginUser.getUserId() %>';
		var content = $("#replyContent").val();
		var qno='<%= q.getqNo()%>';
		var rqno="1";
		
		
		$.ajax({
			url : "insert.qna.re",
			type : "post",
		
			data : {writer:writer,
					content:content,
					qno:qno,
					rqno:rqno
					},
			success: function(data){
				console.log('success');
				
				$replyTable = $("#replySelectTable");
				$replyTable.html(""); // 기존 댓글 테이블 정보 초기화
				
				// 새로 받아온 갱신 된 댓글 리스트 들을 for문을 통해
				// 다시 table에 추가
			
					<%Date d = new Date(); %>
					var $tr = $("<tr>");
					var $writerTd = $("<td>").text('<%= loginUser.getUserName() %>').css("width", "100px");
					var $contentTd = $("<td>").text(data).css("width", "400px");
					var $dateTd = $("<td>").text('<%=  d.getDate() %>').css("width", "200px");
					
					$tr.append($writerTd);
					$tr.append($contentTd);
					$tr.append($dateTd);
					
					$replyTable.append($tr);
			
				// 댓글 작성 부분 리셋
				$("#replyContent").val("");
				
				
			},
			error : function(){
				console.log('ajax 통신 실패');
			}
		});
	});
	
	</script>

		<div id="qna4_wrap2"> 
		<!--  수정,삭제버튼은 글 작성한 사람한테만 보이도록 작성하기 -->
	
			<% if(loginUser==null && q.getqSecret().equals("true")) { %>
			<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로"
				onclick="javascript:history.back();">
				<button id="updateBtn" class="btn btn-outline-secondary btn-sm"
				onclick="location.href='<%=request.getContextPath()%>/updateForm.qna?qno=<%=q.getqNo()%>'">수정하기</button>
				<button id="deleteBtn" class="btn btn-outline-secondary btn-sm"
				type="button" onclick="deleteQna();">삭제하기</button>
			<% } else if(loginUser != null){ %>
	        <% if(loginUser.getUserName().equals(q.getcId())){ %>
			<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로"
				onclick="javascript:history.back();">
			<button id="updateBtn" class="btn btn-outline-secondary btn-sm"
				onclick="location.href='<%=request.getContextPath()%>/updateForm.qna?qno=<%=q.getqNo()%>'">수정하기</button>
			<button id="deleteBtn" class="btn btn-outline-secondary btn-sm"
				type="button" onclick="deleteQna();">삭제하기</button>
			<% } else{ %>
			<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로"
				onclick="javascript:history.back();">
				<% } }else{%>
				<input type="button" class="btn btn-outline-secondary btn-sm" value="목록으로"
				onclick="javascript:history.back();">
				<% } %>
				<br><br>
		</div>
		</div>
		
		
		<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>