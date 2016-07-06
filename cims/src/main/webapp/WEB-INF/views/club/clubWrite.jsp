<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         <caption><h3>&nbsp;<i class="fa fa-angle-right"></i> &nbsp;Create</h3></caption>
   <form class = "form-horizontal style-form" action="${initParam.root}club_writer_result.do?" id="write_form" >
      <table class = "table table-hover">
         <tbody>
            <tr>
               <td class = "form-control::-moz-placeholder">ClubName</td>
               <td colspan="3">
                  <input type="text" name="clubName" size="48" class = "form-control" id = "title" >
               </td>
            </tr>
            <tr>           
               <td>writer</td><td>${evo.empName } </td>          	
            </tr>
            <tr>
            	<td>departNo</td><td>${evo.departmentVO.deptNo }</td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" name="clubContent" class = "form-control" id = "content" >
                  </textarea>
               </td>
               <tr>
               	<td colspan="2">동아리 창설 목적을 자세히 적어 주시오.</td>
            </tr>
            <tr>
               <td colspan="4" align="center">
            	   <button  type="button" id = "writeBtn" class="btn btn-success" >글입력</button>
      				 <button type="button" id = "resetBtn" class="btn btn-danger"  >작성취소</button>
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