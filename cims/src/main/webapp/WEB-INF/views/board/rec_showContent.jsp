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
		$("#comment").click(function() {
			$("#commentWrite").html("<input type ='text' name = 'content'> <input type = 'button' id = 'submitContent' value = '입력'>");
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
			location.href = "${initParam.root}delete_recComment.do?commentNo="+no+"&recNo=${vo.recNo}";
		}
	}
</script>
<body>
 <table border="1" >
   <tr>
      <td>
      	<table class="content">
		<tr>
			<td><h3>글번호 : ${vo.recNo} </h3> </td>
			<td colspan="2">타이틀: ${vo.recTitle }</td>
		</tr>
		<tr>
			<td>작성자 :  ${vo.employeeVO.empName }</td>
			<td>작성일시 : ${vo.recDate }</td>
		</tr>
<c:choose>
	<c:when test="${vo.recPath=='1'}">
			<td colspan="3">첨부파일 없음</td>	
	</c:when>
	<c:otherwise>	
			<td colspan="3"> <img src ="${initParam.root}upload/boardimg/${vo.recPath}" ></td>		
	</c:otherwise>
</c:choose>
		<tr>
			<td colspan="3">
			<pre> ${vo.recContent }
</pre>
			</td>
		
		</tr>
	</table>  
       </td>
   </tr>
</table>

			 <c:if test="${vo.employeeVO.empNo == sessionScope.mvo.empNo}">
			 <br><br><br>
			 <img class="action"  id="delete" 	src="${initParam.root}img/delete_btn.jpg" > 
			 <img class="action"  id="update"  src="${initParam.root}img/modify_btn.jpg" >
			 	<input type = "button" id = "comment" value = "댓글달기"><br>
			 	<div id = "commentWrite"></div> <div id = "commentSubmit"></div>
			 </c:if>
			 
			<table>
	
	<c:forEach items = "${requestScope.list}" var = "l">
		<tr>
			<td width = "10%">${l.employeeVO.empName}</td><td width = "25%">${l.commentContent }</td>	<td width = "15%">${l.commentDate }</td>
			<c:if test="${l.employeeVO.empNo == sessionScope.mvo.empNo}">
				<td>   <input type = "button" value = "삭제" onclick="commentCancel(${l.commentNo})" >
						 <input type = "button" value = "수정" onclick = "commentUpdate(${l.commentNo})" >
			   </td>
			</c:if>
		</tr>
	</c:forEach>
	</table>
			 
</body>