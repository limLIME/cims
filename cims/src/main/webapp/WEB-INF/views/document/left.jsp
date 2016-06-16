<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 전자결재 탭 눌렀을시 보여줄 전체 리스트 / 실제로 left에 없어질꺼 -->
<a href="${initParam.root}doc_mainList.do?page=1">전체 목록</a><br>

<!-- 공문작성폼 -->
<a href="${initParam.root}doc_writeForm.do?">--공문작성--</a><br>

<!-- 결재대기 -->
<a href="${initParam.root}doc_waitingMySign.do?page=1">결재대기문서</a><br>
<!-- 내가 관련된 결재중 문저 전체 -->
<a href="${initParam.root}doc_waitingMain.do?page=1">결재중인 문서</a><br>
<a href="${initParam.root}doc_waiting.do?page=1">waiting</a><br>
<a href="${initParam.root}doc_waitingMy.do?page=1">waitingmy</a><br>

<!-- 결재완료 -->
<!-- 내가 관련된 결재완료 문저 전체 -->
<a href="${initParam.root}doc_completeMain.do?page=1">결재완료된 문서</a><br>
<a href="${initParam.root}doc_completeMy.do?page=1">completeMy</a><br>
<a href="${initParam.root}doc_completeSign.do?page=1">completeSign.</a><br>
<a href="${initParam.root}doc_complete.do?page=1">complete</a><br>

<!-- 반려함 -->
<a href="${initParam.root}doc_returnMain.do?page=1">반려된 문서</a><br>
<a href="${initParam.root}doc_returnList.do?page=1">returnList</a><br>
<a href="${initParam.root}doc_returnMy.do?page=1">returnmy</a><br>
<a href="${initParam.root}doc_returnSign.do?page=1">returnsign</a><br>

<!-- 메일 -->
<a href="${initParam.root}mail_sendForm.do">메일쓰기</a><br>
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>
<a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은 메일함</a><br>
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>
<a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸 메일함</a><br>
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>

