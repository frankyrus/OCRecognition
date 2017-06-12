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
<script src="webjars/bootstrap/3.3.7-1/js/bootstrap.min.js"></script>
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
			<li><a href="guide">Инструкция</a></li>
			<li><a href="history">История</a></li>
			<li><a href="admin.html">Администрирование</a></li>
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
					<div class="row">
						<img src="<c:url value="/resources/img/photo.jpg" />"
							class="img-thumbnail img-responsive center-block"
							style="width: 20%" alt="RSREU">
					</div>
					<div id="myCarousel" class="carousel slide">
						<ol class="carousel-indicators">
							<li class="item1 active"></li>
							<li class="item2"></li>
							<li class="item3"></li>
							<li class="item4"></li>
							<li class="item5"></li>
							<li class="item6"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img src="<c:url value="/resources/img/main.png" />" alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>Меню</h3>
									<p>Доступ к странице распознавания, истории обращений,
										инструкции и администрированию</p>
								</div>
							</div>
							<div class="item">
								<img src="<c:url value="/resources/img/start.png" />"
									alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>Стартовое окно</h3>
									<p>Распознавание целого или части изображения, слева вверху
										кнопка доступа к меню</p>
								</div>
							</div>
							<div class="item">
								<img src="<c:url value="/resources/img/history.png" />"
									alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>История обращений к сервису</h3>
									<p>Отображается порядковый номер, текст, язык и IP-адрес
										пользователя</p>
								</div>
							</div>
							<div class="item">
								<img src="<c:url value="/resources/img/login.png" />"
									alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>Форма авторизации администратора</h3>
									<p>Для доступа к смене лицензии необходимо ввести
										правильный логин и пароль</p>
								</div>
							</div>
							<div class="item">
								<img src="<c:url value="/resources/img/admin-error.png" />"
									alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>Ошибка обновления лицензии</h3>
									<p>При вводе пустого или неправильного ключа выводится
										сообщение об ошибке</p>
								</div>
							</div>
							<div class="item">
								<img src="<c:url value="/resources/img/admin-success.png" />"
									alt="RSREU">
								<div class="carousel-caption" style="color: black">
									<h3>Лицензия обновлена</h3>
									<p>Пользователь видет сообщение об успешной смене лицензии</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-footer navbar-fixed-bottom row-fluid"
				style="height: 36px;">
				<p style="text-align: right">© Киржаев Алексей РГРТУ 2017</p>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			// Activate Carousel
			$("#myCarousel").carousel();

			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#myCarousel").carousel(0);
			});
			$(".item2").click(function() {
				$("#myCarousel").carousel(1);
			});
			$(".item3").click(function() {
				$("#myCarousel").carousel(2);
			});
			$(".item4").click(function() {
				$("#myCarousel").carousel(3);
			});
			$(".item5").click(function() {
				$("#myCarousel").carousel(3);
			});
			$(".item6").click(function() {
				$("#myCarousel").carousel(3);
			});

			// Enable Carousel Controls
			$(".left").click(function() {
				$("#myCarousel").carousel("prev");
			});
			$(".right").click(function() {
				$("#myCarousel").carousel("next");
			});
		});
	</script>
	<style>
.carousel-indicators li {
	background-color: #0000ff;
	box-shadow: inset 1px 1px 1px 1px rgba(0, 0, 0, 0.5);
}

.carousel-indicators .active {
	background-color: #ffff99;
}
</style>
</body>
</html>