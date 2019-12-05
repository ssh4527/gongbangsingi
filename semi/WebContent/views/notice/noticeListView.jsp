<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice" %>
<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>   
 
<!DOCTYPE html>
<html>
<head>
<!--  ★공지사항 페이지_write버튼은 관리자한테만 보임!★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #notice1_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
    .page-link{
       color:black;
    }
    #notice1_input{
        height: 26px;
        width: 300px;
    }
  	h4{
  	text-align:center;
  	}
  	#t:hover{
  		cursor: pointer;
  	}
  	select{
  		align:center;
  	}
    </style>
</head>

<body>
    <div id="notice1_wrap">
        <br>
        <h4>공지사항</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover" id="t">
                    <tr>
                        <th>NO</th>
                        <tH>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                  <%--   <% if(list.isEmpty()){ %>
					 	<tr>
					 		<td>존재하는 공지사항이 없습니다.</td>
					 	</tr>
					 <%} else { %>
						 <% for(Notice n : list) {%>
						 	<tr>
						 		<td><%= n.getnNo() %></td>
						 		<td><%= n.getnTitle() %></td>
						 		<td><%= n.getnWriter() %></td>
						 		<td><%= n.getnViewCnt() %></td>
						 		<td><%= n.getnEntDate() %></td>
						 	</tr>
						 <% } %>
					 <% } %> --%>
                   
                </table>
                <hr>

		<div align="center">
		<form action="<%=request.getContextPath()%>/search.no" method="get" onsubmit="return checkSearchCondition();">
			<select>
				<option value="---">---</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<input type="text" id="notice1_input" placeholder="내용을 입력해주세요">
                <button type="submit" class="btn btn-outline-secondary">SEARCH</button>
                
                 <!--  관리자만 WRITE 할 수 있음 -->
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/views/notice/noticeInsertForm.jsp'">WRITE</button>
			</select>
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
		<br> <br>
		
		<div>
			<ul class="pagination justify-content-center">
				<li><a href='#' class="page-link">&lt;&lt;</a></li>
				<li><a href='#' class="page-link">1</a></li>
				<li><a href='#' class="page-link">2</a></li>
				<li><a href='#' class="page-link">&gt;&gt;</a></li>
			</ul>
		</div>
	</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>