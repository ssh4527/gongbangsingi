<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★회원 마이페이지_나의 리뷰★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #review1_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
  	h4{
  	text-align:center;
  	}
  	        p.contents{
            border: 1px solid lightgrey;
            width: 300px;
            height: 200px;
            display: none;
        }
  	</style>
</head>
<body>
<body>
    <div id="review1_wrap">
        <br>
        <h4>나의 리뷰</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                         <th>STUDIO</th>
                        <th>SUBJECT</th>
                        <th>VIEWS</th>
                        <th>DATE</th>
                    </tr>
                  
                    <tr>
                   
                        <td>1</td>
                        <td>반지공방</td>
                        <td>날짜 변경</td>
                        <td>456</td>
                        <td>2019-10-28</td>
                        </div>
                    </tr>
                  
                    <tr>
                        <td>2</td>
                        <td>도자기공방</td>
                        <td>날짜 변경</td>
                        <td>456</td>
                        <td>2019-10-28</td>
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