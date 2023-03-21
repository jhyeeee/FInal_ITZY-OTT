
<%@page import="ITzy.OTT.dto.BbsDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>



<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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
	BbsDto bbs = (BbsDto)request.getAttribute("bbsdto");
	if(login == null){
%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
	</script>
<%
}	
%> 

<h1>상세 글보기</h1>

<hr>

<div id="app" class="container">
	
	<table class="table table-hover">
	<colgroup>
		<col style="width: 150px"/>
		<col style="width: 500px"/>
	</colgroup>
	
	<tr class="table-secondary">	
		<td colspan="2" style="font-size: 22px; font-weight: bold; text-align: center;"><%=bbs.getTitle() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=bbs.getId() %></td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td><%=bbs.getregdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=bbs.getReadcount() %></td>
	</tr>
	<tr>	
		<td colspan="2" style="background-color: white;">
			<%--  <img src="<%=dto.getFilename() %>" /> --%>			 
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<input type="button" value="<%=bbs.getFilename() %>" onclick="filedown(<%=bbs.getSeq() %>, '<%=bbs.getNewfilename() %>', '<%=bbs.getFilename() %>')">
		</td>
	<tr>
	<tr>	
		<td colspan="2" style="background-color: white; text-align: center;">
			<img src="upload/<%=bbs.getNewfilename()%>" style="width:80%;">
			<pre style="font-size: 20px;font-family: 고딕, arial;background-color: white"><%=bbs.getContent() %></pre>
		</td>
	</tr>
	</table>
	
	<br>
	<button type="button" class="btn btn-secondary" onclick="location.href='bbsanswer.do?seq=<%=bbs.getSeq() %>'">답글</button>
	
	<button type="button" class="btn btn-secondary" onclick="location.href='bbslist.do'">글목록</button>
	
	<%
/* 	MemberDto login = (MemberDto)session.getAttribute("login"); */
	if(bbs.getId().equals(login.getId())){
		%>
		<button type="button" class="btn btn-secondary" onclick="updateBbs(<%=bbs.getSeq() %>)">수정</button>
		<button type="button" class="btn btn-secondary" onclick="deleteBbs(<%=bbs.getSeq() %>)">삭제</button>
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
/* 
	function filedown(seq, newfilename, filename) {
		document.file_down.newfilename.value = newfilename;
		document.file_down.filename.value = filename;
		document.file_down.seq.value = seq;
		document.file_down.submit();
		 */
	function updateBbs( seq ) {
		location.href = "bbsupdate.do?seq=" + seq;
	}
	
	function deleteBbs( seq ) {
	    location.href = "bbsdeleteAf.do?seq=" + seq;	// update del=1
	}
	</script>
	
	
	<br><br>
	<%-- 댓글 --%>
	<div id="app" class="container">
	
	<form action="commentWriteAf.do" method="post">
	<input type="hidden" name="seq" value="<%=bbs.getSeq() %>">
	<input type="hidden" name="id" value="<%=login.getId() %>">
	
	<table>
	<col width="1500px"><col width="150px">
	<tr>
		<td>comment</td>
		<td style="padding-left: 30px">올리기</td>
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
<script type="text/javascript">
  $("#gdsImg").change(function(){
  	if(this.files && this.files[0]) {
   		var reader = new FileReader;
    	reader.onload = function(data) {
     	$(".select_img img").attr("src", data.target.result).width(500);     
     	
    }    	
    reader.readAsDataURL(this.files[0]);
    
   }
  });
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./commentList.do",
		type:"get",
		data:{ "seq":<%=bbs.getSeq() %> },
		success:function(list){
			// alert('success');
			// alert(JSON.stringify(list));
			
			$("#tbody").html("");
			
			$.each(list, function(index, item){
				let str = "<tr class='table-info'>"
						+	"<td>작성자:" + item.id + "</td>"
						+   "<td style='text-align:right;'>작성일:" + item.regdate + "</td>"
						+ "</tr>"
						+ "<tr>"
						+	"<td colspan='2'>" + item.content + "</td>"
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











