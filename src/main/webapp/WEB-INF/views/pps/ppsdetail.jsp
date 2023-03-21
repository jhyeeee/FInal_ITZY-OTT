<%@page import="ITzy.OTT.dto.PpsDto"%>
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
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
 -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  
  <style type="text/css">
  main{	
		width:1200px;
		margin: 0 auto;
		margin-bottom: 80px;
	}
<<<<<<< HEAD
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
=======
  	th{
  		background-color: #007bff;
  		color: white;  		
  	}
  	
  	pre{
  		white-space: pre-wrap;
  		word-break: break-all;
  		overflow: auto;
  	}  
  	img{
  		width:50%;
  		margin:20px 0;
  	}	
>>>>>>> e27c74386f7df04fd1e3def8137d80a65ad92176
  </style>
</head>
<body>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	PpsDto pps = (PpsDto)request.getAttribute("pps");
		if(login == null){
%>
		<script>
		alert('로그인 해 주십시오');
		location.href = "login.do";
		</script>
	<%
	}	
	%>  

<h1>자세히 보기</h1>
<hr>


<div id="app" class="container">

	<table class="table table-hover">
	<colgroup>
		<col style="width: 150px"/>
		<col style="width: 500px"/>
	</colgroup>
	
	<tr class="table-secondary">
	<tr>
		<td colspan="2" style="font-size: 22px; font-weight: bold; text-align: center;"><%=pps.getTitle() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=pps.getId() %></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<input type="button" value="<%=pps.getFilename() %>">
		</td>
	<tr>
		<th>등록일</th>
		<td><%=pps.getRegdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=pps.getReadcount() %></td>
	</tr>
	<tr>
		<th>총 다운로드</th>
		<td><%=pps.getDowncount() %></td>
	</tr>
	
	<tr>
		<td colspan="2" style="background-color: white;">
			<img alt="portfolio" src="./upload/<%=pps.getNewfilename() %>">
			<pre style="font-size: 20px; font-family: 고딕, arial; background-color: white;"><%=pps.getContent() %></pre>
		</td>
	</tr>
	</table>
	
	<br>
	<!-- 답글 보류 -->
	<button type="button" class="btn btn-secondary" onclick="location.href='ppslist.do'">목록</button>


<%
		if(pps.getId().equals(login.getId())){
%>	
	<button type="button" class="btn btn-secondary" onclick="updatePps(<%=pps.getSeq() %>)">수정</button>	
	<button type="button" class="btn btn-secondary" onclick="deletePps(<%=pps.getSeq() %>)">삭제</button>
	<%
		}
	%>

</div>
	<form name="file_down" action="filedownload.do" method="post">
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
	function updatePps( seq ) {
		location.href = "ppsupdate.do?seq=" + seq;
	}
	function deletePps( seq ) {
		location.href = "ppsdeleteAf.do?seq=" + seq;  
	}
</script>


<!-- 댓글  -->





</body>
</html>



