
<%@page import="ITzy.OTT.dto.QnaDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
<h2>Q&A답변</h2>

	<div style="width: 70%;">

		<table class="table table">
			<col width="20%">
			<col width="80%">

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
			
			<tr>
			<td colspan="2"> <button class="btn btn-secondary" onclick="back()">뒤로가기</button> </td>
			</tr>

		</table>
	</div>

<script type="text/javascript">
function back() {
	location.href = "qnalist.do";
}
</script>

</body>

</html>