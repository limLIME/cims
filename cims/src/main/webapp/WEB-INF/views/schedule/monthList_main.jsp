<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="main-content"> <section class="wrapper">
	<div class="marginMain">
		<div class="content-panel">
			<h3>
				&nbsp;<i class="fa fa-angle-right"></i> Monthly Schedule
			</h3>
			<hr>
			<table class="table table-striped table-advance table-hover">
				<thead style="font-size: 1.2em;">
					<tr>
						<th width="1%"></th>
						<th width="20%">#Day</th>
						<th>Contents</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mlist}" var="i" varStatus="index">	
							<tr class="mondayClass">
								<td></td>
								<td>${i.schDay}</td>
								<td>${i.schContent}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</section></section>
</body>
</html>