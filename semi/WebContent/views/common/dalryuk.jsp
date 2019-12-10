<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
request.setCharacterEncoding("utf-8");

int year = 0;
int month = 0;

if(request.getParameter("year") == null || request.getParameter("month") == null){
	//처음
	Calendar nDay = Calendar.getInstance();
	
	year = nDay.get(Calendar.YEAR);
	month = nDay.get(Calendar.MONTH)+1;
} else {
	//입력
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Calendar</title>
<script>
	var selectCalendar = function(){
		
	}
</script>
<style>
	td {
		text-align:center;
		width:14%;
	 }
	 tr{
	 	
	 	
	 }
	

</style>
</head>
<body>
<form action="CalendarEx03.jsp" method="post" name="calendar">
<select name="year">
	<option value="2018" <%= (year == 2018) ? "selected" : "" %> >2018</option>
	<option value="2019" <%= (year == 2019) ? "selected" : "" %> >2019</option>
	<option value="2020" <%= (year == 2020) ? "selected" : "" %> >2020</option>
</select>
년&nbsp;&nbsp;
<select name="month">
	<option value="1" <%= (month == 1) ? "selected" : "" %> >1</option>
	<option value="2" <%= (month == 2) ? "selected" : "" %> >2</option>
	<option value="3" <%= (month == 3) ? "selected" : "" %> >3</option>
	<option value="4" <%= (month == 4) ? "selected" : "" %> >4</option>
	<option value="5" <%= (month == 5) ? "selected" : "" %> >5</option>
	<option value="6" <%= (month == 6) ? "selected" : "" %> >6</option>
	<option value="7" <%= (month == 7) ? "selected" : "" %> >7</option>
	<option value="8" <%= (month == 8) ? "selected" : "" %> >8</option>
	<option value="9" <%= (month == 9) ? "selected" : "" %> >9</option>
	<option value="10" <%= (month == 10) ? "selected" : "" %> >10</option>
	<option value="11" <%= (month == 11) ? "selected" : "" %> >11</option>
	<option value="12" <%= (month == 12) ? "selected" : "" %> >12</option>
</select>
월
<input type="submit" value="조회" onclick="selectCalendar()">
</form>

<%
	int day = 1;
    // 1일 요일
    int START_DAY_OF_WEEK = 0;
    // 마지막 날의 요일
    int END_DAY_OF_WEEK = 0;
    // 마지막 날
    int END_DAY = 0;
   
    Calendar sDay = Calendar.getInstance();
    Calendar eDay = Calendar.getInstance();
   
    sDay.set(year, month-1, 1);
    eDay.set(year, month, 1-1);
   
    START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
    END_DAY_OF_WEEK = eDay.get(Calendar.DAY_OF_WEEK);
    END_DAY = eDay.get(Calendar.DATE);
   
    out.println("<table width='800' border='1'>");
    out.println("<tr>");
    out.println("<td colspan='7'>" + year + "년" + month + "월</td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>SU</td><td>MO</td><td>TU</td><td>WE</td><td>TH</td><td>FR</td><td>SA</td>");
    out.println("</tr>");
   
    out.println("<tr>");
    for(int i=1 ; i<START_DAY_OF_WEEK ; i++) {
        out.println("<td></td>");
    }
   
    for(int i=1, n=START_DAY_OF_WEEK ; i<=END_DAY ; i++, n++) {
        if(n % 7 == 1){    	
        	out.println("<tr>");
        	if(i == day){
            	out.println("<td><b>" + i + "</td>");
        	} else {
        		out.println("<td style=\"color:red;\">" + i + "</td>");
        	}
        } else if(n % 7 == 0){
        	if(i == day){
            	out.println("<td><b>" + i + "</td>");
        	} else{
        		out.println("<td style=\"color:blue;\">" + i + "</td>");
        	}
        	out.println("</tr>");
        } else if(i == day) {
        	out.println("<td><b>" + i + "</td>");
        } else{
        	out.println("<td>" + i + "</td>");
        }
    }
   
    for(int i=END_DAY_OF_WEEK ; i<=6 ; i++) {
        out.println("<td></td>");
    }
    out.println("</tr>");
    out.println("</table>");
%>
</body>
</html>
