<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
    <style>
    .footerdiv{
        width:30%;
        height:100%;
        border:1px solid black;
        margin-top:20px;
        float: left;
        line-height: 40px;
        margin-right:15px;
    }
    #footerdiv1{
    	margin-left:50px;
    }
    div{
    	margin:auto;
    	
    }
    .footerdiv > *{
        text-align: center;
        
    }
    #footerdiv3{
        text-align: right;
        
    }
    </style>
</head>
<body>
    <footer style="width:1300px; height:200px;">
    <div id="footerdiv1" class="footerdiv">
        <h3>1577-1577</h3>
        <p>
            고객센터 전화번호
        </p>
    </div>
    <div id="footerdiv2" class="footerdiv">
        로고 이미지 들어갈 자리
    </div>
    <div id="footerdiv3" class="footerdiv"> 
        Office Tel 02-488-8934 | Phone 010-1234-4567
        <br>
        서울특별시 강남구 역삼동 테헤란로 231-7  7층    
        <br>
        Copyright ⓒ KH Company All Rights Reserved                
    </div>
    
    </footer>
</body>
</html>