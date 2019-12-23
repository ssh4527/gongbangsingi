<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#membergrade_thead{
		color:black;
		background:lightblue;
		opacity:58%;
	}
	.font { 
	font-size: 20px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: lightgray;
	}
	#membergrade{
		width:800px;
		height:700px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>
<br>
<div id="membergrade">
<font class="font_underline">
	<u><p class="font">MEMBER GRADE<br></p></u>
</font>
<br>

<table class="table">
  <thead id="membergrade_thead">
    <tr>
      <th scope="col">등급</th>
      <th scope="col">결제 금액</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><br>다이아<br></th>
      <td><br>1000000원 이상<br></td>
    </tr>
    <tr>
      <th scope="row"><br>플래티넘<br></th>
      <td><br>700000원 이상<br></td>
      
    </tr>
  <tr>
      <th scope="row"><br>골드<br></th>
      <td><br>400000원 이상<br></td>
      
    </tr>
     <tr>
      <th scope="row"><br>실버<br></th>
      <td><br>100000원 이상<br></td>
 
    </tr>
     <tr>
      <th scope="row"><br>브론즈<br></th>
      <td><br>0원 이상<br></td>
 
    </tr>
  </tbody>
</table>
</div>
<%@ include file="/views/common/footbar.jsp" %>
</body>
</html>