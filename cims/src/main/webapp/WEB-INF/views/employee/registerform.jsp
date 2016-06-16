<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
회원등록
  <form action="${initParam.root }emp_register.do" method="post" enctype="multipart/form-data">
   부서번호 <input type="text" name="deptNo" ><br>
   직급번호 <input type="text" name="positionNo"><br>
   사원번호 <input type="text" name="empNo"><br>
   이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="empName"><br>
   비밀번호 <input type="text" name="password"><br>
   전화번호 <input type="text" name="empTel"><br>
   서명<input type="file" name="multipartFile" >	
<br><br>
<input type="submit" value="사원등록">
</form>