<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
    $(document).ready(function(){
    	$("#update_form").submit(function(){ 
    		if($("#noticeTitle").val()==""){
    			alert("제목을 입력하세요!");
    			return false;
    		}
    		if($("#noticeContent").val()==""){
    			alert("본문을 입력하세요!");
    			return false;
    		}
    	});
    });	
    
    function cancel(){
    		location.href="${initParam.root}evaluation_evaluationList.do?pageNo=1";
    }
</script>


<section id="main-content">
  <section class="wrapper">
   <div class="marginMain2">	
 <div class="content-panel">
 <h3>&nbsp;<i class="fa fa-angle-right"></i> Update</h3>
<form method="post" id="update_form" action="${initParam.root}evaluation_updateContent.do">
	<table class="table table-hover">
		<tbody>
				<tr>
					<td>
					NO : <input type="text" name="evaluationNo" value=${evalVo.evaluationNo } size="72" readonly></input>						
					</td>
				</tr>
				<tr>
					<td>Title : <input type="text" id="evaluationTitle" name="evaluationTitle" size="71" value=${evalVo.evaluationTitle }></input></td>
				</tr>
				<tr>
					<td>Date : <input type="text" id="evaluationDate" name="evaluationDate" size="71" value=${evalVo.evaluationDate } readonly="readonly"></input></td>
				</tr>
				
				<tr>
					<td>						
						<textarea rows="15" cols="75" id="evaluationContent" name="evaluationContent">${evalVo.evaluationContent }</textarea>
					</td>
				</tr>
				
				<tr>
				<td align="center">						
					<input type="submit" value="Update" class="btn btn-info"/>&nbsp;	
					<input type="button" value="Cancel" class="btn btn-warning" onclick="cancel()"/>			
					</td>				
				</tr>
	</tbody>
</table>
</form>	
</div></div>
</section></section>














