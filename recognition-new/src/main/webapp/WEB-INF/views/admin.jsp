<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"
			href="webjars/bootstrap/3.3.7-1/css/bootstrap.css">
			<script src="webjars/jquery/3.2.1/jquery.js"></script>
			<link href="<c:url value="/resources/css/styles.css" />"
			rel="stylesheet">
			<script src="<c:url value="/resources/js/scripts.js" />"></script>
			<title>Распознавание текста на изображениях</title>
		</head>
		<body>
			<div id="wrapper">
				<div class="overlay"></div>
				<nav class="navbar navbar-inverse navbar-fixed-top"
					id="sidebar-wrapper" role="navigation">
					<ul class="nav sidebar-nav">
						<li class="sidebar-brand"><a href="/recognition-new/">Распознавание
						изображений</a></li>
						<li><a href="guide.html">Инструкция</a></li>
						<li><a href="history">История</a></li>
						<li><a href="admin">Администрирование</a></li>
					</ul>
				</nav>
				<div id="page-content-wrapper">
					<button type="button" class="hamburger is-closed"
					data-toggle="offcanvas">
					<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
				</button>
				<div class="container">
					<div class="row">
						<c:url value="/j_spring_security_logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						</form>
						<script>
							function formSubmit() {
								document.getElementById("logoutForm").submit();
							}
						</script>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
						<form action="updateToken" class="input-group" method="post">
							<input type="text" class="form-control"
							placeholder="Новый ключ" name="token">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-ok"></i>
								</button>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						</form>
						${result}
						<h2>
						<a href="javascript:formSubmit()">Выйти</a>
						</h2>
						</c:if>
					</div>
				</div>
				<div class="panel-footer navbar-fixed-bottom row-fluid"
					style="height: 36px;">
					<p style="text-align: right">© Киржаев Алексей РГРТУ 2017</p>
				</div>
			</div>
		</div>
	</body>
</html>