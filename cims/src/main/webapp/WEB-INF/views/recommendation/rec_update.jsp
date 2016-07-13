<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	 $("#write_form").submit(function(){ 
      if($("#recTitle").val()==""){
         alert("제목을 입력하세요!");
         return false;
      }
      if($("#recContent").val()==""){
         alert("본문을 입력하세요!");
         return false;
      }
	 });
});   
</script>
    <section id="main-content">
     <section class="wrapper">
          <div class = "marginMain3">
           <div class = "content-panel">
          <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>Update</h3>
<form action="${initParam.root}rec_updateResult.do" method="post" id="write_form" enctype="multipart/form-data">
      <table class = "table table-hover" style="width: 100%" >
         <tbody> 
         <tr>
         	<td style="width: 5%">No</td>
         	<td > <input name="recNo" value = "${vo.recNo}"  style="width: 90%" class="form-control" readonly="readonly" ></td>
         </tr>
            <tr>
               <td>Title</td>
               <td>
                  <input type="text" id = "recTitle" name="recTitle" class = "form-control"  style="width:  90%" value="${vo.recTitle}" >
               </td>
            </tr>
            <tr>
               <td>Writer</td>
               <td>${evo.departmentVO.deptName} ${evo.positionVO.positionName} ${evo.empName } ( ${evo.empNo} )</td>
            </tr>
            <tr>
               <td align="left" colspan="2">
                  <textarea cols="53" rows="15" id = "recContent" name="recContent" class = "form-control">${vo.recContent} </textarea>
               </td>
            </tr>
            <tr>
            	<c:choose>
								<c:when test="${'1' ne requestScope.vo.recPath}">
									<tr>
										<td style="width: 20%">AttachedFile ${vo.recPath } </td>
										<td style="width: 80%"><input type = "file" name = "recUploadFile" ></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2">AttachedFile does not exist <br> <br><input type="file" name="recUploadFile"></td>
									</tr>
								</c:otherwise>
							</c:choose>
            </tr>
         </tbody>
      </table>
      <br>
      <div align="center">
      <input type = "submit" value = "수정하기" class="btn btn-success">
      <br>
      </div>
   </form>
   </div>
   </div>
   </section>
   </section>