<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@page import="ITzy.OTT.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="ITzy.OTT.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="stylesheet" href="css/common.css"/>
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
<a href="qnawrite.do">건의하기</a>
	<p><b>최신 15개의 건의글만 보여집니다</b></p>

	<div class="content">
		<div align="center">
			<table style="width: 1000px">
				<col width="600">
				<col width="200">
				<col width="200">

				<tr>
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
					<td> <a href="qnadetail.do?seq=<%= dto.getSeq() %>">
					<%
					if (dto.getAnsdate() != null) {
					%>	
					<span style="color: blue">[답변완료]</span><%=dto.getTitle()%>
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

</body>
</html>