<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="main-content">
          <section class="wrapper">

<div class="marginMailWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i> Mail Write</h3><hr>
<div align="center">

<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#receiver").click(function() {
    		window.open("${initParam.root}mail_popup.do","","left=300,top=50,width=1500,height=800"); 
    	});
    	$("#sendBtn").click(function(){ 
    		if($("#title").val()==""){
    			alert("제목을 입력하세요!");
    		}else if($("#content").val()==""){
    			alert("본문을 입력하세요!");
    		}else{
    			$("#write_form").submit();
    		}
    	});
    	$("#my").click(function() {
    		if($(this).is(":checked")){
    		
        		$("#receiver").val("${sessionScope.evo.departmentVO.deptName} ${sessionScope.evo.positionVO.positionName} ${sessionScope.evo.empName} (${sessionScope.evo.empNo})");
        	}else{
        		$("#receiver").val("");
        	}
		});
    });	
</script>
	
 <br>
  <form action="${initParam.root}mail_sendMail.do" method="post" id="write_form" enctype="multipart/form-data"  >
   <table class="inputForm">

    <tbody>
     <tr>
     <td>To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
     <td colspan="3"><input type="text" id="receiver" name="mailReceiver" size="30" value="${requestScope.receiver }">
     <input type="checkbox"  id="my">내게쓰기
     </td>
    </tr>
    
      <tr>
     <td>From&nbsp;:</td>
     <td colspan="3"><input type = "text" name = "mailSender" size="30"  value = "${sessionScope.evo.departmentVO.deptName} ${sessionScope.evo.positionVO.positionName} ${sessionScope.evo.empName}(${sessionScope.evo.empNo})" readonly="readonly"></td>     
    </tr>
    <tr>
    
    <tr>
      <td>Title&nbsp;&nbsp;&nbsp;:</td>
   	  <td colspan="3"><input type="text" id="title" name="mailTitle" size="50%">
      </td>
    </tr>
    <tr>
     	<td>File&nbsp;&nbsp;&nbsp;&nbsp; :</td>
    	<td><input type="file" name="filePath" >
    	</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="mailContent"></textarea>
     </td>
    </tr> 
        <tr><td>&nbsp;</td></tr>
    <tr>
     <td colspan="4" align="center" >

    <input type="button"  id="sendBtn" class="btn btn-primary"  value="Send" >    	  
     <input type="reset"  class="btn btn-warning" value="Reset">
             
     </td>  
    </tr>
    <tr><td>&nbsp;</td></tr>
    </tbody>
   </table>
  </form>
 </div>
</div>
</div></section></section>


