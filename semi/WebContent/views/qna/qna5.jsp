<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★사업자 마이페이지에서 문의내역 클릭하면 사업자가 댓글 달 수 있는 페이지★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   
<style>
	#qna5_wrap{
	width: 1000px;
		margin:auto;
	}
	#qna5_wrap2{
		width: 1000px;
		height:30%;
		border:1px solid gray;
		margin:auto;
	}
	th,#qna5_q{
	 	height:50px;
	 	text-align:center;
	 }
	 table{
	 	width: 1000px;
		height:70%;
	 	margin:auto;
	 }
	 #qna5_in2{
	 	text-align:right;
	 	margin-right:95px;
	 }
	 #qna5_in1, #qna5_q2{
	 	text-align:center;
	 }
	 p{
	 margin-left:100px;
	 }
	 #qna5_button{
	 	margin-left:770px;
	 }
	 
</style>

</head>
<body>
<br>
 <table border="1">
       <tr>
       		<th>SUBJECT</th>
       		<td colspan="3" id="qna5_q" >사업자한테 문의합니다</td>
       </tr>
       
       <tr>
            <th>WRITER</th>
            <td colspan="3" id="qna5_q2">홍길동</td>
        </tr>
        
        <tr>
        	<th>DATE</th>
        	<td id="qna5_q2">2019-10-15</td>
        	<th>VIEWS</th>
        	<td id="qna5_q2">2</td>
        </tr>
        
        <tr>
        <td colspan="4" height="300px">공방주인한테 문의합니다</td> 
        </tr>
    </table>
    <br>
    
    <div id="qna5_wrap">
   	<span>
     <button type="button" class="btn btn-outline-secondary">LIST</button>
     </span>

     <span>
     <button type="button" class="btn btn-outline-secondary" id="qna5_button">MODIFY</button>
     <button type="button" class="btn btn-outline-secondary">DELETE</button>
   	</span>
   	</div>

	<br>
	<div id="qna5_wrap2">
	<br>
	<p>댓글달기</p>
	<div id="qna5_in1">
	<textarea cols="100" rows="5" style="resize:none" placeholder="댓글을 입력해주세요"></textarea>
	</div>
	<br>
	<div id="qna5_in2">
	<button type="button" class="btn btn-outline-secondary">WRITE</button>
	</div>
	<br>
	</div>
	</body>
</html>