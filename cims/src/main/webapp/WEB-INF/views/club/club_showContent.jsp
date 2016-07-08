<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
 <script type="text/javascript">
	$(document).ready(function(){
		var clubNo = ${vo.clubNo};
		var empNo = ${evo.empNo};
		$("#delete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href = "${initParam.root}club_delete.do?no=${vo.clubNo}";
			}
		});
		$("#update").click(function(){
			location.href = "${initParam.root}club_update.do?no=${vo.clubNo}";
		});		
		$("#index").click(function(){
			location.href = "${initParam.root}club_List.do?pageNo=1";
		});
		$("#approval").click(function(){
			if(confirm("승인하시겠습니까?"))
				location.href = "${initParam.root}club_approval.do?clubNo="+clubNo+"&empNo="+${vo.employeeVO.empNo};
		});
		$("#reject").click(function(){
			if(confirm("거절하시겠습니까?"))
				location.href = "${initParam.root}club_reject.do?clubNo="+clubNo;
		});
		$("#register").click(function(){
			if(confirm("가입하시겠습니까?"))
				location.href = "${initParam.root}club_register.do?empNo="+empNo+"&clubNo="+clubNo;
		});
	      $("#resign").click(function(){
	          if(confirm("탈퇴하시겠습니까?"))
	             location.href = "${initParam.root}club_resign.do?clubNo="+clubNo;
	       });		
});

</script>
<body>
<section id="main-content">
     <section class="wrapper">
      <div class = "marginMain3">
       <div class = "content-panel">
       <h3>&nbsp;<i class="fa fa-angle-right"></i>&nbsp;ShowContent</h3>

      	<table class="table table-hover">
		<tr>
			<td colspan="2">Club Name: ${vo.clubName}</td>
		</tr>
		<tr>
			<td colspan="2">User Name :  ${vo.employeeVO.empName }</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre> ${vo.clubContent }
</pre>
			</td>
		
		</tr>
	</table>  

<div align="center">
			<c:choose>
			<c:when test="${evo.positionVO.positionNo == 100 }">
			<c:choose>
			<c:when test="${vo.clubConfirm == 1}">
			 <br><br><br>
					 <input type = "button" value = "폐쇄" class="btn btn-info" id = "delete" >
			 </c:when>
			 <c:otherwise>
			 		<input type = "button" value = "승인" class = "btn btn-success" id = "approval">
			 		<input type = "button" value = "거절" class = "btn btn-danger" id = "reject">
			 </c:otherwise>
			 </c:choose>
			 </c:when>
			 <c:otherwise>
			<c:choose>
			<c:when test="${vo.employeeVO.empNo == sessionScope.evo.empNo}">
			 <br><br><br>
					 <input type = "button" value = "Update" class="btn btn-info" id = "update" > &nbsp;
					  <input type = "button" value = "Close" class="btn btn-danger" id = "delete" >&nbsp;
			 </c:when>
			 <c:otherwise>
			 	<c:choose>
			 	   <c:when test="${check == 0 }">
			 		<input type = "button" value = "Regist" class = "btn btn-success" id = "register">&nbsp;
			 		</c:when>
			 		<c:otherwise>
			 		<input type = "button" value = "Withdraw" class = "btn btn-success" id = "resign">&nbsp;
			 		</c:otherwise>
			 	</c:choose>
			 </c:otherwise>
			 </c:choose>
			 </c:otherwise>
			 </c:choose>
			  <input type = "button" id = "index" value = "List" class="btn btn-warning" >&nbsp;<br><br>
	 </div>
	</div>
	</div>
	</section>
	</section>
</body>