<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${initParam.root}css/home3.css" type="text/css">
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href="notice_notice.do";
    	});
    	$("#deleteImg").click(function(){ 
    		if(confirm("게시물을 삭제하시겠습니까?"))
    			location.href="notice_deleteContent.do?no=${requestScope.nvo.noticeNo}";
    	});
    	$("#updateImg").click(function(){  
    		if(confirm("게시물을 수정하시겠습니까?"))
    		location.href="notice_update.do?no=${requestScope.nvo.noticeNo }";
    	});
    });	
</script>
</head>
<body>
	<%-- <jsp:include page="/member/login.jsp"></jsp:include> --%>
	<table class="content" border="1">
		<tr>
			<td>NO : ${requestScope.nvo.noticeNo} </td>
			<td colspan="2">${requestScope.nvo.noticeTitle} </td>
		</tr>
		<tr>
			<td>작성자 :  ${requestScope.nvo.employeeVO.empName}</td>
			<td> ${requestScope.nvo.noticeDate}</td>
		</tr>
		<c:choose>
		<c:when test="${'1' ne requestScope.nvo.noticePath}">
		<tr>
			<td> 첨부파일 <a href="${initParam.root}notice_fileDownload.do?fileName=${requestScope.nvo.noticePath}"><font color="blue">${requestScope.nvo.noticePath }</font></a></td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td>첨부파일 없음</td>
		</tr>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${ fn:endsWith( requestScope.nvo.noticePath,'.jpg')}">
		<tr>
			<td><img src="${initParam.root}upload/noticeimg/${requestScope.nvo.noticePath }"></td>
		</tr>
		</c:when>
		</c:choose>
		<tr>
			<td colspan="3">
			<pre>${requestScope.nvo.noticeContent}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <img id="deleteImg" class="action"  onclick="deleteBoard()" src="${initParam.root}img/delete_btn.jpg" > 
			 <img id="updateImg" class="action"  onclick="updateBoard()" src="${initParam.root}img/modify_btn.jpg" >
			 <br><br>			
			 </td>
		</tr>
	</table>
</body>
</html>