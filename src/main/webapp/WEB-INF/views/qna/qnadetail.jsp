
<%@page import="ITzy.OTT.dto.QnaDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
main{	
		width:1200px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
table, th, td {
	border-collapse: collapse;
	border: rgb(128, 128, 128) solid 1px;
}

th {
	background-color: rgb(0, 0, 192);
	color: white;
}

td {
	padding: 10px;
}

.content {
	font-size: 24px;
}
</style>
<%
MemberDto login = (MemberDto) session.getAttribute("login");
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
QnaDto dto = (QnaDto) request.getAttribute("dto");
%>
</head>
<body>

	<div align="center">

		<table>
			<col width="200">
			<col width="500">

			<tr>
				<th>아이디</th>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=dto.getContent()%></td>
			</tr>

			<%
			if ( dto.getAnsdate() != null) {
			%>
			<tr>
				<th>답변날짜</th>
				<td><%=dto.getAnsdate().substring(0, 10)%></td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td><p style="color: blue;"><%=dto.getAnswer()%></p></td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<th>답변내용</th>
				<td><p style="color: red;">답변 대기중입니다</p></td>
			</tr>

			<%
			}
			%>



		</table>
	</div>

</body>

</html>