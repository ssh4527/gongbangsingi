<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");
    
%>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>공방신기에 오신걸 환영합니다.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        /* *{
            border:1px solid red;
        } */
        body{
           
            width:1300px;
            margin:auto;
            /*border: 1px solid black;*/
        }
    #logoimg{
        margin-top:18%;
    }
    #searchdiv{
        width:100%;
        height:50px;
        margin-top: 18%;
    }
    #searchinput{
        width: 60%;
        height: 100%;
        margin:0px;
        padding: 0px;
    }
    #searchbtn{
        width:10%;
        height:100%;
    }
    #nav >ul{
        list-style: none;
        border:1px solid red;
    }
    .nav-link{
        text-align: center;
        width:200px;
        margin-left:100px;
    }
    #logindiv{
        float: left; 
        width:24%; 
        height:100%;
        
    }
    #loginform{
        background-color: lightgrey;
        width:80%;
         height:70%;
          margin:30px; 
          margin-top:50px;
        
    }
   #loginbtn{
       font-size: 85%;
   }
   .searchspan{
       margin-top:10px;
       float:left;
       margin-right:15px;
   }
    </style>
</head>
<body>
    <div id="menubar" style="width:1300px; height:300px">
        <div id="mainlogo" style="width:14%; height:100%; float: left; margin-right:40px; margin-left:30px;">
            <img src="../4_JQuery/image/cute1.gif" id="logoimg" style="width:100%; height:70%">
        </div>
        <div id="middlediv" style="float: left; width:54%; height: 100%; margin-right:30px;">
            <div id="searchdiv">
                <input type="text" placeholder="클래스를 검색해주세요." id="searchinput"style="margin-left:80px;margin-right:20px;"> 
                <button type="button" id="searchbtn">검색</button>
            </div>
            <div style="width:70%; height:50px; margin-left:80px;">
                <span class="searchspan">인기 검색어 : </span>
                <span class="searchspan">도자기</span>
                <span class="searchspan">반지</span>
                <span class="searchspan">악세사리</span>
                <!-- span 태그에 온클릭 달아서 눌르면 그 단어로 검색되게 펑션처리 해야함-->
            </div>
        </div>
        <div id="logindiv">
        <% if(loginUser == null) {%>
            <form id="loginform" method="post" >
                <div id="idpwddiv" style="width:63%; height:60%; float: left; margin:5%; margin-right:2%;">
                    <div id="iddiv" style="width:90%; height:40%; margin:5%; ">
                        <input type="text" id="idinput" style="width:100%; height:100%;">
                    </div>
                    <div id="pwddiv"style="width:90%; height:40%; margin:5%;">
                        <input type="password" id="pwdinput" style="width:100%; height:100%;">
                    </div>
                </div>
                <div id="loginbtndiv"style="width:25%;height:60%; float: left; margin:5%; margin-left:0%;">
                    <button id="loginbtn" type="submit" style="width:100%; height:89%; margin-bottom:5%; margin-top:10%;" >로그인</button>
                </div>
                <div id="newmemberdiv">
                        &nbsp;&nbsp;<a href="">회원가입</a> / <a href="">아이디</a>, <a href="">비밀번호</a>찾기
                    <!-- if 문 추가하기 -->
                </div>
            </form>
		<% } else {  %>
		
		
		<% } %>
        </div>
    </div>
    <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link" href="#">공방</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/views/classcategory/category.jsp">클래스</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#">리뷰</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="#">고객센터</a>
            </li>
          </ul>
</body>
</html>