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
<script src="webjars/angular/1.6.4/angular.js"></script>
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/ng-img-crop.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/scripts.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-filestyle.min.js" />"></script>
<script src="<c:url value="/resources/js/ng-img-crop.js" />"></script>
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
			<li><a href="guide">Инструкция</a></li>
			<li><a href="history">История</a></li>
			<li><a href="admin.html">Администрирование</a></li>
		</ul>
		</nav>
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed" data-toggle="offcanvas">
				<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
					class="hamb-bottom"></span>
			</button>
			<div class="container">
				<div class="row">
					<div class="row">
						<img src="<c:url value="/resources/img/photo.jpg" />"
							class="img-thumbnail img-responsive center-block"
							style="width: 20%" alt="RSREU">
					</div>
					<h2>История обращений к сервису</h2>
					<p>Выводятся последние 50 обращений</p>
					<div class="row" style="text-align: center">${error}</div>
					<div class="panel panel-default">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th>Код</th>
									<th>Результат</th>
									<th>Язык</th>
									<th>Адрес</th>
								</tr>
							</thead>
							<tbody>${result}</tbody>
						</table>
					</div>
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