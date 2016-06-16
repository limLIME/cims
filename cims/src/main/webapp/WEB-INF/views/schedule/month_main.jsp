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
<a href="#" class="btn btn-primary">Default button</a>
<center>
<c:forEach begin="1" end="12" step="1" var="i" >
	<a href="#" class="btn btn-info btn-lg">${i}월</a>&nbsp;&nbsp;
	<c:if test="${i%4==0}"><br><br></c:if>
</c:forEach>
</center>
</body>
</html>