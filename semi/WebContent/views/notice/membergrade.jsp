<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#membergrade_thead{
		color:white;
		background:#fbd6db;
	}
	.font { 
	font-size: 30px;
	color:black;
	margin-left:40%;
	 }
	.font_underline { 
	color: #fbd6db;
	}
</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>
<br>
<font class="font_underline">
	<u><p class="font">MEMBER GRADE<br></p></u>
</font>
<br>

<table class="table">
  <thead id="membergrade_thead">
    <tr>
      <th scope="col">등급</th>
      <th scope="col">결제 금액</th>
      <th scope="col">혜택</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><br>VVIP<br></th>
      <td><br>~~~원 이상<br></td>
      <td> - 혜택 1<br>
           - 혜택 2<br>
           - 혜택 3<br>
      </td>
    </tr>
    <tr>
      <th scope="row"><br>VIP<br></th>
      <td><br>~~~원 이상<br></td>
      <td> - 혜택 1<br>
           - 혜택 2<br>
           - 혜택 3<br>
      </td>
    </tr>
  <tr>
      <th scope="row"><br>GOLD<br></th>
      <td><br>~~~원 이상<br></td>
      <td> - 혜택 1<br>
           - 혜택 2<br>
           - 혜택 3<br>
      </td>
    </tr>
     <tr>
      <th scope="row"><br>SILVER<br></th>
      <td><br>~~~원 이상<br></td>
      <td> - 혜택 1<br>
           - 혜택 2<br>
           - 혜택 3<br>
      </td>
    </tr>
     <tr>
      <th scope="row"><br>BRONZE<br></th>
      <td><br>~~~원 이상<br></td>
      <td> - 혜택 1<br>
           - 혜택 2<br>
           - 혜택 3<br>
      </td>
    </tr>
  </tbody>
</table>

<%@ include file="/views/common/footbar.jsp" %>
</body>
</html>