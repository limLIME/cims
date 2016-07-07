<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
	$(document).ready(function(){
		var boardNo = ${vo.boardNo};
		var empNo = ${evo.empNo};
		$("#delete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href = "${initParam.root}free_delete.do?no=${vo.boardNo}";
			}
		});
		$("#update").click(function(){
			location.href = "${initParam.root}free_update.do?no=${vo.boardNo}";
		});
		$("#index").click(function(){
			location.href = "${initParam.root}free_boardList.do?pageNo=1";
		});
		$("#boardlike").click(function(){
			 $.ajax({
					type:"POST",
					url:"free_like.do",				
					data:"boardNo="+boardNo+"&empNo="+empNo,
					dataType:"json",   
					success:function(result){ 					
						if(result.success == "1"){
							$("#like").html("Like Complete");
						}else{
							alert("이미 좋아요를 누르셨습니다.");
						}
					}// success
				  });//ajax 				
		});
		$("#comment").click(function() {
			$("#commentWrite").html("<input type ='text' name = 'content'> <input type = 'button' id = 'submitContent' value = '	RE' class='btn btn-info' style='width: 55px; height: 25px'>");
		$("#submitContent").on("click",function(){
			var text = $(":input[name=content]").val(); 
			var boardNo = ${vo.boardNo};
			$.ajax({
				type:"POST",
				url:"free_board_comment.do",				
				data:"boardNo="+boardNo+"&commentContent="+text,   
				success:function(result){ 					
					location.href = "${initParam.root}free_showContent.do?no="+boardNo;
				}// success
			  });//ajax 
		});
	});
		
});
	function commentCancel(no){
		if(confirm("삭제하시겠습니까?")){
			location.href = "${initParam.root}free_delete_comment.do?commentNo="+no+"&boardNo=${vo.boardNo}";
		}
	}
</script>
<body>
<section id="main-content">
     <section class="wrapper">
     <div class = "marginMain3">
          <div class = "content-panel">
     <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>ShowContent</h3>

      	<table class = "table table-hover" >
		<tr>
			<td colspan="2">No : ${vo.boardNo}  </td>
		</tr>
		<tr>
			<td colspan="2">Title: ${vo.boardTitle }</td>
		</tr>
		<tr>
			<td>Writer :  ${vo.employeeVO.empName }</td>
			<td>Date : ${vo.boardDate }</td>
		</tr>
<c:choose>
	<c:when test="${vo.boardPath=='1'}">
			<td colspan="3">AttachedFile does not exist</td>	
	</c:when>
	<c:otherwise>	
			<td colspan="3"> <img width="300" height="300" src ="${initParam.root}upload/boardimg/${vo.boardPath}" ></td>		
	</c:otherwise>
</c:choose>
		<tr>
			<td colspan="3">
			<pre> ${vo.boardContent }
</pre>
			</td>
		
		</tr>
	</table>  

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button  id = "boardlike" class = "btn btn-primary"  >
		<i class="fa fa-thumbs-up" ></i>
		</button>
		<span id = "like">Like </span><br><br>
			<div align="center">
			 <c:if test="${vo.employeeVO.empNo == evo.empNo}">
				     <input type = "button" value = "Delete" class="btn btn-danger"  id = "delete" >  
					&nbsp; <input type = "button" value = "Update" class="btn btn-info" id = "update" >
			 </c:if>
			 	&nbsp;<input type = "button" id = "comment" value = "Comment" class="btn btn-success" >
			 	&nbsp;<input type = "button" id = "index" value = "List" class="btn btn-warning" ><br><br>
			 	<div id = "commentWrite"></div> <div id = "commentSubmit"></div>
			 </div>
			 <br>
	<table class = "table table-striped table-advance table-hover" >
	<c:forEach items = "${requestScope.list}" var = "l">
		<tr>
		<c:choose>
			<c:when test="${l.employeeVO.empNo == evo.empNo}">
			<td width = "10%">${l.employeeVO.empName}</td><td width = "25%">${l.commentContent }</td>	<td width = "15%">${l.commentDate }</td>
				<td> 
				<div align="right">
				     <input type = "button" value = "Delete" class="btn btn-danger"  onclick="commentCancel(${l.commentNo})" >  
				</div>
				  </td>
			</c:when>
			<c:otherwise>
				<td width = "10%">${l.employeeVO.empName}</td><td width = "25%">${l.commentContent }</td>	<td width = "15%">${l.commentDate }</td>
				<td>
					&nbsp;
				</td>
			</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
	</table>
	</div>
	</div>
	</section>
	</section>
</body>