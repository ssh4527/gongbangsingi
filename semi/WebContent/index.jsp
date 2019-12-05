<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	*{
		margin:auto;
	}
      .maindiv{
        width:1200px;
        height:500px;
        background: lightgrey;
        
      }
      h2{
        padding:30px;
      }
    </style>
</head>
<body>
	
	<%@ include file="views/common/menubar.jsp" %>
	<br>
	<br>
    <div id="maindiv1" class="maindiv">
        <h2>평점 BEST 3</h2><br>
    </div>
    <br>
    <hr>
    <br>
    <div id="maindiv2" class="maindiv">
        <h2>새로운 공방</h2><br>

    </div>
	
	
	
	
	<%@ include file="views/common/footbar.jsp" %>
</body>
</html>