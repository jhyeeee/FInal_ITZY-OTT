<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@page import="ITzy.OTT.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="ITzy.OTT.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
main{	
		width:1200px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
.table th, .table td {
	vertical-align: middle!important;
}
.wrap{
	position: relative;
}

</style>


<meta charset="UTF-8">

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

</head>
<body>
	<%
	List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnalist");
	%>

	<div class="warp" style="height: 100vh;">
	<button class="btn btn-warning btn-sm" onclick=" wQna()"  style="float: right; margin-right: 0">건의하기</button>
	<p style="margin-left: 5%;">최신 15개의 건의글만 보여집니다</p>
	
		<div align="center">
			<table   class="table table-hover">
				<col width="600">
				<col width="200">
				<col width="200">

				<tr class="table-secondary">
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>

				<%
				if (list == null || list.size() == 0) {
				%>
				<tr>
					<td colspan="3">작성된 글이 없습니다</td>
				</tr>
				<%
				} else {
				for (int i = 0; i < 15; i++) {
					QnaDto dto = list.get(i);
				%>
				<tr>
					<td> <a href="qnadetail.do?seq=<%= dto.getSeq() %>" style="text-decoration-line: none; color: black;">
					<%
					if (dto.getAnsdate() != null) {
					%>	
					<span style="color: red">[답변완료]</span><%=dto.getTitle()%>
					<%	
					}else{
					%>
					<%=dto.getTitle()%>
					<%
					}
					%>
					</a></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getWdate().substring(0, 10)%></td>
				</tr>

				<%
				}
				}
				%>

			</table>

		</div>
	</div>

<script type="text/javascript">


function wQna() {
	location.href = "qnawrite.do";
}

</script>

</body>
</html>