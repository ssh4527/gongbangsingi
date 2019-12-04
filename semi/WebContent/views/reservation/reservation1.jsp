<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★회원 마이페이지_예약내역★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #reservation1_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
    .page-link{
       color:black;
    }
  	h4{
  	text-align:center;
  	}
    </style>
</head>
<body>
<body>
                
    <div id="reservation1_wrap">
        <br>
        <h4>예약내역</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                         <th>STUDIO</th>
                        <th>TIME</th>
                        <th>PERSON</th>
                        <th>DATE</th>
                        <th>CHANGE</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>반지공방</td>
                        <td>10:00~11:30</td>
                        <td>3</td>
                        <td>2019-10-28</td>
                        <td><button type="button" class="btn btn-danger" onclick="cancel();">예약취소</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>반지공방</td>
                        <td>10:00~11:30</td>
                        <td>3</td>
                        <td>2019-10-28</td>
                        <td><button type="button" class="btn btn-danger"  onclick="cancel();">예약취소</button></td>
                        
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
  <script>
  function cancel(){
	 var result=confirm("예약을 취소하시겠습니까?");
	 var str="";
	 if(result){
		 str="취소합니다.";
		 
	 }else{
		 str="아니요!";
	 }
	 console.log(str);
  }
  
  </script>                  
                    
                    
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>