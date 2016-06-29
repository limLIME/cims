<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="main-content">
          <section class="wrapper">

<div class="marginMailWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i>Mail Write</h3>
<center>

<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#sendBtn").click(function(){ 
    		if($("#title").val()==""){
    			alert("제목을 입력하세요!");
    		}else if($("#content").val()==""){
    			alert("본문을 입력하세요!");
    		}else{
    			$("#write_form").submit();
    		}
    	});
    	
    });	
</script>
	
 <br>
  <form action="${initParam.root}mail_sendMail.do" method="post" id="write_form" enctype="multipart/form-data"  >
   <table class="inputForm" >

    <tbody>
     <tr>
     <td>To.</td>
     <td colspan="3">
     <input type="text" id="receiver" name="mailReceiver" >
     </td>
    </tr>
    
      <tr>
     <td>From.</td>
     <td colspan="3"><input type = "text" name = "mailSender" value = "${sessionScope.evo.empName}" readonly="readonly"></td>     
    </tr>
    <tr>
    
    <tr>
      <td>Title</td>
   	  <td colspan="3">
    	 <input type="text" id="title" name="mailTitle" size="50%">
      </td>
    </tr>
     	<td>File</td>
    	<td>
				<input type="file" name="filePath">
    	</td>
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="mailContent"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >

    <input type="button"  id="sendBtn" class="btn btn-primary"  value="Send" >    	  
     <input type="reset"  class="btn btn-warning" value="Reset">
             
     </td>  
    </tr>
    </tbody>
   </table>
  </form>
  </center>
</div>
</div></section></section>


