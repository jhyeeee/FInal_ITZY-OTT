<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
*{
    margin: 0;
    padding: 0;
}
	body{
		height: 100%;
	}
	a{
		color:#333;
		margin: 0;
		padding:0;
	}
    #header_wrap{
        width:1200px;
        margin: 0 auto;
        height: 100%;       
        font-size: 18px;
        position: relative;
        color: #333;
    }
    #header_wrap a{
        text-decoration: none;
    }
    .logo_nav{
    	width: 100%;
    	height:130px;
        display: flex;
        margin: 0 auto;
        overflow: hidden;
    }
    .logo_nav .logo{
        width: 25%;
    }
    .logo_nav .logo h1{
    	vertical-align: top;
        margin: 0;
    }
    .logo_nav .logo h1 a{
    	display: block;
    }
    .nav{
        width:75%;

    }
    .nav ul{
     	width:100%;
        height: 100%;
        display: flex;
        padding: 0;
        justify-content: space-around;
        margin: 0;
        align-items: center;
    }
    .nav ul li{
        display: inline-block;
    }
    .nav ul li a{
        display: block;
        font-size: 23px;
        color: #333;
        font-weight: bold;
    }
    .nav ul li a:hover{
        color: #ffd400;
    }
    h1{
		height: 100%;
    	margin: 0;
    }

    .logo img{
		width: 130px;
		border: 0;
    }
    li{
        list-style: none;
    }

    .login p{
		text-align: right;    	
    	margin: 0;
    }
    .login p:nth-child(1){
    	font-size: 20px;
    }
    .login p:nth-child(1) a{
    	font-size: 18px;
    }
    .login a{
    	margin-right: 10px;

    }
	.login{
	vertical-align: middle;
		width: 100%;
		display: flex;
		justify-content: flex-end;
	}
	.login img{
		width: 30px;
	}
</style>
</head>
<body>
<header>
	<div id="header_wrap">
        <div class="login_wrap">
            <div class="login">
			  <%
			  MemberDto login = (MemberDto)session.getAttribute("login");
			    if(login == null){
			  %>
			  <p><a href="login.do">로그인</a></p>
			  <%
			    }else{
			  %>
			  <p><%=login.getId()%>님 환영합니다! &nbsp&nbsp&nbsp<a href="sessionOut.do">로그아웃&nbsp&nbsp&nbsp</a></p>
			  <a href="mypage.do"><img alt="mypage" src="./images/mypage.png"></a>
			  <% 
			    }
			  %>
			</div>
        </div>
        <div class="logo_nav">
            <div class="logo">
                <h1><a href="main.do"><img src="./images/logo.png" alt=""></a></h1>
            </div>
            <div class="nav">
                <ul>
                    <li>
                        <a href="nbslist.do">오디션 공고</a>
                    </li>
                    <li>
                        <a href="bbslist.do">커뮤니티</a>
                    </li>
                    <li>
                        <a href="ppslist.do">배우 프로필</a>
                    </li>
                    <li>
                        <a href="calendar.do">일정관리</a>
                    </li>
                    <li>
                        <a href="qnalist.do">Q&A</a>
                    </li>
                </ul>
            </div>
        </div>

</div>	
</header>
</body>
</html>