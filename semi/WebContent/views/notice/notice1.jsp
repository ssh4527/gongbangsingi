<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
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
                    <tr>
                        <td>1</td>
                        <td>멤버십 회원등급 안내</td>
                        <td>관리자</td>
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
                <input type="text" id="notice1_input" placeholder="내용을 입력해주세요">
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