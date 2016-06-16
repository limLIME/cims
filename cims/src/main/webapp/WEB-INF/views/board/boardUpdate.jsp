<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="${initParam.root}free_update_result.do?boardNo=${vo.boardNo}" method="post" name="write_form">
      <table border="1">
         <tbody>
         <tr>
         	<td>글번호</td>
         	<td colspan="3">${vo.boardNo}</td>
         </tr>
            <tr>
               <td>제목</td>
               <td colspan="3">
                  <input type="text" name="boardTitle" size="48" value = "${vo.boardTitle}">
               </td>
            </tr>
            <tr>
               <td>작성자</td>
               <td>${evo.empName }</td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" name="boardContent">${vo.boardContent}</textarea>
               </td>
            </tr>
         </tbody>
      </table>
      <br><br>
      <input type = "submit" value = "수정하기">
   </form>