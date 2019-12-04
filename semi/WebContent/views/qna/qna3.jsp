<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★공지사항 문의글보기(관리자만 댓글달기 가능)★ -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   
<style>
	#qna3_wrap{
	width: 1000px;
		margin:auto;
	}
	#qna3_wrap2{
		width: 1000px;
		height:30%;
		border:1px solid gray;
		margin:auto;
	}
	th,#qna3_q{
	 	height:50px;
	 	text-align:center;
	 }
	 table{
	 	width: 1000px;
		height:70%;
	 	margin:auto;
	 }
	 #qna3_in2{
	 	text-align:right;
	 	margin-right:95px;
	 }
	 #qna3_in1, #qna3_q2{
	 	text-align:center;
	 }
	 p{
	 margin-left:100px;
	 }
	 #qna3_button{
	 	margin-left:770px;
	 }
	 
</style>

</head>
<body>
<br>
 <table border="1">
       <tr>
       		<th>SUBJECT</th>
       		<td colspan="3" id="qna3_q" >적립금 관련 문의드려요!</td>
       </tr>
       
       <tr>
            <th>WRITER</th>
            <td colspan="3" id="qna3_q2">홍길동</td>
        </tr>
        
        <tr>
        	<th>DATE</th>
        	<td id="qna3_q2">2019-10-15</td>
        	<th>VIEWS</th>
        	<td id="qna3_q2">2</td>
        </tr>
        
        <tr>
        <td colspan="4" height="300px">홍길동이 작성한 문의글 내용</td> 
        </tr>
    </table>
    <br>
    
    <div id="qna3_wrap">
   	<span>
     <button type="button" class="btn btn-outline-secondary">LIST</button>
     </span>

     <span>
     <button type="button" class="btn btn-outline-secondary" id="qna3_button">MODIFY</button>
     <button type="button" class="btn btn-outline-secondary">DELETE</button>
   	</span>
   	</div>

	<br>
	<div id="qna3_wrap2">
	<br>
	<p>댓글달기</p>
	<div id="qna3_in1">
	<textarea cols="100" rows="5" style="resize:none" placeholder="관리자만 댓글달기 가능"></textarea>
	</div>
	<br>
	<div id="qna3_in2">
	<button type="button" class="btn btn-outline-secondary">WRITE</button>
	</div>
	<br>
	</div>
	</body>
</html>