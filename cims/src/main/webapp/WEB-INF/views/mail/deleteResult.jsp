<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    $(document).ready(function() {
		$("#send").click(function() {
			location.href="${initParam.root}mail_getSendList.do?pageNo=1";
		});
		$("#receive").click(function() {
			location.href="${initParam.root}mail_getReceiveList.do?pageNo=1";
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
<h3>&nbsp;<i class="fa fa-angle-right"></i> Delete Success !</h3>
<br>
<input type="button"  id="send" class="btn btn-primary"  value="SendMail">
<input type="button"  id="receive" class="btn btn-primary"  value="ReceivedMail">   
<input type="button" id="write" class="btn btn-success" value="Write Mail"> 
</center>
</div></div></section></section>