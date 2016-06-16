<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>

	<script type="text/javascript" >
	
	$(document).ready(function(){
	$("#searchName").click(function(){
		
        $.ajax({
         type:"get",
        url:"emp_findByName.do",
        data:"empName="+$("#empName").val(),
        dataType:"json",
        success:function(data){
           var str = "";
           var str2 = "";
              str2 += "<tr>";
              str2 += "<th>사원번호</th>";
              str2 += "<th>부서명</th>";
              str2 += "<th>직책</th>";
              str2 += "<th>이름</th>";
              str2 += "<th></th>";
              str2 += "</tr>";
           $("#thead").html(str2);   
            for(var i=0;i<data.length;i++){
              str += "<tr><td>"+data[i].empNo+"</td>";
              str += "<td>"+data[i].departmentVO.deptName+"</td>";
              str += "<td>"+data[i].positionVO.positionName+"</td>";
              str += "<td>"+data[i].empName+"</td>";
              str += "<td><input type='button' value='삭제' id='deleteBtn'></td>";
              str += "</tr>";
           }//for
            $("#empView").html(str);  
            $("#empName").val("");
        }//success
        });
     });//click 
   	 $("#empView").on("click","#deleteBtn",function(){
 		if(confirm("삭제하시겠습니까?")){			
     		 $.ajax({
   	         type:"get",
   	        url:"emp_deleteEmp.do",
   	        data:"empName="+$(this).parent().parent().children().eq(3).text()+"&empNo="+$(this).parent().parent().children().eq(0).text(),
   	        dataType:"json",
   	        success:function(data){
   	           var str = "";
   	           var str2 = "";
   	              str2 += "<tr>";
   	              str2 += "<th>사원번호</th>";
   	              str2 += "<th>부서명</th>";
   	              str2 += "<th>직책</th>";
   	              str2 += "<th>이름</th>";
   	              str2 += "<th></th>";
   	              str2 += "</tr>";
   	           $("#thead").html(str2);   
   	            for(var i=0;i<data.length;i++){
   	              str += "<tr><td>"+data[i].empNo+"</td>";
   	              str += "<td>"+data[i].departmentVO.deptName+"</td>";
   	              str += "<td>"+data[i].positionVO.positionName+"</td>";
   	              str += "<td>"+data[i].empName+"</td>";
   	              str += "<td><input type='button' value='삭제' id='deleteBtn'></td>";
   	              str += "</tr>";
   	           }//for
   	            $("#empView").html(str);   
   	        }//success
   	        }); 
 		}
   		});
	});
	</script>
    사원번호 또는 이름을 입력하세요 <input type="text" name="empName" id="empName"><input type="button" value="검색" id="searchName">
	<table border="1" cellpadding="5">
         <thead id="thead">

         </thead>
         <tbody id="empView">
            
         </tbody>
      </table>














