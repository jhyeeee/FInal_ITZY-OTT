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
<title>mypage</title>
</head>
<body>

				<h3>My Page</h3>
			
			<div>
				<form id="myForm" action="update_mypage.do" method="post">
					<p>
						<label>ID</label><br>
						<input class="" type="text" id="id" name="id" readonly value="<%=login.getId() %>"> 
					</p>
					<p>
						<label>Password</label> <br>
						<input class="" type="password" id="pwd" name="pwd"readonly  value="<%=dto.getPwd() %>" > 
					</p>
					
					<p>
						<label>Name</label> <br>
						<input class="" type="text" id="name" name="name" readonly  value="<%=dto.getName() %>" > 
					</p>
					<p>
						<label>Email</label><br>
						<input class="" type="text" id="email" name="email" readonly  value="<%=dto.getEmail() %>" > 
					</p><br><br>
					<p class="form1">
						<a href="pwdUpdate.do">비밀번호 변경</a>
						<a href="mypageUpdate.do">회원정보 변경</a>
					</p>
				</form>
			</div>
</body>
</html>