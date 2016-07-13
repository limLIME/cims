<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
	$(document).ready(function(){
		$("#delete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href = "${initParam.root}rec_delete.do?no=${vo.recNo}";
			}
		});
		$("#update").click(function(){
			location.href = "${initParam.root}rec_update.do?no=${vo.recNo}";
		});
		$("#index").click(function(){
			location.href = "${initParam.root}rec_boardList.do?pageNo=1";
		})
		$("#comment").click(function() {
			$("#commentWrite").html("<input type ='text' name = 'content'size='50'> <input type = 'button' id = 'submitContent' value = '등록' class='btn btn-info' style='width: 55px; height: 25px'>");
		$("#submitContent").on("click",function(){
			var text = $(":input[name=content]").val(); 
			var recNo = ${vo.recNo};
			$.ajax({
				type:"POST",
				url:"rec_comment.do",				
				data:"recNo="+recNo+"&commentContent="+text,   
				success:function(result){ 					
					location.href = "${initParam.root}rec_showContent.do?no="+recNo;
				}// success
			  });//ajax 
		});
	});
});
	function commentCancel(no){
		if(confirm("삭제하시겠습니까?")){
			location.href = "${initParam.root}rec_deleteComment.do?commentNo="+no+"&recNo=${vo.recNo}";
		}
	}
</script>
<body>
<section id="main-content">
     <section class="wrapper">
      <div class = "marginMain3">
       <div class = "content-panel">
       <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>ShowContent</h3>

      	<table class="table table-hover">
		<tr>
			<td colspan="2">No : ${vo.recNo} </td>
		</tr>
		<tr>
			<td colspan="2">Title: ${vo.recTitle }</td>
		</tr>
		<tr>
			<td>Writer :  ${vo.employeeVO.empName }</td>
			<td>Date : ${vo.recDate }</td>
		</tr>
<c:choose>
	<c:when test="${vo.recPath=='1'}">
			<td colspan="3">AttachedFile does not exist</td>	
	</c:when>
	<c:otherwise>	
			<td colspan="3"> <img width="300" height="300" src ="${initParam.root}upload/boardimg/${vo.recPath}" ></td>		
	</c:otherwise>
</c:choose>
		<tr>
			<td colspan="3">
			<pre> ${vo.recContent }
</pre>
			</td>
		
		</tr>
	</table>  


			 <div align="center">
			 <c:if test="${vo.employeeVO.empNo == sessionScope.evo.empNo}">
			 <br><br><br>
				     <input type = "button" value = "Delete" class="btn btn-danger"  id = "delete" >  
					&nbsp;  <input type = "button" value = "Update" class="btn btn-info" id = "update" >
					
			 </c:if>
			 	&nbsp; <input type = "button" id = "comment" value = "Comment" class="btn btn-success" >
		     	&nbsp;  <input type = "button" id = "index" value = "List" class="btn btn-warning" ><br><br>
			 	<div id = "commentWrite"></div> <div id = "commentSubmit"></div>
			  </div>
			  <br>
			  <center>
			 <div style="width: 80%"> 
			<table  style="width: 100%" >
	
	<c:forEach items = "${requestScope.list}" var = "l">
	<tr  class="form-control" align="center" style="height: 5%" >
		<c:choose>
			<c:when test="${l.employeeVO.empNo == evo.empNo}">
			<td width = "10%"><l class="btn-success" >${l.employeeVO.empName}</l></td><td align="left" width = "60%">${l.commentContent }</td>	<td width = "15%">${l.commentDate }</td>
				<td> 
				<div align="right">
				     <input type = "button" value = "Delete" class="btn btn-danger"  onclick="commentCancel(${l.commentNo})" >  
				</div>
				  </td>
			</c:when>
			<c:otherwise>
				<td width = "10%"  ><l class="btn-primary" >${l.employeeVO.empName}</l></td><td align="left" width = "60%">&nbsp;&nbsp;${l.commentContent }</td>	<td width = "15%">${l.commentDate }</td>
				<td>
					&nbsp;
				</td>
			</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
	</table>
	</div>
	<br>
	</center>
	</div>
	</div>
	</section>
	</section>
</body>