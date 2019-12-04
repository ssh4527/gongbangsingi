<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  ★문의글 쓰기(고객센터/공방)★ -->
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    #qna4_wrap{
        width: 1000px;
        height: 900px;
        margin:auto;
    }
    
    #qna4_wrap2{
    	text-align:center;
    }
    </style>
</head>
<body>
<body>
                
    <div id="qna4_wrap">
        <br>
        <br>
     <!-- <table class="table table-dark table-striped"> -->
            <table class="table table-hover">
                    <tr>
                        <th>문의</th>
                        <td>고객섹터문의 <공방 관련 문의는 각 공방 페이지에서 해주세요></td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                    	<td><textarea cols="60" rows="1" style="resize:none" placeholder="제목을 입력해주세요"></textarea></td>
                    </tr>
                    <tr>
                    	<th>내용</th>
                    	<td><textarea cols="60" rows="8" style="resize:none" placeholder="내용을 입력해주세요"></textarea></td>
                    </tr>
                    <tr>
                    	<th>파일첨부</th>
                    	<td>  <input type="file">
                    	<input type="button" value="추가" onclick="addFile()">
       					<input type="button" value="삭제" onclick="delFile()">
       				    </td>
                    <tr>
                </table>
                <hr>
                
                
        <script>
       	
        function addFile(){
            $("input:last").after("<br><input type=file>");
            
        }
        function delFile(){
        	
                $("input:file:last").remove();
                $("br:last").remove();
        }
    	</script>
                
         <div id="qna4_wrap2">
         <button type="button" class="btn btn-outline-secondary">WRITE</button>
         <button type="button" class="btn btn-outline-secondary">CANCEL</button>
         </div>
</body>
</html>