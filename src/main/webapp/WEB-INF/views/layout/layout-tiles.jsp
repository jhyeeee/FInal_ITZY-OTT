<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/common.css"/>
<title>OTT</title>
</head>

<style>

	.wrap{
		position: relative;
		min-height: 90%;

	}
	main{
		width: 1200px;
		margin: 0 auto;
	}

</style>
<body>


<div class="wrap" >



<!-- header -->
<header>
	<tiles:insertAttribute name="header" />
</header>

<!-- main -->
<main>
	<tiles:insertAttribute name="body" />
</main>
</div>
<!-- footer -->
<footer>
	<tiles:insertAttribute name="footer" />
</footer>






</body>
</html>






