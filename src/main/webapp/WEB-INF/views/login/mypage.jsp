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
<link rel="stylesheet" href="css/common.css"/>
<style type="text/css">
	main{	
		width:1200px;
		margin: 93px auto;
		
	}
    .mypage_wrap{
        
        width: 400px;
        margin: 0 auto;
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
        font-size: 30px;
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
    input:hover{
        cursor: pointer;
    }
    input:focus{
        outline: none;
    }
    .form1{
        text-align: center;
        width: 300px;
        margin: 0 auto;
        margin-bottom: 30px;
    }
    .form1 a{
        color: #77a9f5;
        padding: 0 20px;
    }
</style>
</head>
<body>
<div class="mypage_wrap">
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
					<input class="" type="text" id="name" name="name" readonly  value="<%=dto.getAuth() == 2 ? dto.getName():dto.getCompany() %>" > 
				</p>
				<p>
					<label>Email</label><br>
					<input class="" type="text" id="email" name="email" readonly  value="<%=dto.getEmail() %>" > 
				</p><br><br>
				
			</form>
            <p class="form1">
                <a href="pwdUpdate.do">비밀번호 변경</a>
                <a href="mypageUpdate.do">회원정보 변경</a>
            </p>
		</div>
    </div>
</body>
</html>