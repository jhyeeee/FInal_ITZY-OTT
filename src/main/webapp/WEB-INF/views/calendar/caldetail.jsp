
<%@page import="ITzy.OTT.dao.CalDao"%>
<%@page import="ITzy.OTT.util.CalUtil"%>
<%@page import="ITzy.OTT.dto.CalDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

<style type="text/css">
	main{	
		width:1200px;
		margin: 0 auto;
		margin-bottom: 80px;
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
	table{
		width: 100%;
		border-collapse: separate;
		border-spacing: 0 10px;
	}
	table, th, td{
		
		
	}

	th{
		font-size: 20px;
		padding: 10px 0;
	}
	td{
		border-bottom: 1px solid #333;
	}
	.content{
		font-size: 18px;
		padding: 10px;
		background: #eee;
		height:100px;
		border-radius: 20px;
	}

	tr:last-child td{
		border: none;
		
	}
	tr{
		margin: 10px 0;
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
	.btn{
		width: 250px;
		margin:0  auto;
		align-items: center;
	}
	button{
		text-align:center;
		background: #28a0ff;
		border: 0;
		border-radius: 5px;
		color: #fff;
		margin: 0 10px;
		margin-top: 20px;
		padding:7px 13px;
		font-size: 16px;
		cursor: pointer;
	}
	button:nth-child(2){
		background: #ff5a5a;
	}
	button:nth-child(3){
		background: #777;
	}
	

</style>
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

int seq = Integer.parseInt( request.getParameter("seq") );
CalDto dto = (CalDto)request.getAttribute("caldetail");
%>   
<body>

<div class="cal_wrap">
<h2>일정보기</h2>





<table>

<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>일정</th>
	<td><%=CalUtil.toDates(dto.getRdate()) %></td>
</tr>
  <tr></tr>
<tr >	
	<th>내용</th>
	<td colspan="2" valign="top" class="content"><%=dto.getContent() %></td>
</tr>
</table>
<br>
<div class="btn">
<button type="button" onclick="calUpdate(<%=dto.getSeq() %>)">수정</button>

<button type="button" onclick="calDelete(<%=dto.getSeq() %>)">삭제</button>
<button type="button" onclick="calendar()">목록</button>
</div>
</div>

<script type="text/javascript">
function calUpdate(seq) {
	location.href = "calupdate.do?seq=" + seq;
}
/* function calDelete(seq) {
	location.href = "caldelete.do?seq=" + seq;
} */
function calDelete(seq) {

	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

		 location.href = "caldelete.do?seq=" + seq;

	 }else{   //취소

	     return false;

	 }

}
function calendar() {
	location.href = "calendar.do";
}

</script>

</body>
</html>











