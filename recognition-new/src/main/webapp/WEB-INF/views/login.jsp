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
			<link href="<c:url value="/resources/css/ng-img-crop.css" />"
			rel="stylesheet">
			<script src="<c:url value="/resources/js/scripts.js" />"></script>
			<script src="<c:url value="/resources/js/bootstrap-filestyle.min.js" />"></script>
			<script src="<c:url value="/resources/js/ng-img-crop.js" />"></script>
			<title>Распознавание текста на изображениях</title>
			<style>
			body {
				background: #eee !important;
			}
			.wrapper {
				margin-top: 80px;
				margin-bottom: 80px;
			}
			.form-signin {
				max-width: 380px;
				padding: 15px 35px 45px;
				margin: 0 auto;
				background-color: #fff;
				border: 1px solid rgba(0, 0, 0, 0.1);
				.
				form-signin-heading
				,
				.checkbox
				{
				margin-bottom
				:
				30px;
			}
			.checkbox {
				font-weight: normal;
			}
			.form-control {
				position: relative;
				font-size: 16px;
				height: auto;
				padding: 10px;
				@
				include
				box-sizing(border-box);
				&:
				focus
				{
				z-index
				:
				2;
			}
			}
			input[type="text"] {
				margin-bottom: -1px;
				border-bottom-left-radius: 0;
				border-bottom-right-radius: 0;
			}
			input[type="password"] {
				margin-bottom: 20px;
				border-top-left-radius: 0;
				border-top-right-radius: 0;
			}
			}
			</style>
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
						<div id="login-box">
							<h2>Авторизуйтесь для доступа к настройкам</h2>
							<form class="form-signin" name='loginForm'
								action="<c:url value='j_spring_security_check' />" method='POST'>
								<div class="wrapper">
									<c:if test="${not empty msg}">
									<div style='text-align:center' class="alert alert-info">${msg}</div>
									</c:if>
									<c:if test="${not empty error}">
									<div style='text-align:center' class="alert alert-danger">${error}</div>
									</c:if>
									<div class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
										<input type="text" class="form-control" name="username"
										placeholder="Логин" required="true" autofocus="true" />
									</div> <br>
									<div class="input-group">
										<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="password"
										class="form-control" name="password" placeholder="Пароль"
										required="true" />
									</div>
									<br>
									<button class="btn btn-lg btn-primary btn-block" name="submit"
									type="submit">Войти</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							</form>
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