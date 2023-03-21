
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@page import="ITzy.OTT.dto.CalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
	main{	
		width:1200px;
		margin: 0 auto;
		margin-top: 80px;
	}
	.cal_wrap{
		width: 700px;
		margin: 50px auto;
		padding:30px;
		border-radius: 20px;
        box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
	}
	h2{
		text-align: center;
		font-size: 30px;
		
	}
	form{
		width: 100%;
	}
	table{
		padding: 0 20px;
	}
	table, th, td{
		border-collapse : collapse;
		
	}

	th{
		font-size: 20px;
		padding: 5px 20px;
	}
	td{
		border-bottom: 1px solid #333;
	}
	.cal_txt td{
		border: none;
	}
	tr:nth-child(4) td{
		border: none;
	}
	tr:last-child td{
		border: none;
	}
	input#title{
		width:580px;
	}
	input{	
		border:none;
		font-size: 16px;
	}
	input:focus{
		outline: none;
		
	}
	textarea{
		margin-top:10px;
		padding:10px;
		width: 580px;
		height:200px;
		font-size: 16px;
	}
	button{
		background: #28a0ff;
		border: 0;
		border-radius: 5px;
		color: #fff;
		margin-top: 20px;
		padding:7px 13px;
		font-size: 16px;
		cursor: pointer;
	}
	

</style>
</head>
<%	
CalDto dto = (CalDto)request.getAttribute("caldetail");
int seq = Integer.parseInt(request.getParameter("seq"));


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
<body>


<div class="cal_wrap">
<h2>일정수정</h2>

<form action="calupdateAf.do" id="frm" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
<table >
<col width="200"><col width="500">
<tr>
	<th>작성자</th>
	<td>
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId()%>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" >
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<input type="date" name="date" id="date">&nbsp;
		<input type="time" name="time" id="time">
		
	</td>
</tr>
<tr>
	<th class="cal_txt">내용</th>
	<td>
		<textarea  id="content" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button">일정수정</button>
	</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("button").click(function() {
		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else if($("#date").val().trim() == "" ){
			alert("날짜을 기입해 주십시오");
			return;
		}else if($("#time").val().trim() == "" ){
			alert("시간을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
</script>


</body>
</html>