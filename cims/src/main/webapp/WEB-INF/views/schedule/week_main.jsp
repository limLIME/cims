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
<center>
<table>

<thead>
<tr><td>월요일</td><td>내용</td>
</thead>

<tbody>
<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '월요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

<thead>
<tr><td>화요일</td><td>내용</td>
</thead>

<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '화요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

<thead>
<tr><td>수요일</td><td>내용</td>
</thead>

<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '수요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

<thead>
<tr><td>목요일</td><td>내용</td>
</thead>

<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '목요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

<thead>
<tr><td>금요일</td><td>내용</td>
</thead>

<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '금요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

<thead>
<tr><td>토요일</td><td>내용</td>
</thead>

<c:forEach items="${wlist}" var="i">
<c:if test="${i.day eq '토요일'}">
<tr><td></td><td>${i.schContent }</td></tr>
</c:if>
</c:forEach>

</tbody>
</table>

<button type='button' class='btn btn-primary2'>추가/수정</button>
</center>


</body>
</html>