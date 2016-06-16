<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${initParam.root}css/home3.css" type="text/css">
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#writeBtn").click(function(){ 
    		if($("#title").val()==""){
    			alert("제목을 입력하세요!");
    		}else if($("#content").val()==""){
    			alert("본문을 입력하세요!");
    		}else{
    			$("#write_form").submit();
    		}
    	});
    	$("#resetBtn").click(function(){    		
    		$("#write_form")[0].reset();
    	});
    });	
</script>
</head>
<%-- <jsp:include page="/member/login.jsp"></jsp:include> --%>
 <br>
  <form action="${initParam.root}notice_writeContent.do" method="post" id="write_form" enctype="multipart/form-data">
   <table class="inputForm" >
    <caption>글쓰기</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" id="title" name="noticeTitle" size="48">
     </td>
    </tr>
    <tr>
     <td>이름 | </td>
     <td>${sessionScope.evo.empName}</td>     
    </tr>
    <tr>
    	<td>파일첨부하기</td>
    	<td>
				첨부파일 <input type="file" name="filePath">
    	</td>
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="noticeContent"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <img id="writeBtn" class="action" src="${initParam.root}img/write_btn.jpg" alt="글입력"  onclick="content_submit()">
      <img id="resetBtn" class="action" src="${initParam.root}img/cancel.gif" onclick="cancel()">      
     </td>  
    </tr>
    </tbody>
   </table>
  </form>
</html>




