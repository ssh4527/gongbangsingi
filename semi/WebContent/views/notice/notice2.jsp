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
	<p> 자주 묻는 질문1 </p>
	<p> 자주 묻는 질문1 </p>
	<p> 자주 묻는 질문1 </p>
	<p> 자주 묻는 질문1 </p>
	</div>
	
	<div id="notice2_wrap2">
	<br>
	<h4>공지사항 &nbsp;&nbsp;&nbsp;
	 <button type="button" class="btn btn-outline-secondary" id="t2">더보기</button></h4>
	 <br>
	<ul>
	<li>개인정보처리방침</li>
	<li>결제 관련</li>
	<li>환불 관련</li>
	<li>적립금 제도</li>
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
                        <th>*</th>
                        <th>SUBJECT</th>
                        <th>WRITER</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>비밀글</td>
                        <td>멤버십 회원등급 안내</td>
                        <td>이지은</td>
                         <td>456</td>
                        <td>2019-10-28</td>
                    </tr>
                   
                </table>
                <hr>
                <select>
                        <option value="일주일" selected>일주일</option>
                        <option value="한달">한달</option>
                        <option value="전체">전체</option>
                </select>
                <select>
                        <option value="제목" selected>제목</option>
                        <option value="내용">내용</option>
                </select>
                <input type="text" id="notice2_input" placeholder="내용을 입력해주세요">
                <button type="button" class="btn btn-outline-secondary">Search</button>
                <button type="button" class="btn btn-outline-secondary">WRITE</button>
                <br> <br>
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