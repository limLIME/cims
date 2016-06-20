<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="main-content">
          <section class="wrapper">

<div class="marginMailWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i>Mail Content</h3>
<center>


    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href="mail.do";
    	});
    	$("#deleteImg").click(function(){ 
    		if(confirm("메일을 삭제하시겠습니까?"))
    			location.href="deleteMail.do?no=${requestScope.mailVO.mailNo}";
    	});
    	$("#resendImg").click(function(){  
    		if(confirm("답장하시겠습니까?"))
    		location.href="resend.do?no=${requestScope.mailVO.mailNo }";
    	});
    });	
</script>

<body>
	<%-- <jsp:include page="/member/login.jsp"></jsp:include> --%>
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
			 <img id="resendImg" class="action"  onclick="resendBoard()" src="${initParam.root}img/resend_btn.jpg" >
			 <img id="deleteImg" class="action"  onclick="deleteBoard()" src="${initParam.root}img/delete_btn.jpg" > 
			 <br><br>			
			 </td>
		</tr>
	</table>
</body>
</center></div></div></section></section>