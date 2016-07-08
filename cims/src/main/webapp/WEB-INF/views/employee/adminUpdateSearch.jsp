<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<section id="main-content">
	<section class="wrapper">
    <script type="text/javascript" >
   
   $(document).ready(function(){
		$("#Btn2").click(function(){
			location.href="${initParam.root}home.do?pageNo=1";
		 });//취소 시 홈으로
	   
   $("#Btn").click(function(){   
        $.ajax({
         type:"get",
        url:"emp_findByName.do",
        data:"empName="+$("#empName").val(),
        dataType:"json",
        success:function(data){
           var str = "";
           var str2 = "";
              str2 += "<tr>";
              str2 += "<th>EmpNo</th>";
              str2 += "<th>DeptName</th>";
              str2 += "<th>PositionName</th>";
              str2 += "<th>EmpName</th>";
              str2 += "<th></th>";
              str2 += "</tr>";
           $("#thead").html(str2);   
            for(var i=0;i<data.length;i++){
              str += "<tr><td>"+data[i].empNo+"</td>";
              str += "<td>"+data[i].departmentVO.deptName+"</td>";
              str += "<td>"+data[i].positionVO.positionName+"</td>";
              str += "<td>"+data[i].empName+"</td>";
              str += "<td><input type='button' value='Update' id='updateBtn' class='btn btn-theme03'></td>";
              /* str += "<td><input type='button' value='Delete' id='deleteBtn'></td>"; */
              str += "</tr>";
           }//for
            $("#empView").html(str);  
            $("#empName").val("");
        }//success
        });
     });//click
          
         
        $("#empView").on("click","#updateBtn",function(){
             if(confirm("수정하시겠습니까?")){         
                location.href = "${initParam.root}emp_adminUpdateEmp.do?empNo="+$(this).parent().parent().children().eq(0).text();
		$("#deleteBtn").click(function(){
			location.href="${initParam.root}home.do?pageNo=1";
		 });//취소 시 홈으로
             }
         });//on
   });
   
   </script>
   
		<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
		<h3>
			<i class="fa fa-angle-right"></i> Update Information of Employees by Admin
		</h3>
	<hr><br>
					<form action="${initParam.root }emp_deleteEmp.do"
						class="form-horizontal style-form" method="post"
						enctype="multipart/form-data">
						<div class="form-group">							
							<!-- <label class="col-sm-2 col-sm-2 control-label">Name or Number</label> -->
							<label class="col-sm-2 col-sm-2 control-label">이름 또는 사원번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" id="empName">
								<!-- <span class="help-block">Input the name or number of employees.</span> -->
								<span class="help-block">이름 또는 사원번호를 입력하세요</span>
							</div>
						</div>
						<center>
							<input type="button" value="Search" class="btn btn-primary" id="Btn">&nbsp;
							<input type="button" value="Cancle" class="btn btn-danger" id="Btn2">&nbsp;
						</center>
						<br>
   <table class="table">
         <thead id="thead">

         </thead>
         <tbody id="empView">
            
         </tbody>
      </table>
	</form>
		</div>
	</div>
	</div>
</div>
</section>
</section>









