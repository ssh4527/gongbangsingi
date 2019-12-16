<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<!--  ★관리자가 공지사항 글 작성할 수있는 페이지★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #qna6_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
    
    #qna6_wrap2{
    	text-align:center;
    }
    .font { 
	font-size: 30px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: #fbd6db;
	}
    </style>
</head>
<body>
<body>
<%@ include file="/views/common/menubar.jsp" %>  
    <div id="qna6_wrap">
    <br>
   <font class="font_underline">
	<u><p class="font">공지사항 작성하기<br></p></u>
</font>
    <br>
    	<form action="<%= request.getContextPath() %>/insert.no" method="post">
            <table class="table table-hover">
                    <tr>
                    	<th>제목</th>
                    	<td colspan="3"><textarea name="title" cols="60" rows="1" style="resize:none" placeholder="제목을 입력해주세요"></textarea></td>
                    </tr>
                    	<tr>
							<th>작성자</th>
							<td>
								<input type="text" value="관리자" name="writer" readonly>
							</td>
							<th>작성일</th>
							<td><input type="text" name="date" value="<%= today %>"></td>
						</tr>
                    <tr>
                    	<th>내용</th>
                    	<td colspan="4"><textarea name="content" cols="115" rows="10" placeholder="내용을 입력해주세요"></textarea></td>
                    </tr>
                   
                </table>
               
                <hr>
         <div id="qna6_wrap2">
         <button type="submit" class="btn btn-outline-secondary">WRITE</button>
         <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back();">CANCEL</button>
          </form>
         </div>
         <%@ include file="/views/common/footbar.jsp" %>
</body>
</html>
