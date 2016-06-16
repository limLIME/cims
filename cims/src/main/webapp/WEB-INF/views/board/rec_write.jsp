<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function content_submit() {
		document.write_form.submit();
	}
	function cancel() {
		document.write_form.reset();
	}
</script>
</head>
<body>
   <br>
   <form action="${initParam.root}recWriter_result.do" method="post"  name="write_form" enctype="multipart/form-data">
      <table border="1">
         <caption>글쓰기</caption>
         <tbody>
            <tr>
               <td>제목</td>
               <td colspan="3">
                  <input type="text" name="recTitle" size="48">
               </td>
            </tr>
            <tr>
           
               <td>${sessionScope.mvo.empName }</td>
            	<td>파일첨부 </td><td><input type = "file" name = "recUploadFile"></td>
            </tr>
            <tr>
               <td colspan="4" align="left">&nbsp;&nbsp; 
                  <textarea cols="53" rows="15" name="recContent"></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="4" align="center">
                  <img class="action" src="${initParam.root }img/write_btn.jpg" alt="글입력" onclick="content_submit()"> 
                  <img class="action" src="${initParam.root }img/cancel.gif" onclick="cancel()">
               </td>
            </tr>
         </tbody>
      </table>
   </form>
</body>