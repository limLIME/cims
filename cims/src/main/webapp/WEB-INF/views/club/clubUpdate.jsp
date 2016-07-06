<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <section id="main-content">
     <section class="wrapper">
     <div class = "marginMain3">
     <div class = "content-panel">
     <h3>&nbsp;<i class="fa fa-angle-right"></i>수정하기</h3>
     <hr>
<form action="${initParam.root}clubUpdate_result.do"  name="write_form" >
      <table class = "table table-hover">
         <tbody>
         <tr>
         	<td>글번호</td>
         	<td colspan="3"><input type = "text" name = "clubNo" value = "${vo.clubNo }"></td>
         </tr>
            <tr>
               <td>동아리명</td>
               <td colspan="3">
                  <input type="text" name="clubName" size="48" value = "${vo.clubName}" class = "form-control"  readonly="readonly">
               </td>
            </tr>
            <tr>
               <td>작성자</td>
               <td>${evo.empName }</td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="60" rows="15" name="clubContent" class = "form-control" >${vo.clubContent} </textarea>
               </td>
            </tr>
         </tbody>
      </table>
      <br><br>
      <input type = "submit" value = "수정하기" class="btn btn-success">
   </form>
   </div>
   </div>
   </section>
   </section>