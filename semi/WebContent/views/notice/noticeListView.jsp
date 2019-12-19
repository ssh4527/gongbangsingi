<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.*,review.model.vo.PageInfo" %>
<%  ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	String searchCondition = (String)request.getAttribute("searchCondition");
	String search3 = (String)request.getAttribute("search3");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>   

 
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
    #search3{
        height: 26px;
        width: 300px;
    }
  	h4{
  	text-align:center;
  	}
  	#Nlist:hover{
  		cursor: pointer;
  	}
  	select{
  		align:center;
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
<%@ include file="/views/common/menubar.jsp" %>
    <div id="notice1_wrap">
        <br>
       <font class="font_underline">
	<u><p class="font">공지사항<br></p></u>
</font>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover" id="Nlist">
                    <tr>
                        <th>NO</th>
                        <tH>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                    
              	   <% if(list.isEmpty()){ %>
					 	<tr>
					 		<td>공지사항 없음!</td>
					 	</tr>
				    <%} else { %>
						 <% for(Notice n : list) {%>
						 	<tr>
						 		<td ><%= n.getnNo() %></td>
						 		<td><%= n.getnTitle() %></td>
						 		<td>관리자</td>
						 		<td><%= n.getnCount() %></td>
						 		<td><%= n.getnDate() %></td>
						 	</tr>
						 <% } %>
					 <% } %>
					
                </table>
                <hr>
                <!-- 페이징바 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.no?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			
		</div>

		<div align="center">
		<form action="<%=request.getContextPath()%>/search.no" method="get" onsubmit="return checkSearchCondition();">
			<select  id="searchCondition" name="searchCondition">
				<option value="---">---</option>
				<option value="title">제목</option>
				<option value="content" >내용</option>
				</select>
				<input type="search" id=search3" placeholder="내용을 입력해주세요" name="search3">
                <button type="submit" class="btn btn-outline-secondary">SEARCH</button>
                
                	<!--  관리자만 WRITE 할 수 있음 -->
                	<% if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/views/notice/noticeInsertForm.jsp'">WRITE</button>
                <% } %>
		</form>
		<script>
			function checkSearchCondition() {
				if ($("#searchCondition option:selected").val() == '---') {
					alert('제목인지 내용인지 선택해주세요^^');
					return false;
				}
				return true;
			}
		</script>
		
	
		</div>
				<% if(searchCondition != null && search3 != null) { %>
				<p align="center"><%= searchCondition %> : <%= search3 %>의 검색결과</p>
			<% } %>
		<br> <br>
		
		<script>
		$(function(){
			$("#Nlist td").click(function(){
				var num=$(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath() %>/detail.no?nno="+num;
			});
		});
		
		</script>
	</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<%@ include file="/views/common/footbar.jsp" %>
</body>
</html>
