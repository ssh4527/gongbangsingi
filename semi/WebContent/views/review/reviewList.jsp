<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<style>
	#reviewTable{
		width:70%;
		margin:auto;
	}

</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<br><br>
	<table class="table table-hover" id="reviewTable">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">클래스</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>반지만들기</td>
				<td>너무 좋아요</td>
				<td>신승환</td>
				<td>12/06</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>반지만들기</td>
				<td>너무 좋아요</td>
				<td>신승환</td>
				<td>12/06</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>반지만들기</td>
				<td>너무 좋아요</td>
				<td>신승환</td>
				<td>12/06</td>
			</tr>
		</tbody>
	</table>
	<br>
	<script>
		$(function(){
			$("tbody tr td").click(function(){
				var $nexttr = $("<tr>");
				var $contenttd = $("<td>").text("내용");
				var $texttd = $("<td cols='4'>").text("테스트 내용");
				$nexttr.append($contenttd);
				$nexttr.append($texttd);
				console.log($(this).parent().html());
				$(this).parent().add($nexttr);
				
				
				
			});
		});
		
	
	</script>
	<nav aria-label="Page navigation example">
  <ul class="pagination" style="margin-left:550px;">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	<!-- 검색 -->
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">클래스</option>
			</select>
			<input type="search">
			<button id="searchBtn" type="submit">검색하기</button>
			
		</div>
		
	<%@ include file="../common/footbar.jsp"%>
</body>
</html>