

<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbs write</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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

<h1>글쓰기</h1>

<hr>

<div id="app" class="container">

<form action="bbsupload.do" id="frm" method="post" enctype="multipart/form-data">

<table class="table table-hover">
<col width="100px"><col width="500px">

<tr class="table-secondary">
	<th>아이디</th>
	<td>
		<%-- <input type="text" name="id" size="50px" value="<%=login.getId() %>" readonly="readonly">  --%>
		
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId() %>">
	</td>
</tr>
<tr class="table-secondary">
	<th class="align-middle">제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px" class="form-control form-control-lg" placeholder="제목기입">
	</td>
	
</tr>
<tr class="table-secondary">
	<th>파일업로드</th>
	<td>
		<input type="file" id="gdsImg" accept="image/*" onchange="setThumbnail(event);" name="fileload"/>
		<!-- <input type="file" id="gdsImg" name="fileload"> -->
		<div class="select_img"><img src="" /></div>
	</td>
</tr>
<tr>	
	<td colspan="2">
		<textarea rows="18" id="content" name="content" class="form-control" placeholder="내용기입"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="right" style="padding-top: 20px">
		<!-- <input type="submit" value="글쓰기"> -->
		<button type="button" class="btn btn-secondary">글작성 완료</button>
	</td>
</tr>

</table>
</form>

</div>

<!-- <div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img"><img src="" /></div>
</div> -->
 
 <!-- 사진데이터 저장 -->
 
    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
 
<!-- 사진나오게 -->
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
$(document).ready(function() {
	
	$("button").click(function() {
		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
</script>


</body>
</html>







