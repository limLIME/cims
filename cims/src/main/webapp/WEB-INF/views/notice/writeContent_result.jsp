<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


	<table class="content" border="1">
		<tr>
			<td>NO : ${requestScope.nvo.noticeNo} </td>
			<td colspan="2">${requestScope.nvo.noticeTitle} </td>
		</tr>
		<tr>
			<td>작성자 :  ${requestScope.nvo.employeeVO.empName}</td>
			<td> ${requestScope.nvo.noticeDate}</td>
		</tr>
		<tr>
			<td><img src="${initParam.root}/noticeimg/${requestScope.nvo.noticePath }"></td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.nvo.noticeContent}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <img id="deleteImg" class="action"  src="${initParam.root}img/delete_btn.jpg" > 
			 <img id="updateImg" class="action"  src="${initParam.root}img/modify_btn.jpg" >
			 <br><br>			
			 </td>
		</tr>
	</table>
