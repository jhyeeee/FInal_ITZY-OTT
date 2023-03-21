<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A write</title>


<%
MemberDto login = (MemberDto) session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
</script>
<%
}
%>

</head>
<body>
	

	<form action="qnawriteAf.do" method="post" id=frm>
		<div align="center" style=" height: 100vh;">
		<h2>Q&A등록</h2>
			<table class="table table" style="width: 70%;">
				<col width="20%">
				<col width="80%">
				<tr>
					<th>아이디</th>
					<td><%=login.getId()%> <input type="hidden" name="id"
						value="<%=login.getId()%>"></td>
				</tr>
				<tr>
					<th>건의유형</th>
					<td><select id=qtype name=qtype>
							<option value='일반질문'>일반질문</option>
							<option value='회원문의'>회원문의</option>
							<option value='공고문의'>공고문의</option>
							<option value='오류신고'>오류신고</option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="80" id="title" name="title">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="80" id="content" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" id=btn class="btn btn-secondary">질문등록</button>
					</td>
				</tr>

			</table>
		</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn").click(function() {

				if ($("#title").val().trim() == "") {
					alert("제목을 기입해 주십시오");					
				} else if ($("#content").val().trim() == "") {
					alert("내용을 기입해 주십시오");				
				} else {
					$("#frm").submit();
				}
			});
		});
	</script>

</body>
</html>