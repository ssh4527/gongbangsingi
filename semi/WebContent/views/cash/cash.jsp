<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int resNop = (int)request.getAttribute("resNop");
	int totalprice = (int)request.getAttribute("totalprice");
	String cId = (String)request.getAttribute("cId");
	String time = (String)request.getAttribute("time");
	String wcNo = (String)request.getAttribute("wcNo");
	String resdate = (String)request.getAttribute("resdate");
	String title = (String)request.getAttribute("title");
	String username = (String)request.getAttribute("username");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		var IMP = window.IMP;
		IMP.init('imp73257997');
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'vbank',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '<%= username %>',
			amount : <%= totalprice %>,
			buyer_email : 'iamport@siot.do',
			buyer_name : '<%= username %>',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				/* msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num; */
				location.href = "<%= request.getContextPath() %>/insert.reservation?resNop=<%=resNop%>&totalprice=<%=totalprice%>&cId=<%=cId%>&time=<%=time%>&wcNo=<%=wcNo%>&resdate=<%=resdate%>";
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href = "<%= request.getContextPath() %>";
			}

			alert(msg);
		});
	</script>

</body>
</html>