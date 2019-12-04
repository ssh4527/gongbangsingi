<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  ★회원마이페이지_결제내역★ -->
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #reservation2_wrap{
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
                
    <div id="reservation2_wrap">
        <br>
        <h4>결제내역</h4>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>NO</th>
                         <th>STUDIO</th>
                        <th>TIME</th>
                        <th>PERSON</th>
                        <th>DATE</th>
                        <th>MONEY</th>
                        <th>STATUS</th>
                    </tr>
                    <tr id="reservation2_in1">
                        <td>1</td>
                        <td>반지공방</td>
                        <td>10:00~11:30</td>
                        <td>3</td>
                        <td>2019-10-28</td>
                        <th>30000원</th>
                        <td>결제완료</td>
                    </tr>
                    <tr id="reservation2_in2">
                        <td>2</td>
                        <td>반지공방</td>
                        <td>10:00~11:30</td>
                        <td>3</td>
                        <td>2019-10-28</td>
                        <th>30000원</th>
                        <td>환불완료</td>
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
           $(function(){
               $("#reservation2_in1").on('click',function(){
            	   var result=confirm("후기를 작성하러 가시겠습니까?");
            		 var str="";
            		 if(result){
            			 str="후기작성 하러가기";
            			 
            		 }else{
            			 str="후기작성 안해요";
            		 }
            		 if(str=="후기작성 하러가기"){
            			// 후기작성 페이지로 이동
            			 
            		 }
               });
           });
           $(function(){
               $("#reservation2_in2").on('click',function(){
            	   var result=confirm("후기를 작성하러 가시겠습니까?");
            		 var str="";
            		 if(result){
            			 str="후기작성 하러가기";
            			 
            		 }else{
            			 str="후기작성 안해요";
            		 }
            		 if(str=="후기작성 하러가기"){
            			// 후기작성 페이지로 이동
            			 
            		 }
               });
           });
           </script>
                    
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>