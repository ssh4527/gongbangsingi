<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★회원 마이페이지_문의내역★ -->
<meta charset="UTF-8">
<title>문의내역</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #qna1_ok{
    	color:red;
    }
    #qna1_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
    .page-link{
       color:black;
    }
  	h4{
  	text-align:center;}
    </style>
</head>
<body>
<body>
                
    <div id="qna1_wrap">
        <br>
        <h4>문의내역</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover" id="qnaT">
                    <tr>
                        <th>NO</th>
                        <th>STUDIO</th>
                        <th>SUBJECT</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                        <th>ANSWER STATUS</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>반지 공방</td>
                        <td>날짜 변경</td>
                        <td>456</td>
                        <td>2019-10-28</td>
                        <td id="qna1_ok">답변완료</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>반지 공방</td>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<script>
		$(function(){
			$("#qnaT").eq(0)
		});
	</script>

</body>
</html>