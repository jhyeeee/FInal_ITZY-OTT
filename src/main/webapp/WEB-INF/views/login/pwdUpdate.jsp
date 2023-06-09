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
<style type="text/css">
	main{
		margin: 131px auto;
	}
    .mypage_wrap{
        
        width: 400px;
        margin: 60px auto;
        padding: 20px 0;
        border-radius: 20px;
        box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
    }
    #myForm p{
        align: center;
        width: 250px;
        margin:0 auto ;
        margin-top: 30px;
    }
    label{
        font-weight: bold;
        color: #2475f0;
        text-align: left;
        font-size: 18px;
    }
    h3{
        text-align: center;
        font-size: 26px;
        margin-top: 30px;
        margin-bottom: 50px;
    }
    input{
        width: 250px;
        height: 30px;
        margin-top: 10px;
        border: none;
        border-bottom: 2px solid #333;
        font-size: 15px;
    }


    input:focus{
        outline: none;
        background: #d2f1ff;
        border-radius: 5px;
        
        color: #333;
        
    }
    #myForm .update{
        text-align: center;
		margin-top: 40px;
    }
    #myForm .update button{
        padding: 10px 15px;
        border-radius: 5px;
        border: none;
        background: #5494f5;
        color: #fff ;
        cursor: pointer;
    }
</style>
</head>
<body>
<div class="mypage_wrap">
<h3>비밀번호 변경</h3>
			
	<div>
		<form id="myForm" action="pwdupdateAf.do" method="post">
	
			<p> 
				<input class="" type="hidden" id="id" name="id" value="<%= login.getId() %>" readonly> 
			</p>
			<p>
				<label>기존 비밀번호</label><br> 
				<input class="" type="password" id="old_pw" name="old_pwd" value="" required> 
			</p>
			<p>
				<label>새로운 비밀번호</label><br> 
				<input class="" type="password" id="new_pw" name="pwd" value="" required> 
			</p>
			<p>
				<label>새로운 비밀번호 확인</label><br> 
				<input class="" type="password" id="new_pw_chk" name="new_pw_chk" value="" required> 
			</p>
			<p id="pw_ck" style="text-align:center;"></p>
			
			<p class="update">
				<button type="submit" class="">수정하기</button>
			</p>
		</form>
	</div>
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