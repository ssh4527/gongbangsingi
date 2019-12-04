<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>클래스 상세 정보</title>
    <style>
        section, div, header {
            box-sizing: border-box;
            display: block;
        }
        #detail_img{
            width:500px;
            height:400px;
            padding: 30px;
        }
        #outer {
            width: 1000px;
            /* div를 화면 가운데로 오게 하기 */
            height: 2000px;
            margin: auto;
            position:relative;
        }
        #detail_img_div{
            float:left;
        }
        #detail_class_p_title,#detail_class_p_startdate,#detail_class_p_enddate{
            font-size : 25px;  
            text-align: center;
        }
        #interest_btn{
            width: 100px;
            height: 50px;
            float:right;
        }
        #detail_search_btn,#detail_enter_btn{
            padding: 10px;
            width: 180px;
            float: right;
            margin: 10px;
        }
        #detail_detail_div{
            padding: 30px;
            height: 450px;
        }
        #detail_navi{
            background: rgb(204, 200, 200);
            width: 100%;
            height: 50px;
            font-size: 20px;
            padding: 10px;
            margin: auto;
        }
        #detail_detail_content{
            padding: 10px;
        }
        
        a{
            color: black;
        }
        a:hover{
            color: black;
        }
        #detail_come {
            padding: 10px;
            font-weight: bold;
            font-size: 20px;
        }
        #detail_comeimg{
            width: 800px;
            height: 300px;
        }
        #detail_review{
            padding: 10px;
            
            font-size: 20px;
        }
        #detail_warning_p{
            font-weight: bold;
        }
         .positioning {
            border: 1px black solid;
            text-align:center;
        }
        .fixed-area{
            width: 100px;
            height: 120px;
            position: fixed;
            top:500px;
            right:100px;
            box-shadow: 3px 3px 3px;
        }
        .fixed-area>div:hover{
        	background:gray;
        	cursor:pointer;
        }
        #dd {
        	display:none;
        }
        
        
    </style>
    </head>
    <body>
    <div class="positioning fixed-area">
    	<div id="dd">
   		<a href="#detail_detail_div">상세정보</a><br>
   		</div>
   		<div>
        <a href="#detail_review">후기</a><br>
        </div>
        <div>
        <a href="#detail_qna">QnA</a><br>
        </div>
        <div>
        <a href="#detail_warning">유의 사항</a>
        </div>
        <div>
        <a id="pre">이전 페이지</a>	
        </div>
    </div>
            
        <script>
        	$(function(){
        		$("#pre").click(function(){
        			location="<%= request.getContextPath() %>";
        		});
        	});
        </script>
        
    
        <div id="outer">
            <div id="detail_img_div">
                <img src="<%= request.getContextPath()%>/resources/images/jar1.jpg" id="detail_img">
            </div>
            <div id="detail_detail_div">
                <p id="detail_class_p_title">반지만들기</p>
                <p id="detail_class_p_startdate">2019-11-30</p>
                <p id="detail_class_p_enddate">2020-01-20</p>
                <p style="text-align:right">1회 이용시</p>
                <p style="text-align:right">1人 19.900원</p>
                <br>
                <button type="button" class="btn btn-light" id="interest_btn">♡ 125</button><br><br><br>
                <button type="button" class="btn btn-danger" id="detail_search_btn">공방 구경</button>
                <button type="button" class="btn btn-warning" id="detail_enter_btn">클래스 신청하기</button>
            </div>
            
          <script>
          var count = 0;
          		$(function(){
          			$("#detail_img").click(function(){
          				var urlArr = new Array();
          				urlArr[0] =  "<%= request.getContextPath()%>/resources/images/jar2.jpg";
          				urlArr[1] =  "<%= request.getContextPath()%>/resources/images/jar3.jpg";
          				urlArr[2] =  "<%= request.getContextPath()%>/resources/images/city1.PNG";
          				urlArr[3] =  "<%= request.getContextPath()%>/resources/images/jar1.jpg";
          				
          				
          				if(count > 3){
          					count = 0;
          				}
          				$("#detail_img").attr("src",urlArr[count++]);	
          			});
          		});
          </script>

            
          
            

            <div id="detail_detail_content">
                    반지만들기 반지카페8그램을 방문해 주셔서 감사합니다. 저희 반지카페는 고객이 직접 체험하는 반지공방으로 당일 만들어서 바로 가져가실 수 있는 공방입니다.<br>
                    반지, 팔찌, 목걸이 재질은 99.99% 순은이며 반지 1개당 기본가격은 25,000원(폭 2.5mm)으로 반지폭을 증가하거나 탄생석 추가 등에 따라 현장에서 가격이 추가 발생합니다. 은팔찌 기본가격은 40,000원이고 목걸이 기본가격은 60,000만원입니다.<br>
                    현장에서 직접 체험하면서 당일 만들어서 당일 현장에서 바로 가져가실 수 있으십니다. 반지를 만드시는 평균시간은 약 1시간 30분이 소요됩니다. 예약방법은 예약금 없이 네이버 예약시스템을 활용하여 예약하시거나 010-8904-0156으로 문자로 연락주시면 됩니다. 예약 가능한 시간은 오전 11시 부터 오후 8시 20분까지입니다. 반지를 만드시는 시간이 약 1시간 30분이 소요되기 때문에 마지막 오후 8시 20분 이전까지는 꼭 방문하여 주시길 부탁드립니다.
                    아래 일정선택을 통하여 예약 가능하며 기타 자세한 내용은 010-8904-0156으로 연락 주시면 감사하겠습니다.
            </div>
            
           
  
            
            
            
            <div id="detail_come">
                <p>&lt; 오시는길 &gt;</p>
                <img src="sadasd.jpg" id="detail_comeimg">
            </div>

            <div id="detail_review">
                <p>&lt; 후기 &gt;</p>
                <div>
                    ☆☆☆☆☆     3.8/5
                </div>
                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">작성자</th>
                                <th scope="col">별점</th>
                                <th scope="col">날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">3</th>
                                <td>이진혁</td>
                                <td>4</td>
                                <td>2019-12-08</td>
                                <td><div id="dd">하이</div></td>
                            </tr>
                            
                            <tr>
                                <th scope="row">2</th>
                                <td>신승환</td>
                                <td>3</td>
                                <td>2019-12-07</td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td >오재원</td>
                                <td>4</td>
                                <td>2019-12-05</td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-secondary" style="float:right">후기 작성 하기</button>
                </div>
            </div><br><br><br>

            <div id="detail_qna">
                    <p>&lt; QnA &gt;</p>
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>이진혁</td>
                                    <td>예약 취소는 어떻게하나요?</td>
                                    <td>2019-12-06</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>이지은</td>
                                    <td>ㅇㅇ?</td>
                                    <td>2019-12-07</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td >신하은</td>
                                    <td>ㅇㅅㅇ?</td>
                                    <td>2019-12-05</td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-secondary" style="float:right">문의하기</button>
                    </div>
                </div>

                <div id="detail_warning">
                    <p id="detail_warning_p">&lt; 유의사항 &gt;</p>
                    <div id="detail_warning_text">
                        <p>반지를 만드시는 시간이 약 1시간 30분이 소요되기 때문에 마지막 오후 8시 20분 이전까지는 꼭 방문하여 주시길 부탁드립니다.<br>
                                아래 일정선택을 통하여 예약 가능하며 기타 자세한 내용은 010-8904-0156으로 연락 주시면 감사하겠습니다.</p>
                    </div>
                </div>



        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </body>
</html>