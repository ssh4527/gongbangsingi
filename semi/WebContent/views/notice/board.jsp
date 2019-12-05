<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 1000px;
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
  	width: 1000px;
    height: 300px;
  	margin:auto;
  	}
  	
  	#notice2_wrap1{
  	width:45%;
  	height:100%;
  	margin:auto;
  	background-color:saddlebrown;
  	text-align:center;
  	float:left;
  	border:15px solid white;
  	}
  	
  	#notice2_wrap2{
  	width:45%;
  	height:100%;
  	margin:auto;
  	background-color:beige;
  	text-align:center;
  	float:left;
  	border:15px solid white;
  	}
  	a{
  		color:black;
  	}
  	a:hover{
  		color:white;
  		text-decoration:none;
  	}
    </style>
</head>
<body>
<body>
<br><br>
<div id="notice2_wrap">
	<div id="notice2_wrap1">
	<br>
	<h4>자주 묻는 질문 TOP5</h4>
	<br>
	<ul>
	<li><a href="#">자주 묻는 질문</a></li>
	<li><a href="#">자주 묻는 질문</a></li>
	<li><a href="#">자주 묻는 질문</a></li>
	<li><a href="#">자주 묻는 질문</a></li>
	</ul>
	</div>
	
	<div id="notice2_wrap2">
	<br>
	<h4>공지사항 &nbsp;&nbsp;&nbsp;
	 <button type="button" class="btn btn-outline-secondary" id="t2" onclick="location.href='<%= request.getContextPath() %>/views/notice/noticeListView.jsp'">더보기</button></h4>
	 <br>
	<ul>
	<li><a href="#">결제 관련</a></li>
	<li><a href="#">예약 관련</a></li>
	<li><a href="#">적립금 관련</a></li>
	<li><a href="#">개인정보처리방침</a></li>
	</ul>
	</div>
	
</div>
                
    <div id="notice2_wrap3">
        <br>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                        <th>*비밀글</th>
                        <th>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                </table>
                
                <hr>
                <div align="center">
			<form action="<%=request.getContextPath()%>/search.no" method="get"
				onsubmit="return checkSearchCondition();">
				<select>
					<option value="---">---</option>
					<option value="week">일주일</option>
					<option value="month">한달</option>
					<option value="total">전체</option>
				</select> 
				<select>
					<option value="---">---</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" id="notice2_input" placeholder="내용을 입력해주세요">
				<button type="submit" class="btn btn-outline-secondary">Search</button>
				<button type="button" class="btn btn-outline-secondary">WRITE</button>
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
                <br><br>
                
                <div>
                        <ul class="pagination justify-content-center">
                            <li><a href='#' class="page-link">&lt;&lt;</a></li>
                            <li><a href='#' class="page-link">1</a></li>
                            <li><a href='#' class="page-link">2</a></li>
                            <li><a href='#' class="page-link">&gt;&gt;</a></li>
                        </ul>
                    </div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>