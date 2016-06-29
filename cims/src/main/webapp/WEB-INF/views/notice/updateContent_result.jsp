<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    	$("#deleteBtn").click(function(){ 
    		if(confirm("Are you sure that delete this content?"))
    			location.href="${initParam.root}notice_deleteContent.do?no=${requestScope.nvo.noticeNo}";
    	});
    	$("#updateBtn").click(function(){  
    		if(confirm("Do you want to update this content?"))
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
		<tr>
			<td>NO : ${requestScope.nvo.noticeNo} </td>
			<td colspan="2">Title : ${requestScope.nvo.noticeTitle} </td>
		</tr>
		<tr>
			<td>Writer :  ${requestScope.nvo.employeeVO.empName}</td>
			<td>Date :  ${requestScope.nvo.noticeDate}</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.nvo.noticeContent}</pre>
			</td>
		</tr>
		
		
			<c:choose>
		     	<c:when test="${'1' ne requestScope.nvo.noticePath}">
				<tr>
					<td colspan="2"> UpdateFile to : ${requestScope.nvo.noticePath}</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
				<td colspan="2">UpdateFile to : AttachedFile does not exist</td>
				</tr>
				</c:otherwise>	
				</c:choose>
		
		
		<tr>
			<td valign="middle" align="center" colspan="3">
			<button type="button"  id="listBtn" class="btn btn-warning" >List</button>
			 <button type="button"  id="deleteBtn" class="btn btn-danger" >Delete</button>
			 <button type="button"  id="updateBtn" class="btn btn-info">Update</button>
			 <br><br>			
			 </td>
		</tr>
	</table>
	</div></div>
	</section></section>
</body>
</html>