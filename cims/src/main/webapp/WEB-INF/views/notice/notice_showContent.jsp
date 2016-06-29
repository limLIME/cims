<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href="notice_notice.do";
    	});
    	$("#deleteBtn").click(function(){ 
    		if(confirm("게시물을 삭제하시겠습니까?"))
    			location.href="${initParam.root}notice_deleteContent.do?no=${requestScope.nvo.noticeNo}";
    	});
    	$("#updateBtn").click(function(){  
    		if(confirm("게시물을 수정하시겠습니까?"))
    		location.href="${initParam.root}notice_update.do?no=${requestScope.nvo.noticeNo }";
    	});
    	$("#listBtn").click(function(){  
    		location.href="${initParam.root}notice_notice.do?pageNo=1";
    	});
    });	
</script>
</head>
<body>
<section id="main-content">
<section class="wrapper">
 <div class="marginMain2">	
 <div class="content-panel">
  <h3>&nbsp;<i class="fa fa-angle-right"></i> ShowContent</h3>
	<table class="table table-hover">
	
	<tbody>
		<tr>
			<td>No : ${requestScope.nvo.noticeNo} </td>
		</tr>
		<tr>
			<td colspan="2">Title : ${requestScope.nvo.noticeTitle} </td>
		</tr>
		<tr>
			<td>Writer :  ${requestScope.nvo.employeeVO.empName}</td>
			<td>Date : ${requestScope.nvo.noticeDate}</td>
		</tr>
		<c:choose>
		<c:when test="${'1' ne requestScope.nvo.noticePath}">
		<tr>
			<td colspan="2"> AttachedFile : <a href="${initParam.root}notice_fileDownload.do?fileName=${requestScope.nvo.noticePath}"><font color="blue">${requestScope.nvo.noticePath }</font></a></td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td colspan="2">AttachedFile does not exist</td>
		</tr>
		</c:otherwise>	
		</c:choose>
		<c:choose>
		<c:when test="${ fn:endsWith( requestScope.nvo.noticePath,'.jpg')}">
		<tr>
			<td align="center"><img width="300" height="300" src="${initParam.root}upload/noticeimg/${requestScope.nvo.noticePath }"></td>
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
			<button type="button"  id="listBtn" class="btn btn-warning" >List</button>&nbsp;
			<c:if test="${sessionScope.evo.positionVO.positionNo=='100'}">				
				 <button type="button"  id="deleteBtn" class="btn btn-danger" >Delete</button>&nbsp;
			 	 <button type="button"  id="updateBtn" class="btn btn-info">Update</button>
			</c:if>
			 <br><br>			
			 </td>
		</tr>
		</tbody>
	</table>
	</div>
	</div>
	</section></section>
</body>
</html>