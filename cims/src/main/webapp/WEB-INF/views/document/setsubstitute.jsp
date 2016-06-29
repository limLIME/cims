<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
          <section class="wrapper">
<h3><i class="fa fa-angle-right"></i>  내 결재대행찾기폼</h3><hr><br>
<div class="marginMain">
   <div class="content-panel" align="center">
   <h2>현재 나의 결재대행보기</h2>
   ${sessionScope.evo.substitute }
   
   <h2>결재 대행 가능자</h2>
   <form action="${initParam.root}doc_substitute.do" method="post">
      <table>
     <c:forEach items="${requestScope.list }" var="sub">
	     <tr>
	     	<td>${sub.departmentVO.deptName }</td>
	     	<td>${sub.positionVO.positionName }</td>
	     	<td>${sub.empNo }</td>
	     </tr>
	     
     </c:forEach>
     
   
   </table>
   <input type="submit" value="OK">
   <input type="reset" value="Reset">
   </form>
   </div></div></section></section>