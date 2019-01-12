<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MovieKing</title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/css/all.min.css" rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="/resources/css/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/creative.min.css" rel="stylesheet">
<!-- Google Map Key -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav" style="background-color: white;">
		<div class="container">
			<a style="color:black;" class="navbar-brand js-scroll-trigger" href="/">MovieKing</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="${pageContext.request.contextPath}/movies/list">영화</a></li>

					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="${pageContext.request.contextPath}/ticket/">예매</a></li>

					<sec:authorize access="isAnonymous()">
						<c:url var="loginUrl" value="/user/login" />
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${loginUrl}">로그인</a></li>
					</sec:authorize>

						<sec:authorize access="isAuthenticated()">
						<li class="nav-item">
							<a class="nav-link js-scroll-trigger"
							href="/ticket/buyTicket">티켓 </a>
						</li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
							<form action="${logoutUrl}" method="post">
								<button type="submit" class="btn btn-default">로그아웃</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form></li>
					</sec:authorize>

					<li class="nav-item">
						<form action="#">
							<input type="text" name="search">
						</form>
					</li>
					<li class="nav-item">
						<button class="btn btn-warning">검색</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>