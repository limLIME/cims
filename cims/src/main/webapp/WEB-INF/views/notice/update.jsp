<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${initParam.root}css/board.css" type="text/css">
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
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
    		location.href="${initParam.root}notice_notice.do?pageNo=1";
    }
</script>

<section id="main-content">
  <section class="wrapper">
   <div class="marginMain3">	
 <div class="content-panel">
 <h3>&nbsp;<i class="fa fa-angle-right"></i> Update</h3>
<form method="post" id="update_form" action="${initParam.root}notice_updateContent.do?no=${nvo.noticeNo }&time=${nvo.noticeDate }" enctype="multipart/form-data">
	<table class="table table-hover" style="width: 100%;" >
		<tbody>
				<tr>
					<td colspan="1" style="width: 100%;">
					NO : ${nvo.noticeNo }				
					</td>
				</tr>
				<tr>
					<td style="width: 90%;">Title : <input type="text" id="noticeTitle" style="width: 90%;" name="noticeTitle"  value="${nvo.noticeTitle }"></input></td>
				</tr>
				<tr>
					<td colspan="1">Date : ${nvo.noticeDate }</td>
				</tr>
				
				<tr>
					<td colspan="1" >						
						<textarea rows="15" cols="75" style="width: 100%;" id="noticeContent" name="noticeContent">${nvo.noticeContent }</textarea>
					</td>
				</tr>
				
				<c:choose>
		     	<c:when test="${'1' ne requestScope.nvo.noticePath}">
				<tr>
					<td colspan="1"> AttachedFile : <a href="${initParam.root}notice_fileDownload.do?fileName=${requestScope.nvo.noticePath}"><font color="blue">${requestScope.nvo.noticePath }</font></a>
						<input type="file" name="filePath" id="noticePath">
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
				<td colspan="1">AttachedFile does not exist<input type="file" name="filePath" id="noticePath"></td>
				</tr>
				</c:otherwise>	
				</c:choose>
			
				<tr>
				<td align="center" colspan="2">						
					<input type="submit" value="Update" class="btn btn-info"/>&nbsp;	
					<input type="button" value="Cancel" class="btn btn-warning" onclick="cancel()"/>			
					</td>				
				</tr>
	</tbody>
</table>
</form>	
</div></div>
</section></section>














