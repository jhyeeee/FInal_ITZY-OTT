<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%
    MemberDto dto = (MemberDto)request.getAttribute("pwdUpdate");	
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

</head>
<body>
<h3>비밀번호 변경</h3>
			
	<div>
		<form id="myForm" action="pwdupdateAf.do" method="post">
	
			<p> 
				<input class="" type="hidden" id="id" name="id" value="<%= login.getId() %>" readonly> 
			</p>
			<p>
				<label>기존 비밀번호</label><br> 
				<input class="" type="password" id="old_pw" name="pwd" value="" required> 
			</p>
			<p>
				<label>새로운 비밀번호</label><br> 
				<input class="" type="password" id="new_pw" name="new_pwd" value="" required> 
			</p>
			<p>
				<label>새로운 비밀번호 확인</label><br> 
				<input class="" type="password" id="new_pw_chk" name="new_pwd_chk" value="" required> 
			</p>
			<p id="pw_ck" style="margin-left: 10px;"></p>
			<br><br>
			<p class="">
				<button type="submit" class="">수정하기</button>
			</p>
		</form>
	</div>
	
	<script type="text/javascript">
	$(function() {
		$('#new_pw').keyup(function() {
			$('#pw_ck').text('');
		});

		$('#new_pw_chk').keyup(function() {

			if ($('#new_pw').val() != $('#new_pw_chk').val()) {
				$("#pw_ck").css("color", "#ff0000");
				$('#pw_ck').text('비밀번호 일치하지 않음');

			} else {
				$("#pw_ck").css("color", "#0000ff");
				$('#pw_ck').text('비밀번호 일치');

			}

		});
	});
	
	$(function() {
	    $('#myForm').submit(function(event) {
	        var old_pw = $('#old_pw').val();
	        var dto_pwd = '<%= dto.getPwd() %>';

	        if (old_pw != dto_pwd) {
	            alert('기존 비밀번호가 일치하지 않습니다.');
	            event.preventDefault();
	        }
	    });
	});
	</script>
</body>
</html>