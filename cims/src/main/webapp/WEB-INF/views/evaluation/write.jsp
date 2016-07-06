<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        		location.href="${initParam.root}evaluation_evaluationList.do?pageNo=1";
    	});
    });	
</script>
</head>
<%-- <jsp:include page="/member/login.jsp"></jsp:include> --%>
 <br>
  <section id="main-content">
  <section class="wrapper">

 <div class="marginMain2">	
  <div class="content-panel">
  <h3>&nbsp;<i class="fa fa-angle-right"></i> Today's Evaluation</h3>
  <hr>
  <form action="${initParam.root}evaluation_write_result.do" method="post" id="write_form">
   <table class="table table-hover" >
    <tbody>
    <tr>
     <td>Title</td>
     <td colspan="3">
     <input type="text" id="title" name="evaluationTitle" size="53">
     </td>
    </tr>
    <tr>
     <td>Writer</td>
     <td>${evo.empName }</td>     
    </tr>
    <tr>
     <td colspan="4" align="center">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="evaluationContent"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
         <button type="button" id="writeBtn" class="btn btn-info">Write</button>&nbsp;
         <button type="button" id="resetBtn" class="btn btn-warning">Cancel</button>   
     </td>  
    </tr>
    </tbody>
   </table>
  </form>
  </div>
  </div>
  </section></section>
</html>




