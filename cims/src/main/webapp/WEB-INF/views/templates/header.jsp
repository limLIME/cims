<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script type="text/javascript">
    $(document).ready(function() {
      if(${evo==null}){
         location.href="index.jsp";
      }
      
   });
    </script>
<Table>
	<tr>
		<td width="60%">
			<ul class="nav nav-tabs">
				<c:choose>
					<c:when test="${head==1}">
						<li class="active"><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class=""><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class=""><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
					<c:when test="${head==2}">
						<li class=""><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class="active"><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class=""><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
					<c:when test="${head==3}">
						<li class=""><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class=""><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class="active"><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
				</c:choose>
				<!-- <li class="disabled"><a>Disabled</a></li> -->
				<!-- 		드롭박스부분
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
					</a>
					
						<ul class="dropdown-menu">
							<li><a href="#dropdown1" data-toggle="tab">Action</a></li>
							<li class="divider"></li>
							<li><a href="#dropdown2" data-toggle="tab">Another
									action</a></li>
						</ul></li> -->
			</ul>
		</td>
		<td width="32%"
			background="${initParam.root}resources/css/home_back.png"></td>
		<td width="8%"
			background="${initParam.root}resources/css/home_back.png"><a
			href="update.do">${evo.empName}</a>님</td>
	</tr>
</Table>
