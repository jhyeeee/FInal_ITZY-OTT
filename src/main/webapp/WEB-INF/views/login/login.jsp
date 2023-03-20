<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style type="text/css">
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

/* .h-custom {
	height: calc(100% - 73px);
}
 */
/* @media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
} */

html, body {
	width: 100%;
}

body, div, ul, li {
	margin: 0;
	padding: 0;
	justify-content: center;
}

}

/*tab css*/
.tab {
	float: left;
	width: 600px;
	height: 250px;
}

.tabnav {
	font-size: 0;
	width: 400px;
	border: 1px solid #ddd;
}

.tabnav li {
	display: inline-block;
	height: 50px;
	width: 50%;
	text-align: center;
	border-right: 1px solid #ddd;
	text-align: center;
}

.tabnav li a:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a.active:before {
	background: orange;
}

.tabnav li a.active {
	border-bottom: 1px solid #fff;
}

.tabnav li a {
	position: relative;
	display: block;
	background: #f8f8f8;
	color: #000;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}

.tabnav li a:hover, .tabnav li a.active {
	background: #fff;
	color: #7ea21e;
}

.tabcontent {
	padding: 20px;

	border: 1px solid #ddd;
	border-top: none;
	margin: 0 auto;
}
</style>

</head>


<body>
	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div class="row d-flex justify-content-center align-items-center h-100">
			
				<div>


					<div>
						<img alt="img" src="./images/logo.png?v=1" width="150px"
							height="150px">
					</div>

					<div>
						<p style="margin: auto; font-size: larger">
							<b>OTT PAGE LOGIN</b>
						</p>
					</div>
					<div class="tab">
					
					
					
						<ul class="tabnav">
							<li><a href="#tab01">일반회원</a></li>
							<li><a href="#tab02">기업회원</a></li>
						</ul>
						
						
						
						
						
						<div class="tabcontent">
							<div id="tab01">
								<form action="loginAf.do" method="post">
									<!-- id input -->
									<div class="form-outline mb-4">
										<input type="text" id="id" name="id" class="form-control form-control-lg" placeholder="ID" />
									</div>

									<!-- Password input -->
									<div class="form-outline mb-3">
										<input type="password" id="pwd" name="pwd" class="form-control form-control-lg" placeholder="PASSWORD" />
									</div>

									<div class="text-center text-lg-start mt-4 pt-2">
										<button type="submit" class="btn btn-warning btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
										<a href="#" onclick="account()" class="link-danger">회원가입하기</a>
										
								</form>
							</div>
						</div>



						<div id="tab02">
							<form action="BizloginAf.do" method="post">
								<!-- id input -->
								<div class="form-outline mb-4">
									<input type="text" id="id" name="id" class="form-control form-control-lg" placeholder="ID" />
								</div>

								<!-- Password input -->
								<div class="form-outline mb-3">
									<input type="password" id="pwd" name="pwd" class="form-control form-control-lg" placeholder="PASSWORD" />
								</div>


								<div class="text-center text-lg-start mt-4 pt-2">
									<button type="submit" class="btn btn-warning btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
									<a href="#" onclick="account()" class="link-danger">회원가입하기</a>
								</div>
							</form>
						</div>
						
						
						
					</div>
				</div>



			</div>
		</div>
		</div>

	</section>






	<script type="text/javascript">
		$(function() {
			$('.tabcontent > div').hide();
			$('.tabnav a').click(function() {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});

		/*
		 cookie : id저장, pw저장 == String  	client
		 session : login한 정보 == Object		server
		 */

		function account() {
			location.href = "regi.do";
		}

		let user_id = $.cookie("user_id");
		if (user_id != null) { // 저장한 id가 있음
			$("#id").val(user_id);
			$("#chk_save_id").prop("checked", true);
		}

		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked") == true) {
				if ($("#id").val().trim() == "") {
					alert('id를 입력해 주십시오');
					$("#chk_save_id").prop("checked", false);
				} else {
					// cookie를 저장
					$.cookie("user_id", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
				}

			} else {
				$.removeCookie("user_id", {
					path : './'
				});
			}
		});
	</script>

</body>
</html>





