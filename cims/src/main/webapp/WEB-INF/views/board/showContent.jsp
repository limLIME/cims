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
		$("#boardlike").click(function(){
			 $.ajax({
					type:"POST",
					url:"free_like.do",				
					data:"boardNo="+boardNo+"&empNo="+empNo,
					dataType:"json",   
					success:function(result){ 					
						if(result.success == "1"){
							$("#like").html("좋아요");
						}else{
							alert("이미 좋아요를 누르셨습니다.");
						}
					}// success
				  });//ajax 				
		});
		$("#comment").click(function() {
			$("#commentWrite").html("<input type ='text' name = 'content'> <input type = 'button' id = 'submitContent' value = '입력'>");
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
	function commentUpdate(no){
		if(confirm("수정하시겠습니까?")){
			location.href = "${initParam.root}free_update_comment.do?commentNo="+no+"&boardNo=${vo.boardNo}";
		}
	}
</script>
<body>
 <table border="1" >
   <tr>
      <td>
      	<table class="content">
		<tr>
			<td><h3>글번호 : ${vo.boardNo} </h3> </td>
			<td colspan="2">타이틀: ${vo.boardTitle }</td>
		</tr>
		<tr>
			<td>작성자 :  ${vo.employeeVO.empName }</td>
			<td>작성일시 : ${vo.boardDate }</td>
		</tr>
<c:choose>
	<c:when test="${vo.boardPath=='1'}">
			<td colspan="3">첨부파일 없음</td>	
	</c:when>
	<c:otherwise>	
			<td colspan="3"> <img width="500" height="500" src ="${initParam.root}upload/boardimg/${vo.boardPath}" ></td>		
	</c:otherwise>
</c:choose>
		<tr>
			<td colspan="3">
			<pre> ${vo.boardContent }
</pre>
			</td>
		
		</tr>
	</table>  
       </td>
   </tr>
</table>
	<img class="action"  id = "boardlike"  src="${initParam.root}img/like.jpg" ><span id = "like"></span>

			 <c:if test="${vo.employeeVO.empNo == evo.empNo}">
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
			<c:if test="${l.employeeVO.empNo == evo.empNo}">
				<td>   <input type = "button" value = "삭제" onclick="commentCancel(${l.commentNo})" >  
						<input type = "button" value = "수정" onclick = "commentUpdate(${l.commentNo})" >
				  </td>

			</c:if>
		</tr>
	</c:forEach>
	</table>
</body>