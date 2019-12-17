<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>

<html>
<head>
<!--  ★공지사항 상세보기★ -->
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
	<u><p class="font">공지사항 상세보기<br></p></u>
</font>
    <br>
    	<form action="<%= request.getContextPath() %>/insert.no" method="post">
            <table class="table table-hover">
                    <tr>
                    	<th>제목</th>
                    	<td colspan="3"><input type="text" size="50" name="title" value="<%= n.getnTitle() %>" readonly></td>
                    </tr>
                    	<tr>
							<th>작성자</th>
							<td>
								<input type="text" value="관리자" name="writer" readonly>
							</td>
							<th>작성일</th>
							<td><input type="text" name="date" value="<%= n.getnDate() %>" readonly></td>
						</tr>
                    <tr>
                    	<th>내용</th>
                    	<td colspan="4"><textarea name="content" cols="115" rows="10" readonly><%= n.getnContent() %></textarea></td>
                    </tr>
                </table>
                </form>
                <hr>
         <div id="qna6_wrap2">
         <button class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/list.no'">목록으로~</button>
          
         <!--  관리자인 경우 수정, 삭제 가능 -->
         <% if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
         <button id="updateBtn" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/updateForm.no?nno=<%= n.getnNo() %>'">수정하기</button>
		<button id="deleteBtn"  class="btn btn-outline-secondary" type="button" onclick="deleteNotice();">삭제하기</button>
        <% } %>
         </div>
         </div>
         <script>
         function deleteNotice(){
 			if(confirm("해당 글을 삭제하시겠습니까?")){
 				location.href="<%= request.getContextPath() %>/delete.no?nno=<%= n.getnNo() %>";
 			}}
         </script>
         <%@ include file="/views/common/footbar.jsp" %>
</body>
</html>
