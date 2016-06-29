<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript">
    $(document).ready(function() {
		$("#check").click(function() {
			location.href="${initParam.root}mail_getSendList.do?pageNo=1";
		});
		$("#write").click(function() {
			location.href="${initParam.root}mail_sendForm.do";
		});
	});
    </script>
<section id="main-content">
          <section class="wrapper">

<div class="marginMailWrite">
<div class="content-panel">
<center>
<h3>&nbsp;<i class="fa fa-angle-right"></i> Send Success !</h3>
<br>
<input type="button"  id="check" class="btn btn-primary"  value="Check Send Mail">  
<input type="button" id="write" class="btn btn-success" value="Write Mail"> 
</center>
</div></div></section></section>