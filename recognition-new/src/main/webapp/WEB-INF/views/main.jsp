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
			<script>
				$(document).ready(
						function() {
							$('#input-file').change(
									function() {
										var filename = $(this).val();
										$('#txtFileName').val(filename);
										var fileExtension = "${types}".split(/\.|,./g);
										if ($.inArray(filename.split('.').pop()
												.toLowerCase(), fileExtension) == -1) {
											alert("Only ${types} formats are allowed.");
										}
									});
						})
			</script>
			<title>Распознавание текста на изображениях</title>
		</head>
		<body>
			<form action="recognition" method="POST" name="recognition-form"
				enctype="multipart/form-data">
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
							<div class="row">
								<img src="<c:url value="/resources/img/photo.jpg" />"
								class="img-thumbnail img-responsive center-block"
								style="width: 20%" alt="RSREU">
							</div>
							<h1>Выгрузите файл для начала распознавания</h1>
							<div class="progress hidden">
								<div
									class="progress-bar progress-bar-striped progress-bar-success active"
									role="progressbar" style="width: 100%">Происходит
								обработка</div>
							</div>
							<div class="col-sm-6" style="background-color: lavender;">
								<input id="input-file" type="file" style="width: 100%"
								name="file" class="row filestyle" data-input="true"
								data-buttonText="Выберите файл" accept="${types}"><br />
								<div class="row form-group form-inline">
									<label for="sel1">Язык:</label> <select class="form-control"
									id="sel1" name="lang">
									<option value="rus" ${lang == "rus" ? 'selected' : ''} selected>Русский</option>
									<option value="eng" ${lang == "eng" ? 'selected' : ''}>Английский</option>
								</select> <input type="submit" class="btn btn-success pull-right"
								value="Загрузить">
							</div>
							<div class="row" style="text-align: center">${error}</div>
							<div class="row form-group">
								<label for="result">Результат:</label>
								<textarea class="form-control" rows="20" id="result">${result}</textarea>
							</div>
						</div>
						<div class="col-sm-6" style="background-color: lavender;">
							<div class="row" ng-app="app" ng-controller="Ctrl">
								<input type="file" id="fileInput" style="width: 100%"
								name="file" class="row filestyle" data-input="true"
								data-buttonText="Выберите файл" accept=".png,.jpg,.tiff"><br />
								<input type="text" class="hidden"
								data-ng-model="cropper.cropWidth" name="test">
								<div class="cropArea">
									<img-crop cropject="cropper" image="myImage"
									result-image="myCroppedImage" area-type="square"
									result-image-quality="1.0"></img-crop>
								</div>
								<div class="row">
									<div class="center-block" style="width: 200px;">Обрезанное
									изображение:</div>
									<div class="center-block" style="width: 200px;">
										<img ng-src="{{myCroppedImage}}" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		</form>
		<div class="panel-footer navbar-fixed-bottom row-fluid"
			style="height: 36px;">
			<p style="text-align: right">© Киржаев Алексей РГРТУ 2017</p>
		</div>
	</body>
</html>