<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="${initParam.root}recUpdate_result.do" >
      <table border="1">
         <tbody> 
         <tr>
         	<td>글번호</td>
         	<td colspan="3"> <input name="recNo" value = "${vo.recNo}" readonly="readonly"></td>
         </tr>
            <tr>
               <td>제목</td>
               <td colspan="3">
                  <input type="text" name="recTitle" size="48" value = "${vo.recTitle}">
               </td>
            </tr>
            <tr>
               <td>작성자</td>
               <td>${sessionScope.mvo.empName }</td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" name="recContent" >${vo.recContent} </textarea>
               </td>
            </tr>
         </tbody>
      </table>
      <br><br>
      <input type = "submit" value = "수정하기">
   </form>