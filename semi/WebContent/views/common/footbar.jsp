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
    <!-- 폰트부분 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1f49e42371.js"
	crossorigin="anonymous"></script>
    <!-- 폰트 끝 -->
    <script src="main.js"></script>
    <style>
    .footerdiv{
        width:30%;
        height:100%;
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
    #footp{
    	color:white;
    	margin-top:30px;
    	font-family:'Noto Serif KR', serif;
    }
    #foota{
    	font-family:'Noto Serif KR', serif;
    	color:#858a8d;	
    }
    #foota:hover{
    	color:#858a8d;	
    	text-decoration:none;
    }
    
    </style>
</head>
<body>
    <footer style="width:100%; height:260px; background:#1b1c1d;">
    <div style="width:100%; height:260px; background:#1b1c1d;">
    	<div style="width:984px; height:76px; position:relative;" > <!-- 가로 한줄 -->
    		<div class="rows_1" style="width: 300px; height:80px; float:left;">
    			<p id="footp"> 공방신기 </p>
    			<a href="/semi" id="foota">홈</a>&nbsp;
    			<a href="/semi/shopList.sh" id="foota">공방</a>&nbsp;
    			<a href="/semi/views/classcategory/category.jsp" id="foota">클래스</a>&nbsp;
    			<a href="/semi/views/review/reviewList.jsp" id="foota">리뷰</a>&nbsp;
    			<a href="/semi/views/notice/board.jsp" id="foota">고객센터</a>
    		</div>
    		<div class="rows_2" style="width:300px; height:80px; float:left;">
    		   	<p id="footp">사업자</p>
    			<a href="/semi/views/notice/businessmember.jsp" id="foota">사업자 지원하기</a>
    		</div>
    		<div class="rows_3" style="width:300px; height:80px;float:left;">
    			<p id="footp">고객센터</p>
    			<span style="font-size:15px; font-family:'Noto Serif KR', serif; font-size:12px; color:#858a8d;">오전 10시 ~ 오후 6시 (주말,공휴일 제외)</span><br>
    			<button style="width:250px; height:40px; background:white;"><i class="fab fa-weixin"></i> 문의하기</button>
    		</div>
    	</div>
    	
    	<div> <!--  두번쨰 가로  -->
    		<div style="float:left; margin-top:50px; margin-left:160px;">
    			<span style="color:#858a8d; font-family:'Noto Serif KR', serif; font-size:12px;">Gongbang Inc. Copyright ⓒ KH Company All Rights Reserved  </span><br>
    			<span style="font-size:15px; font-family:'Noto Serif KR', serif; font-size:12px;"><a href="#" id="foota">이용약관</a> | <a href="#" id="foota">개인정보 처리방침</a> | <a href="#" id="foota">사업자 정보 확인</a></span>
    			</span>
    		</div>
    		<div style="width:1000px; height:60px; margin-left:160px; float:left;">
    			<span style="font-align:center; font-size:15px; font-family:'Noto Serif KR', serif; font-size:12px; color:#858a8d;">(주)공방신기 | 대표 이진혁 | 개인정보보호 책임자 이진혁 | 제휴/협력 문의 gongbang@naver.com | 서울특별시 강남구 역삼동 테헤란로 231-7  7층   | 사업자등록번호 : 457-81-00277 | 통신판매업신고 : 2019-서울중구-0087 (주)공방신기는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.</span>
    		</div>
    	
    	</div>
    	
    	
    	
    </div>
    
    
    
    <!-- <div id="footerdiv1" class="footerdiv">
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
    </div> -->
    
    </footer>
</body>
</html>