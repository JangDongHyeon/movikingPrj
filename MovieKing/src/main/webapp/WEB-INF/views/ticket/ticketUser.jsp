<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../nav.jsp"%>

<div class="container">
	<h2>티켓 구매</h2>  
	<div class="table-responsive">
	  <table class="table">
	    <thead>
	      <tr>
		<th>총 가격</th>
		<th>결제 방법</th>
		<th>구매 날짜</th>
		<th>갯수</th>
		<th>사용 여부</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="list" items="${payList}">
	    	<tr>
	    	<td>${list.total_price}</td>
	    	<td>${list.payment_option}</td>
	    	<td>${list.payment_date}</td>
	    	<td>${list.total_ticket}</td>
	    	<c:choose>
	    	 <c:when test="${list.issue==0}">
	    	 	<td><p>미사용</p></td>
	    	 </c:when>
	    	 <c:otherwise>
	    	 	<td><p style="color: red;">사용하였습니다</p></td>
	    	 </c:otherwise>
	    	</c:choose>
	    	</tr>
	    </c:forEach>
	    </tbody>
	  </table>
	</div>
</div>


<%@include file="../footer.jsp"%>