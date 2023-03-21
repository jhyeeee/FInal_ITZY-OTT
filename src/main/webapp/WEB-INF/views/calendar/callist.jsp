

<%@page import="java.util.List"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@page import="ITzy.OTT.util.CalUtil"%>
<%@page import="ITzy.OTT.dto.CalDto"%>
<%@page import="ITzy.OTT.dao.CalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
</script>
<%
}
%> 
<%
List<CalDto> list = (List<CalDto>)request.getAttribute("list");
%>
<style>
	main{	
		width:1200px;
		margin: 0 auto;
		margin-top: 80px;
	}
	h2{
		font-size: 26px;
		margin: 30px 0;
		text-align:center;
	}
	.cal_wrap{
		width: 800px;
		margin: 30px auto;
		padding: 30px;
		border-radius: 20px;
		box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
	}
	table{
		margin: 50px auto;
		border-collapse: collapse;
		border-spacing: 0 10px;
		
	}
	th{
		padding:10px 0;
	}
	td{
		cursor:pointer;
		padding:10px 0;
		text-align: center;
	}
	td a:hover{
		color:#28a0ff;
	}
	a{
		text-decoration: none;
	}
	button{
		display: block;
		margin: 50px auto;
		align-items: center;
		text-align:center;
		background: #777;
		border: 0;
		border-radius: 5px;
		color: #fff;

		padding:7px 13px;
		font-size: 16px;
		cursor: pointer;
	}
</style>
<body>


<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
%>

<h2><%=year %>년 <%=month %>월 <%=day %>일의 일정</h2>
<hr>
<br>


<div class="cal_wrap">
<table border="1">
<col width="450"><col width="300">

<tr>
	<th>제목</th>
	<th>일정</th>
</tr>
<%
	if(list == null || list.size() == 0){
		out.print("<tr><td colspan='2'>--- 작성된 일정이 없습니다 ---</td></tr>");
	}else{
		for(CalDto dto:list){
			%>
			<tr>
				<td><a href=caldetail.do?seq=<%=dto.getSeq() %> ><%=dto.getTitle()%> </a></td>
				<td><%=CalUtil.toDates(dto.getRdate())%> </td>				
			</tr>
			<%
		}
	}
%>

</table>
<button type="button" onclick="location.href='calendar.do'">목록</button> 

</div>



<%!

%>

</body>
</html>