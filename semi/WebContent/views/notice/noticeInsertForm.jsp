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
        height: 650px;
        margin:auto;
    }
    
    #qna6_wrap2{
    	text-align:center;
    }
    .font { 
	font-size: 20px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: lightgray;
	}
    </style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>  
    <div id="qna6_wrap">
    <br>
   <font class="font_underline">
	<u><p class="font">NOTICE WRITE<br></p></u>
</font>
    <br>
    	<form action="<%= request.getContextPath() %>/insert.no" method="post">
                <table class="table table-hover">
                <tr>
                <td>제목</td>
                <td colspan="3"><input type="text" name="title" placeholder="제목을 입력해주세요"></td>
                </tr>
                <tr>
                <td>작성자</td>
                <td><input type="text" name="writer" value="관리자" readonly></td>
                <td>작성일</td>
                <td><input type="text" name="date" value="<%= today %>" readonly></td>
                </tr>
                <tr>
                <td>내용</td>
                <td colspan="3" rowspan="5"><textarea name="content" cols="80" rows="8" placeholder="내용을 입력해주세요"></textarea></td>
                </tr>
                </table>
                 <hr><hr>
         <div id="qna6_wrap2">
       
         <button type="submit" class="btn btn-outline-secondary">WRITE</button>
         <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back();">CANCEL</button>
           </div>
           </form>
        </div>
         
         <%@ include file="/views/common/footbar.jsp" %>
</body>
</html>