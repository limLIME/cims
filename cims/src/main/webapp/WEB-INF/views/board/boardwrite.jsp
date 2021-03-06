<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){ 
		if($("#title").val()==""){
			alert("제목을 입력하세요!");
		}else if($("#content").val()==""){
			alert("본문을 입력하세요!");
		}else{
			$("#write_form").submit();
		}
	});
	$("#resetBtn").click(function(){    		
		$("#write_form")[0].reset();
	});
});	
</script>
</head>
<body>
<section id="main-content">
     <section class="wrapper">
   <br>
   <div class = "marginMain3">
    <div class = "content-panel">
         <caption><h3>&nbsp;<i class="fa fa-angle-right"></i> Write</h3></caption>
   <form class = "form-horizontal style-form" action="${initParam.root}free_writer_result.do" id="write_form" method="post" enctype="multipart/form-data">
      <table class = "table table-hover">
         <tbody>
            <tr>
               <td class = "form-control::-moz-placeholder">Title</td>
               <td colspan="3">
                  <input type="text" name="boardTitle" size="48" class = "form-control" id = "title">
               </td>
            </tr>
            <tr>           
               <td>Writer</td><td>${evo.departmentVO.deptName } ${evo.positionVO.positionName } ${evo.empName } ( ${evo.empNo } )</td>          	
            </tr>
            <tr>
            	<td>File </td><td><input type = "file" name = "uploadFile" class = "form-control" ></td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" name="boardContent" class = "form-control" id = "content"></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="4" align="center">
            	   <button  type="button" id = "writeBtn" class="btn btn-success" >Write</button>&nbsp;&nbsp;
      				 <button type="button" id = "resetBtn" class="btn btn-danger"  >Reset</button>
               </td>
            </tr>
         </tbody>
      </table>
   </form>
   </div>
   </div>
   </section>
   </section>
</body>