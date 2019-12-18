<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.Qna" %>
<%  ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	String searchCondition = (String)request.getAttribute("searchCondition");
	String search = (String)request.getAttribute("search");
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
  	width: 1300px;
    height: 300px;
  	margin:auto;
  	}
  	
  	#notice2_wrap1{
  	width:40%;
  	height:100%;
  	margin:auto;
  	background-color:saddlebrown;
  	text-align:center;
  	float:left;
  	border:15px solid white;
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
	
	#notice2_wrap12{
	width:20%;
  	height:100%;
  	margin:auto;
  	background-color: #fbd6db;
  	text-align:center;
  	float:left;
  	border:15px solid white;
	}
	#notice2_wrap3{
	width:1000px;}
    </style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>
<br><br>
<br>

<div id="notice2_wrap">
	<div id="notice2_wrap1">
	<br>
	<h4>자주 묻는 질문 TOP5</h4>
	<br>
	<ul>
	<li><a href="#" id="board_a">자주 묻는 질문</a></li>
	<li><a href="#" id="board_a">자주 묻는 질문</a></li>
	<li><a href="#" id="board_a">자주 묻는 질문</a></li>
	<li><a href="#" id="board_a">자주 묻는 질문</a></li>
	</ul>
	</div>
	
	<div id="notice2_wrap2">
	<br>
	<h4>공지사항 &nbsp;&nbsp;&nbsp;
	 <button type="button" class="btn btn-outline-secondary" id="t2" onclick="location.href='<%= request.getContextPath() %>/list.no'">더보기</button></h4>
	 <br>
	<ul>
	<li><a href="membergrade.jsp" id="board_a">회원등급</a></li>
	<li><a href="#" id="board_a">결제/예약 관련</a></li>
	<li><a href="locationbased.jsp" id="board_a">위치기반 서비스</a></li>
	<li><a href="privacypolicy.jsp" id="board_a">개인정보처리방침</a></li>
	</ul>
	</div>
	
	<div id="notice2_wrap12">
	<br>
	<h4>사업자 회원</h4>
	<button type="button" class="btn btn-light" onclick="location.href='businessmember.jsp'" >사업자로 회원전환하기</button>
	</div>
	
</div>
                
    <div id="notice2_wrap3">
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
					 		<td>없음!!</td>
					 	</tr>
				     <%} else { %>
						 <% for(Qna q : list) {%>
						 	<tr>
						 		<td ><%= q.getqNo() %></td> <!--  번호 -->
						 		<td ><%-- <% if(loginUser.getAuthority()==1){%> 일반회원 <% }
						 			else if(loginUser.getAuthority()==2){%> 사업자 <% } %> --%>회원/사업자</td> <!--  일반회원/사업자 구분 -->
						 		<td ><%= q.getqSecret() %></td> <!--  비밀글 여부 -->
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
		</script>
		</div>
		<% if(searchCondition != null && search != null) { %>
				<p align="center"><%= searchCondition %> : <%= search %>의 검색결과</p>
			<% } %>
		
                <br><br>
                <script>
                $(function(){
    				$("#Qlist td").click(function(){
    					// 자기 자신만 글 볼 수 있도록 
    					var num=$(this).parent().children().eq(0).text();
    					location.href="<%= request.getContextPath() %>/detail.qna?qno="+num;
    				});
    			});
                </script>
                
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
<%@ include file="/views/common/footbar.jsp" %>
</body>
</html>