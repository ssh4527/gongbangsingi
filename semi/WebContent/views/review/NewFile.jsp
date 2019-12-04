<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    .starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
</div>

<script type="text/javascript">
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script>
</body>
</html>