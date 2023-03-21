<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
}
	a{
		text-decoration: none;
	}
	h1{
		height: 130px;
		margin: 0;
		padding: 0;
	}
	footer{
	display:block;
	width: 100%;
    height: 130px;
    position: absolute;
    bottom: 0;
    left: 0;
    background: #eee;
		
	}
	#footer_wrap{
		width: 1200px;
		margin: 0 auto;
		display: flex;
	}
	#footer_wrap .logo{
		width: 50%;
		height: 100%;
		text-align: left;
		align-items: center;
        overflow: hidden;
	}
	.footer_txt{
		width: 40%;
	}
	.footer_txt ul{
		display: flex;
		justify-content: space-around;
		margin-top: 30px;
	}
	.footer_txt a{
		display: block;
		color: #777; 
	}
</style>
</head>
<body>
	<footer>
		<div id="footer_wrap">
			<div class="logo">
                <h1><img src="./images/logo.png" alt=""></h1>
            </div>
            <div class="footer_txt">
                <ul>
                    <li>
                        <a href="bbslist.do">개인정보처리방침</a>
                    </li>
                    <li>
                        <a href="pdslist.do">이용약관</a>
                    </li>
                    <li>
                        <a href="">이메일무단수집거부</a>
                    </li>
                </ul>
            </div>
		</div>
	</footer>
</body>
</html>