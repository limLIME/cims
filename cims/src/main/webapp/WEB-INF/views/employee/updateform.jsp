<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="${initParam.root }emp_update.do" method="post" enctype="multipart/form-data" >
   부서번호 <input type="text" name="deptNo" readonly="readonly" value="${sessionScope.evo.departmentVO.deptNo }"><br>
   직급번호 <input type="text" name="positionNo" readonly="readonly" value="${sessionScope.evo.positionVO.positionNo }"><br>
   사원번호 <input type="text" name="empNo" readonly="readonly" value="${sessionScope.evo.empNo }"><br>
   이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="empName" readonly="readonly" value="${sessionScope.evo.empName }"><br>
   비밀번호 <input type="text" name="password" value="${sessionScope.evo.password }"><br>
   전화번호 <input type="text" name="empTel" value="${sessionScope.evo.empTel }"><br>
   서명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="file" name="multipartFile">
<br><br>
<input type="submit" value="정보수정">
<input type="reset" value="리셋">
</form>