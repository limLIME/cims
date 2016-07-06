<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){	
			$(".schTable").on("click",".deleteBtn",function(){	
		       var schNo = $(this).parent().parent().children().children().val();
		       if(confirm("삭제 하시겠습니까?")){
		    	   location.href="${initParam.root}sch_monthDelete.do?schNo="+schNo+"&month="+${month};
		       }
		    });//on
		    
			$(".schTable").on("click",".updateBtn",function(){	
			       var schNo = $(this).parent().parent().children().children().val();
			       if(confirm("수정 하시겠습니까?")){
			    	   location.href="${initParam.root}sch_monthUpdateForm.do?schNo="+schNo+"&month="+${month};
			       }
			    });//on
			    
				$("#monthBtn").click(function(){	
				     location.href="${initParam.root}sch_month.do";
				 });//click
	});	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="main-content"> <section class="wrapper">
	<div class="marginMain">
		<div class="content-panel">
			<h3>
				&nbsp;<i class="fa fa-angle-right"></i> Monthly Schedule
			</h3>
			<hr>
			<table class="table table-striped table-advance table-hover schTable">
				<thead style="font-size: 1.2em;">
					<tr>
						<th width="1%"></th>
						<th width="20%">#Day</th>
						<th>Contents</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mlist}" var="i" varStatus="index">	
							<tr class="mondayClass">
								<td><input type="hidden" value="${i.schNo}" class="schNo"></td>								
								<td>${i.schDay}</td>
								<td>${i.schContent}</td>
								<td align="center"><input type="button" value="update" class="btn btn-success updateBtn">&nbsp;&nbsp;
								<input type="button" value="delete"  class="btn btn-danger deleteBtn"></td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="right"><input type="button" value="Month Main"  class="btn btn-primary" id="monthBtn">&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<br>
		</div>
	</div>
	</section></section>
</body>
</html>