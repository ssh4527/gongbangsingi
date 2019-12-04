<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★사업자 마이페이지_문의내역★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #qna2_ok{
    	color:red;
    }
    #qna2_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
  	h4{
  	text-align:center;
  	}
    </style>
</head>
<body>
<body>
                
    <div id="qna2_wrap">
        <br>
        <h4>문의내역</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                         <th>WRITER</th>
                        <th>SUBJECT</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                        <th>ANSWER STATUS</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>홍길동</td>
                        <td>날짜 변경</td>
                        <td>456</td>
                        <td>2019-10-28</td>
                        <td id="qna2_ok">답변완료</td>
                        
                    </tr>
                    
                    <tr>
                        <td>2</td>
                        <td>이순신</td>
                        <td>날짜 변경</td>
                        <td>456</td>
                        <td>2019-10-28</td>
                        <td>대기</td>
                    </tr>
                   
                </table>
                <hr>
            
                <div>
                        <ul class="pagination justify-content-center">
                            <li><a href='#' class="page-link">&lt;&lt;</a></li>
                            <li><a href='#' class="page-link">1</a></li>
                            <li><a href='#' class="page-link">2</a></li>
                            <li><a href='#' class="page-link">&gt;&gt;</a></li>
                        </ul>
                    </div>
</body>
</html>