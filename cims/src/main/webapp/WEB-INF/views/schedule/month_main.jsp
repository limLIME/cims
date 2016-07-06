<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){	
			$("#writeBtn").click(function(){	
		       location.href="${initParam.root}sch_monthWriteForm.do";
		    });//click
	});	
</script>
</head>
<body>
	<section id="main-content">
	<section class="wrapper">
	<div class="marginMain">
		<div class="content-panel2">
			<h3>
				&nbsp;<i class="fa fa-angle-right"></i> Monthly Schedule
			</h3>
			<hr>
			<center>
				<c:forEach begin="1" end="12" step="1" var="i">
					<a href="${initParam.root}sch_monthList.do?month=${i}"
						class="btn btn-info btn-lg">${i}월</a>&nbsp;&nbsp;
	<c:if test="${i%4==0}">
						<br>
						<br>
						<br>
					</c:if>
				</c:forEach>
			</center>		
			<div align="center"><input type="button" class="btn btn-success" value="Write" id="writeBtn"></div>
		</div>
	</div>
	</section></section>
</body>
</html>