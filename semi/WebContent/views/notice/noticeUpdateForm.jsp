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
<body>
<%@ include file="/views/common/menubar.jsp" %>  
    <div id="qna6_wrap">
    <br>
     <font class="font_underline">
	<u><p class="font">NOTICE REVISE <br></p></u>
</font>
  
    <br>
    	<form action="<%= request.getContextPath() %>/update.no" method="post">
    	  <input type="hidden" name="nno" value="<%= n.getnNo() %>" >
            <table class="table table-hover">
            
                   
                    <tr>
                    	<th>제목</th>
                    	<td colspan="3"><input type="text" name="title" value="<%= n.getnTitle() %>"></td>
                    </tr>
                    	<tr>
							<th>작성자</th>
							<td>
								<input type="text" value="관리자" name="writer" readonly>
							</td>
							<th>작성일</th>
							<td><input type="text" name="date" value="<%= n.getnDate() %>"></td>
						</tr>
                    <tr>
                    	<th>내용</th>
                    	<td colspan="3" rowspan="5"><textarea name="content" cols="80" rows="8"><%= n.getnContent() %></textarea></td>
                    </tr>
                </table>
              
                <hr><hr>
         <div id="qna6_wrap2">
	     <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%= request.getContextPath() %>/list.no'">목록으로</button>
         <button type="submit" class="btn btn-outline-secondary btn-sm">수정완료</button>
         <button type="button" onclick="javascript:history.back();" class="btn btn-outline-secondary btn-sm">취소(뒤로가기)</button>
         </div>
         </form>
          
         </div>
       
         <%@ include file="/views/common/footbar.jsp" %>
</body>
</html>