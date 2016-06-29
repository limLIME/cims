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
<form action="${initParam.root}recUpdate_result.do" method="post" id="write_form" enctype="multipart/form-data">
      <table class = "table table-hover">
         <tbody> 
         <tr>
         	<td>No</td>
         	<td colspan="3"> <input name="recNo" value = "${vo.recNo}" readonly="readonly" class = "form-control"></td>
         </tr>
            <tr>
               <td>Title</td>
               <td colspan="3">
                  <input type="text" id = "recTitle" name="recTitle" size="48" value = "${vo.recTitle}" class = "form-control">
               </td>
            </tr>
            <tr>
               <td>Writer</td>
               <td>${sessionScope.mvo.empName }</td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" id = "recContent"name="recContent" class = "form-control">${vo.recContent} </textarea>
               </td>
            </tr>
            <tr>
            	<c:choose>
								<c:when test="${'1' ne requestScope.vo.recPath}">
									<tr>
										<td>AttachedFile ${vo.recPath } </td><td><input type = "file" name = "recUploadFile" ></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2">AttachedFile does not exist</td>
										<td><input type="file" name="uploadFile"></td>
									</tr>
								</c:otherwise>
							</c:choose>
            </tr>
         </tbody>
      </table>
      <br><br>
      <div align="center">
      <input type = "submit" value = "수정하기" class="btn btn-success">
      </div>
   </form>
   </div>
   </div>
   </section>
   </section>