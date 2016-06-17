<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>css를 이용한 layout</title>
<script type="text/javascript"
	src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/boot.css"> --%>
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">

</head>
<body>
	<div id="tile_container">
		<div id="tile_header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="tile_left">
			<tiles:insertAttribute name="left" />
		</div>
		<div id="tile_main">
			<tiles:insertAttribute name="main" />
		</div>
		<div id="tile_footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>









