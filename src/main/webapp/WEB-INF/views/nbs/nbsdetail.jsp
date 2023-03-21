<%@page import="ITzy.OTT.dto.NbsDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  -->
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  
  <style type="text/css">
  	th{
  		background-color: #007bff;
  		text-align: center;
		vertical-align: middle!important;
  	}
  	.table-info {
  		    --bs-table-bg: #dee2e6;
  		    --bs-table-border-color: #000;
  	}
  	pre{
  		white-space: pre-wrap;
  		word-break: break-all;
  		overflow: auto;
  		text-align: left;
  	} 	
  </style>  
</head>

<body>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	NbsDto nbs = (NbsDto)request.getAttribute("nbs");
		if(login == null){
%>
		<script>
		alert('로그인 해 주십시오');
		location.href = "login.do";
		</script>
	<%
	}	
	%>  





<div id="app" class="container">

	<table class="table table-hover">
	<colgroup>
		<col style="width: 150px"/>
		<col style="width: 500px"/>
	</colgroup>
	
	<tr class="table-secondary">
		<td colspan="2" style="font-size: 22px; font-weight: bold; text-align: center;"><%=nbs.getTitle() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=nbs.getId() %></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<button type="button" class="btn btn-secondary"
			 onclick="filedown(<%=nbs.getSeq() %>, '<%=nbs.getNewfilename() %>', '<%=nbs.getFilename() %>')">
			 <%=nbs.getFilename() %>
			 </button>
		</td>
	<tr>
		<th>등록일</th>
		<td><%=nbs.getRegdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=nbs.getReadcount() %></td>
	</tr>
	<tr>
		<th>총 다운로드</th>
		<td><%=nbs.getDowncount() %></td>
	</tr>
	
	<tr>
		<td colspan="2" style="background-color: white; text-align: center;">
			<img src="upload/<%=nbs.getNewfilename()%>" style="width:80%;"><br><br><br>
			<pre style="font-size: 20px; font-family: 고딕, arial; background-color: white;"><%=nbs.getContent() %></pre>
		</td>
	</tr>
	</table>
	
	<br>
	
	<button type="button" class="btn btn-secondary" onclick="location.href='nbslist.do'">목록</button>


<%
		if(nbs.getId().equals(login.getId())){
%>	
	<button type="button" class="btn btn-secondary" onclick="location.href='nanswer.do?seq=<%=nbs.getSeq() %>'">추가공고</button>
	<button type="button" class="btn btn-secondary" onclick="updateNbs(<%=nbs.getSeq() %>)">수정</button>	
	<button type="button" class="btn btn-secondary" onclick="deleteNbs(<%=nbs.getSeq() %>)">삭제</button>
	<%
		}
	%>

</div>
	<form name="file_down" action="nfiledownload.do" method="post">
		<input type="hidden" name="newfilename">
		<input type="hidden" name="filename">
		<input type="hidden" name="seq">
	</form>
<br><br>

<script type="text/javascript">
	function filedown(seq, newfilename, filename) {
		document.file_down.newfilename.value = newfilename;
		document.file_down.filename.value = filename;
		document.file_down.seq.value = seq;
		document.file_down.submit();
	}
	function updateNbs( seq ) {
		location.href = "nbsupdate.do?seq=" + seq;
	}
	function deleteNbs( seq ) {
		location.href = "nbsdeleteAf.do?seq=" + seq;  
	}
</script>


<!-- 댓글  -->
<div id="app" class="container">
	<form action="ncommentWriteAf.do" method="post">
	<input type="hidden" name="seq" value="<%=nbs.getSeq() %>">
	<input type="hidden" name="id" value="<%=login.getId() %>">
		<table>
		<col width="1500px"><col width="150px">
			<tr>
				<td>comment</td>
			</tr>
			<tr>
				<td>
					<textarea rows="3" class="form-control" name="content"></textarea>
				</td>
				<td style="padding-left: 30px">
					<button type="submit" class="btn btn-secondary">완료</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<table class="table table-sm">
	<col width="500"><col width="500">
		<tbody id="tbody">	
		</tbody>
	
	</table>
</div>
<br>
<br>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url:"./ncommentList.do",
			type:"get",
			data:{ "seq": <%=nbs.getSeq() %> },
			success:function(list){
// 				alert(JSON.stringfy(list));
				$("#tbody").html("");
				
				$.each(list, function(index, item){
					let str = "<tr class='table-info'>"
							+ 	"<td>작성자:" + item.id + "</td>"
							+ 	"<td style='text-align:right;'>작성일:" + item.regdate + "</td>"
							+ "</tr>"
							+ "<tr>"
							+ 	"<td colspan='2'>" + item.content + "</td><br>"
							+ "</tr>";
					$("#tbody").append(str);					
				});
			},
			error:function(){
				alert('error');
			}
		});
	});


</script>




</body>
</html>



