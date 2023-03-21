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
        margin-top: 20px;
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
        margin: 30px 0 ;
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
<h3>회원정보 수정</h3>
			
	<div>
		<form id="myForm" action="update_mypage.do" method="post">
			<p> 
				<label>ID</label><br> 
				<input type="text" id="id" name="id" readonly value="<%=login.getId() %>"> 
			</p>
			<p>
				<label>Name</label><br> 
				<input type="text" id="name" name="name" required> 
			</p>
			<p>
				<label>Email</label><br> 
				<input type="text" id="email" name="email" required> 
			</p><br><br>
			<p class="update">
				<button type="submit">수정하기</button>
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