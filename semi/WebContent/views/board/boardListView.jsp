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
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                        <th>구분</th>
                        <th>*비밀글</th>
                        <th>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                </table>
                
                <hr>
                <div align="center">
			<form action="<%=request.getContextPath()%>/search.qna" method="get"
				onsubmit="return checkSearchCondition();">
			<!-- 	<select>
					<option value="---">---</option>
					<option value="week">일주일</option>
					<option value="month">한달</option>
					<option value="total">전체</option>
				</select> --> 
				<select>
					<option value="---">---</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
				</select> <input type="text" id="board_input" placeholder="내용을 입력해주세요">
				<button type="submit" class="btn btn-outline-secondary">Search</button>
				
				<% if(loginUser != null){%>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/views/board/bInsertForm.jsp'">WRITE</button>
				<% } %>
			</form>
			<script>
			function checkSearchCondition() {
				if ($("#searchCondition option:selected").val() == '---') {
					return false;
				}
				return true;
			}
		</script>
		</div>

<%@ include file="/views/common/footbar.jsp"%>
</body>
</html>