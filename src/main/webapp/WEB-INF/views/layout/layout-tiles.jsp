<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	.wrap{
		position: relative;
		min-height: 100%;
		padding-bottom: 130px;
	}
	main{
		margin-bottom: 80px;
	}
</style>
<body>


<div class="wrap" align="center">



<!-- header -->
<header>
	<tiles:insertAttribute name="header" />
</header>

<!-- main -->
<main>
	<tiles:insertAttribute name="body" />
</main>

<!-- footer -->
<footer>
	<tiles:insertAttribute name="footer" />
</footer>




</div>

</body>
</html>