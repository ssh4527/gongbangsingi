<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mail.MyAuth" %>
<%@ page import="mail.MailSender" %>

<% 
	String toEmail = (String)request.getAttribute("toEmail");
	String toName = (String)request.getAttribute("toName");
	String subject = (String)request.getAttribute("subject");
	String content = (String)request.getAttribute("content");
	
	MailSender mailSender = new MailSender();
	mailSender.sendMail(toEmail,toName,subject,content);
	
	out.println("메일 전송 완료");
	
%>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	
	<script>
		$(function(){
			alert("입력하신 이메일로 아이디가 전송되었습니다.");
			location.href="<%=request.getContextPath()%>";
		});
	
	</script>
</head>
<body>

</body>

</html>