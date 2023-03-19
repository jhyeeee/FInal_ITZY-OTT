<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%
    MemberDto dto = (MemberDto)request.getAttribute("mypage");	
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null){
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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<div class="mypage_wrap">
<h3>회원정보 수정</h3>
			
	<div>
		<form id="myForm" action="update_mypage.do" method="post">
			<p> 
				<label>ID</label><br> 
				<input class="" type="text" id="id" name="id" readonly value="<%=login.getId() %>"> 
			</p>
			<p>
				<label>Name</label><br> 
				<input class="" type="text" id="name" name="name" required> 
			</p>
			<p>
				<label>Email</label><br> 
				<input class="" type="text" id="email" name="email" required> 
			</p><br><br>
			<p class="">
				<button type="submit" class="">수정하기</button>
			</p>
		</form>
	</div>
</div><!-- mypage_wrap -->

	<script type="text/javascript">
	$(document).ready(function() {
		$("button").click(function() {
			
			if($("#name").val().trim() == "" ){
				alert("이름을 기입해 주십시오");
				return;
			}else if($("#email").val().trim() == "" ){
				alert("이메일을 기입해 주십시오");
				return;
			}else{
				$("#myForm").submit();
			}		
		});	
	});
	</script>
</body>
</html>