<%@page import="workclass.model.vo.ClassFile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Review review = (Review)request.getAttribute("review");
	String wcNo = (String)request.getAttribute("wcNo");
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String today = sdf.format(date);
	
	String p1 = "";
	String p2 = "";
	String p3 = "";
	String p4 = "";
	String p5 = "";

			
	if(review.getRGrade() == 1){
		p1 = "checked";
	}else if(review.getRGrade() == 2){
		p2 = "checked";
	}else if(review.getRGrade() == 3){
		p3 = "checked";
	}else if(review.getRGrade() == 4){
		p4 = "checked";
	}else{
		p5 = "checked";
	}
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

	<form action="<%=request.getContextPath()%>/update.review" method="post">
		<div id="qna4_wrap">
			<br> <br>
			<!-- <table class="table table-dark table-striped"> -->
			<h3 align="center">R E V I E W</h3>
			<br>
			<table class="table table-hover">
				<tr>
					<th>제목</th>
					<td colspan="5"><textarea name="title" cols="60" rows="1"
							style="resize: none" placeholder="제목을 입력해주세요"><%= review.getRTitle() %></textarea></td>
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
					<td width="18%"><input type="radio" name="grade" value="1"
						<%= p1 %>>★☆☆☆☆</td>
					<td width="18%"><input type="radio" name="grade" value="2" <%= p2 %>>★★☆☆☆</td>
					<td width="18%"><input type="radio" name="grade" value="3" <%= p3 %>>★★★☆☆</td>
					<td width="18%"><input type="radio" name="grade" value="4" <%= p4 %>>★★★★☆</td>
					<td width="18%"><input type="radio" name="grade" value="5" <%= p5 %>>★★★★★</td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea name="content" cols="115" rows="10"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<hr>
			<input type="text" name="lastgrade" id="lastgrade" style="display: none;" value="1">
			<input type="text" name="rNo" id="rNo"  value="<%= review.getRNo() %>"  style="display: none;">
			<input type="text" name="user" id="user" value="<%=loginUser.getUserId()%>" style="display: none;">
			<input type="text" name="wcNo" id="wcNo" value="<%= wcNo %>" style="display: none;">
			<script>

				$(function() {
					$("#fileArea").hide();
					
					$(":input:radio[name=grade]").click(function() {
						var st = $(":input:radio[name=grade]:checked").val();
						console.log(st);
						$("#lastgrade").val(st);
						console.log($("#lastgrade").val());
					});

				});

				
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