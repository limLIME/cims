<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href="mail.do";
    	});
    	$("#deleteBtn").click(function(){ 
    		if(confirm("메일을 삭제하시겠습니까?"))
    			location.href="${initParam.root}mail_deleteMail.do?sender=${requestScope.mailVO.mailSender}&no=${requestScope.mailVO.mailNo}";
    	});
    
    });	
</script>

<section id="main-content">
          <section class="wrapper">

<div class="marginMailWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i>Mail Content</h3>
<center>

	<table class="table table-striped table-advance table-hover">
		<tr>
			<td colspan="2">Title : ${requestScope.mailVO.mailTitle} </td>
		</tr>
		<tr>
			<td>Receiver : ${requestScope.mailVO.mailReceiver}</td>
		</tr>
		<tr>
			<td>Sender : ${requestScope.mailVO.mailSender}</td>
		</tr>
		<tr>
			<td>Time : ${requestScope.mailVO.mailDate}</td>
		</tr>
		<c:choose>
		<c:when test="${'1' ne requestScope.mailVO.mailPath}">
		<tr>
			<td> File <a href="${initParam.root}fileDownload.do?fileName=${requestScope.mailVO.mailPath}">${requestScope.mailVO.mailPath }</a></td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td>File Is Not Exist </td>
		</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="3">
			<pre>${requestScope.mailVO.mailContent}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			
   			  <input type="button"  id="deleteBtn" class="btn btn-danger" value="Delete">
			 <br><br>			
			 </td>
		</tr>
	</table>

</center></div></div></section></section>