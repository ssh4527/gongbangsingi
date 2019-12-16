<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.Qna" %>
<% ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	String searchCondition = (String)request.getAttribute("searchCondition");
	String search = (String)request.getAttribute("search");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

  	#board_wrap2{
  	width:40%;
  	height:100%;
  	margin:auto;
  	background-color:beige;
  	text-align:center;
  	float:left;
  	border:15px solid white;
  	}
  	#board_a{
  		color:black;
  	}
  	#board_a:hover{
  		color:white;
  		text-decoration:none;
  	}
  	.font { 
	font-size: 30px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: #fbd6db;
	}
	
	#board_wrap12{
	width:20%;
  	height:100%;
  	margin:auto;
  	background-color: #fbd6db;
  	text-align:center;
  	float:left;
  	border:15px solid white;
	}

</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp"%>
             
    <div id="board_wrap3">
        <br>
        <br>
        <font class="font_underline">
	<u><p class="font">고객센터<br></p></u>
</font><BR>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover" id="Qlist">
                    <tr>
                        <th>NO</th>
                        <th>구분</th>
                        <th>*비밀글</th>
                        <th>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                       
              	   <% if(list.isEmpty()){ %>
					 	<tr>
					 		<td>!!</td>
					 	</tr>
				     <%} else { %>
						 <% for(Qna q : list) {%>
						 	<tr>
						 		<td ><%= q.getqNo() %></td> <!--  번호 -->
						 		<td ><% if(loginUser.getAuthority()==1){%> 일반회원 <% }
						 			else if(loginUser.getAuthority()==2){%> 사업자 <% } %></td> <!--  일반회원/사업자 구분 -->
						 		<td ><%= q.isqSecret() %></td> <!--  비밀글 여부 -->
						 		<td ><%= q.getqTitle() %></td> <!--  제목 -->
						 		<td ><%= q.getcId() %></td> <!--  작성자 이름 -->
						 		<td ><%= q.getqCount() %></td> <!--  조회수 -->
						 		<td ><%= q.getqEntdate() %></td> <!--  날짜 -->
						 	</tr>
						 <% } %>
					 <% } %>
                </table>
                
                <hr>
                <div align="center">
			<form action="<%=request.getContextPath()%>/search.qna" method="get"
				onsubmit="return checkSearchCondition();">
				<select  id="searchCondition" name="searchCondition">
					<option value="---">---</option>
								<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select> 
				<input type="search" name="board_search" id="board_search" placeholder="내용을 입력해주세요">
				<button type="submit" class="btn btn-outline-secondary">Search</button>
				
				<% if(loginUser != null){%>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/views/board/bInsertForm.jsp'">WRITE</button>
				<% } %>
			</form>
			<script>
			function checkSearchCondition() {
				if ($("#searchCondition option:selected").val() == '---') {
					alert('제목인지 작성자인지 선택해주세요^^');
					return false;
				}
				return true;
			}
		
			$(function(){
				$("#Qlist td").click(function(){
					var num=$(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath() %>/detail.qna?nno="+num;
				});
			});
			
		
		</script>
		</div>

<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>