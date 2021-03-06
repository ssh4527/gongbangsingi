<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.Qna, review.model.vo.PageInfo" %>
<%  ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	String searchCondition2 = (String)request.getAttribute("searchCondition2");
	String search2 = (String)request.getAttribute("search2");

	Member loginUser2 = (Member)request.getSession().getAttribute("loginUser");
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


<!--  ★고객센터 페이지★ -->

<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #ptd{
    opacity:0;}
    #notice2_wrap3{
        width: 1300px;
        height: 900px;
        margin:auto;
    }
    .page-link{
       color:black;
    }
    #notice2_input{
        height: 26px;
        width: 300px;
    }
  	#notice2_wrap{
  	width: 750px;
  	}
  	#notice2_wrap2{
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
  		color:gray;;
  		text-decoration:none;
  	}
  	.font { 
	font-size: 20px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: lightgray;
	}
	#notice2_wrap3{
	width:1000px;
	}
    </style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>
<br><br>
<br>

<div id="notice2_wrap">
	<ul class="list-group list-group-horizontal-sm">
	<li class="list-group-item"><a href='<%= request.getContextPath() %>/list.no' id="board_a">공지사항</a>
  	<li class="list-group-item"><a href='<%= request.getContextPath() %>/views/notice/membergrade.jsp' id="board_a">회원등급</a></li>
  	<li class="list-group-item"><a href='<%= request.getContextPath() %>/views/notice/locationbased.jsp'id="board_a">위치기반 서비스</a></li>
  	<li class="list-group-item"><a href='<%= request.getContextPath() %>/views/notice/privacypolicy.jsp' id="board_a">개인정보처리방침</a></li>
  	<li class="list-group-item"><a href='<%= request.getContextPath() %>/getCategory.sh' id="board_a">사업자로 회원전환하기</a>
	</ul>
</div>
                
    <div id="notice2_wrap3">
        <br>
        <br>
        <font class="font_underline">
	<u><p class="font">SERVICE CENTER<br></p></u>
</font><BR>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover" id="Qlist">
                    <tr>
                        <th>NO</th>
                        <th>구분</th>
                        <th>비밀글</th>
                        <th>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                        <th></th>
                    </tr>
                     <% if(list.isEmpty()){ %>
					 	<tr>
					 		<td colspan="7" align="center">없음!!</td>
					 	</tr>
				     <%} else { %>
						 <% for(Qna q : list) {%>
						 	<tr>
						 		<td ><%= q.getqNo() %></td> <!--  번호 -->
						 		<td><% if(q.getcId().equals("비회원")) {%> 비회원
						 			<%} else {%>   회원 <%} %> </td><!-- 회원/비회원 구분 -->
						 		<td ><% if(q.getqSecret().equals("true")){%>비밀글<% }
						 			else if(q.getqSecret().equals("false")){%>공개글<% } %>
						 		</td><!--  비밀글 여부 -->
						 		<td ><%= q.getqTitle() %></td> <!--  제목 -->
						 		<td ><%= q.getcId() %></td> <!--  작성자 이름 -->
						 		<td ><%= q.getqCount() %></td> <!--  조회수 -->
						 		<td ><%= q.getqEntdate() %></td> <!--  날짜 -->
						 		<td id="ptd"><%= q.getqPwd() %></td> <!-- 비밀번호 -->
						 	</tr>
						 <% } %>
					 <% } %>
                </table>
                
                 <div>
		<form action="<%=request.getContextPath()%>/search.qna" method="get" onsubmit="return checkSearchCondition();">
			<select  id="searchCondition2" name="searchCondition2" style="width:80px;height:30px;">
				<option value="---">---</option>
				<option value="title">제목</option>
				<option value="writer">작성자 이름</option>
				</select>
				<input type="search" id="search2" placeholder="내용을 입력해주세요" name="search2">
                <button type="submit" class="btn btn-outline-secondary btn-sm">SEARCH</button>
				<button type="button" class="btn btn-outline-secondary btn-sm"  onclick="location.href='<%= request.getContextPath() %>/views/board/bInsertForm.jsp'" >WRITE</button>
				
		</form>
		
		</div>
		<br><br><br>
		
         <!-- 페이징바 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button  onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			
		</div>
                 <hr>
            
		<br> <br>
		
		<% if(loginUser2 == null){ %>
		<input type="hidden" value="비회원" id="uname">
		<% } else{ %>
			<input type="hidden" value="<%= loginUser2.getUserName()%>" id="uname">
			<% } %>
	
                <script>
                
        		function checkSearchCondition() {
    				if ($("#searchCondition2 option:selected").val() == '---') {
    					alert('옵션을 선택해주세요^^');
    					return false;
    				}
    				return true;
    			}
        		
                $(function(){
    				$("#Qlist td").click(function(){
    						var num=$(this).parent().children().eq(0).text();
    						var secret=$(this).parent().children().eq(2).text().trim();
    						var name=$(this).parent().children().eq(4).text().trim();
    						var uname=$("#uname").val();
    						var pass=$(this).parent().children().eq(7).text().trim();
    					
    						if(secret=="공개글"){
    							location.href="<%= request.getContextPath() %>/detail.qna?qno="+num;
    						} else if(secret="비밀글" && uname!="비회원" && uname==name  ){
    							location.href="<%= request.getContextPath() %>/detail.qna?qno="+num;
    						} else if(secret="비밀글" && uname=="관리자"){
    							location.href="<%= request.getContextPath() %>/detail.qna?qno="+num;
    						} else if(secret="비밀글" && uname=="비회원" && uname==name){
    							var pwd=prompt("비밀번호를 입력하세요! (숫자 4자리)");
    							if(pwd == pass){
    								location.href="<%= request.getContextPath() %>/detail.qna?qno="+num;
    							}else{
    								alert('비밀번호 오류입니다!');
    							}
    						}
    						else {
    							alert('비밀글입니다!');
    						}
    					});
                	
    			});
                </script>
                    </div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<%@ include file="/views/common/footbar.jsp" %>
</body>
</html>