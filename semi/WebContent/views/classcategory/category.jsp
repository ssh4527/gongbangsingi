<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
#sortlist {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

.bigWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	left:0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.sort {
	width: 450px;
	height: 500px;
	justify-content: center;
	align-items: center;
	border: 1px solid black;
	background:white;
}
.sort table{
	height:200px;
	width:500px;
}
.sort td{
	padding-left : 30px;
}

.sort table{
	margin-top : -80px;
}
.sort h2{
	padding : 30px;
}
.btn {
	color : white;
	width:400px;
}

.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      #gal{
      	position : relative;
      	width:350px;
      	height:300px;
      	cursor:pointer;
      }
      #heartover{
      	position: relative;
      	overflow:hidden;
      }
      #heartdiv{
      	position: absolute;
      	top:10%;
     	right:0%;
     	transform: translate(-50%, -50%);                                                                   
     	font-size:2em;
     	color: gray;
     	z-index: 2;
     	text-align: center;
     	
      }
      #heart{
      	cursor:pointer;
      }
      
      #gal:hover{
      	transform: scale(1.5,1.5);
      	transition: all 0.5s ease-in-out;
      }
      #whole{
      	animation: fadein 2s;
      }
      
      @keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<!-- 정렬창 보이는 곳 -->
	<div class='bigWrapper'>
		<div class="showWrapper">	
			<!-- 정렬 1 -->
			<div class="sort1 sort">
				<h2>카테고리</h2>
				<br>
				<br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="도자기" id="jar"> <label
								class="custom-control-label" for="jar">도자기</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="액세서리" id="accessory"> <label
								class="custom-control-label" for="accessory">액세서리</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="가구" id="furniture"> <label
								class="custom-control-label" for="furniture">가구</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="향수" id="perfume"> <label
								class="custom-control-label" for="perfume">향수</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="제과" id="cook"> <label
								class="custom-control-label" for="cook">제과</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="원예" id="flower"> <label
								class="custom-control-label" for="flower">원예</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input"
								value="가죽" id="leather"> <label
								class="custom-control-label" for="leather">가죽</label></td>
							<td><input type="checkbox" class="custom-control-input"
								value="기타" id="etc"> <label class="custom-control-label"
								for="etc">기타</label></td>
						</tr>
					</table><br><br><br><br><br><br>
					<button type="button" class="btn btn-warning" id="btnsort1">적용하기</button>
				</div>
			</div>
			
			<!-- 정렬 2 -->
			<div class="sort2 sort">
				<h2>카테고리</h2>
				<br>
				<br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox" class="custom-control-input" value="바로 수강 가능한 클래스" id="sort2_check1">
							<label class="custom-control-label" for="sort2_check1">바로 수강 가능한 클래스</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input" value="현재 오픈중이지 않은 클래스" id="sort2_check2">
							<label class="custom-control-label" for="sort2_check2">현재 오픈중이지 않은 클래스</label></td>
						</tr>
					</table><br><br><br><br><br><br>
					<button type="button" class="btn btn-warning" id="btnsort2">적용하기</button>
				</div>
			</div>
			
			<!-- 정렬 3 -->
			<div class="sort3 sort">
				<h2>카테고리</h2>
				<br>
				<br>
				<div class="custom-control custom-checkbox">
					<table>
						<tr>
							<td><input type="checkbox" class="custom-control-input sort3" value="인기순" id="sort3_check1">
							<label class="custom-control-label" for="sort3_check1">인기순</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="custom-control-input sort3" value="최신순" id="sort3_check2">
							<label class="custom-control-label" for="sort3_check2">최신순</label></td>
						</tr>
					</table><br><br><br><br><br><br>
					<button type="button" class="btn btn-warning" id="btnsort3">적용하기</button>
				</div>
			</div>
			
			
		</div>
	</div>
	<!-- 정렬 리스트 script -->
	<script>
		$(function() {
			// 1번 버튼 누르면...
			$("#sortlist1").click(function() { 
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","inline_block").show();
				$(".sort2").css("display","none");
				$(".sort3").css("display","none");
			});
			
			// 2번 버튼 누르면...
			$("#sortlist2").click(function() {
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","none");
				$(".sort2").css("display","inline_block").show();
				$(".sort3").css("display","none");
			});
			
			// 3번 버튼 누르면...
			$("#sortlist3").click(function() {
				$(".bigWrapper").css("display", "flex").show();
				$(".sort1").css("display","none");
				$(".sort2").css("display","none");
				$(".sort3").css("display","inline_block").show();
			});
			
			$("#sort3_check1").click(function(){
				$("#sort3_check2").prop('checked', false);
			});
			
			$("#sort3_check2").click(function(){
				$("#sort3_check1").prop('checked', false);
			});
			
			// 적용하기버튼 누르면...
			$("#btnsort1").click(function(){
				$(".bigWrapper").css("display","none");
			});
			$("#btnsort2").click(function(){
				$(".bigWrapper").css("display","none");
			});
			$("#btnsort3").click(function(){
				$(".bigWrapper").css("display","none");
				$("#sortlist3").html($(".sort3:checked").val() + " ∨");
			});
		});
	</script>





	<div id="sortlist">
		<a id="sortlist1">카테고리 ∨</a>&nbsp;&nbsp;&nbsp; 
		<a id="sortlist2">상태 ∨</a>&nbsp;&nbsp;&nbsp; 
		<a id="sortlist3">정렬기준 ∨</a>
	</div>
	<hr>
	
	
	
	<!-- 앨범 부분...  -->
	
	<div class="album py-5 bg-light"  id="whole">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/jar1.jpg" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><img src="<%= request.getContextPath() %>/resources/images/EmptyHeart.png" width="50px" height="50px"></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">Dish Factory</small>
    						<p class="card-text" align="left">안녕하세요. 팟하우스 입니다:) 도자기 체험</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥4.2</small>
    							<small class="text-muted">바로 수강 가능</small>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/jar2.jpg" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><p id="heart">♥</p></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">도자기 공방 유일</small>
    						<p class="card-text" align="left">클래스 간략한 소개</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥ 평점? 추천수?</small>
    							<small class="text-muted">12월 2일부터 수강가능</small>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/jar3.jpg" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><p id="heart">♡</p></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">이은영 도자기 공방</small>
    						<p class="card-text" align="left">클래스 간략한 소개</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥ 평점? 추천수?</small>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/city1.PNG" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><p id="heart">♡</p></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">공방 이름</small>
    						<p class="card-text" align="left">클래스 간략한 소개</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥ 평점? 추천수?</small>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/city1.PNG" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><p id="heart">♡</p></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">공방 이름</small>
    						<p class="card-text" align="left">클래스 간략한 소개</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥ 평점? 추천수?</small>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card mb-4 shadow-sm">
    					<div id="heartover">
    						<img src="<%= request.getContextPath() %>/resources/images/city1.PNG" width="100%" height="100%" id="gal">
    						<div id="heartdiv"><p id="heart">♡</p></div>
    					</div>
    					<div class="card-body">
    						<small class="text-muted">공방 이름</small>
    						<p class="card-text" align="left">클래스 간략한 소개</p>
    						<div class="d-flex justify-content-between align-items-center">
    							<small class="text-muted">♥ 평점? 추천수?</small>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    
    
    
    <script>
    	$(function(){
    		$("#heart").click(function(){
    			$(this).text("♥");
    		});
    		
    		$("#gal").click(function(){
    			location.href="<%= request.getContextPath() %>/views/classdetail/detail.jsp";
    		});
    	});
    	
    </script>
    
    <%@ include file="../common/footbar.jsp" %>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>