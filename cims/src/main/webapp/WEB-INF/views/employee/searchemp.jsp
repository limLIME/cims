<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script> --%>
<style>
.cursor{
      cursor: pointer;
   }
.scrolltbody{
	
	overflow: auto; 
}
</style>


<section id="main-content">
	<section class="wrapper">
    <script type="text/javascript" >
   
   $(document).ready(function(){
	   
   $("#deptTable").on("click","#deptName",function(){   
        $.ajax({
         type:"get",
        url:"${initParam.root}emp_seardBydeptName.do",
        data:"deptName="+$(this).children().eq(1).text(),
        dataType:"json",
        success:function(data){
           var str = ""; 
            for(var i=0;i<data.length;i++){
              str += "<tr class='empSearch cursor'><td><center>"+data[i].empNo+"</center></td>";
              str += "<td><center>"+data[i].departmentVO.deptName+"</center></td>";
              str += "<td><center>"+data[i].positionVO.positionName+"</center></td>";
              str += "<td class='empName'><center>"+data[i].empName+"</center></td>";
              str += "<td><center>"+data[i].empTel+"</center></td>";
              str += "</tr>";
           }//for
            $("#empView").html(str);  
            $("#empName").val("");
        }//success
        });
     });//click
          
     $("#searchempBtn").click(function(){   
         $.ajax({
          type:"get",
         url:"${initParam.root}emp_findByName.do",
         data:"empName="+$("#searchemptext").val(),
         dataType:"json",
         success:function(data){
            var str = "";
             for(var i=0;i<data.length;i++){
               str += "<tr class='empSearch cursor'><td><center>"+data[i].empNo+"</center></td>";
               str += "<td><center>"+data[i].departmentVO.deptName+"</center></td>";
               str += "<td><center>"+data[i].positionVO.positionName+"</center></td>";
               str += "<td><center>"+data[i].empName+"</center></td>";
               str += "<td><center>"+data[i].empTel+"</center></td>";

               str += "</tr>";
            }//for
             $("#empView").html(str);  
             $("#searchemptext").val("");
         }//success
         }); 
      });//click
       
   });
   
   </script>
   
		<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
<table class="table">
<tr bgcolor="white">
<td colspan="3"><h3><i class="fa fa-angle-right"></i> Organization Chart</h3></td>
</tr>
<tr bgcolor="white">
<td colspan="2">
      <input type="text"  id="searchemptext" class="form-control" placeholder="Please enter your search word" style="width: 400px">
      
</td><td><button class="btn btn-primary" id="searchempBtn" value="Search" style="width: 50px; height: 32px">
<i class="fa fa-search"></i></button></td>
</tr>
<tr bgcolor="white">
	<td width="20%">
		<table id="deptTable" class="table table-striped table-advance table-hover ">
			<thead>
				<tr>
					<th><center>DeptNo</center></th>
					<th><center>DeptName</center></th>
				</tr>			
			</thead>
			<tbody>
			<c:forEach items="${requestScope.deptList}" var="list">
				<tr id="deptName" class="cursor">
					<td><center>${list.departmentVO.deptNo}</center></td>
					<td><center>${list.departmentVO.deptName}</center></td>					
				</tr>
			</c:forEach>
			</tbody>
		</table><!-- 부서 -->
	</td>
<td width="5%"><table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table></td><%-- 공백 테이블 --%>
	<td>
	<table class="table table-striped table-advance table-hover scrolltbody">
         <thead>
			<tr>
              <th><center>EmpNo</center></th>
              <th><center>DeptName</center></th>
              <th><center>PositionName</center></th>
              <th><center>EmpName</center></th>
                <th><center>EmpTel</center></th>
			</tr>
         </thead>         
         
         <tbody id="empView">
            
         </tbody>		
	</table><!-- 사원목록 -->
	</td>
</tr>
</table>						
		</div>
	</div>
	</div>
</div>
</section>
</section>









