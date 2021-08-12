<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Buss - Đăng nhập</title>

<link rel="shortcut icon" type="image/jpg"
	href='<c:url value="/sources/admin/img/favicon.ico"/>' />

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href='<c:url value="/sources/admin/css/sb-admin-2.min.css" />'
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/sources/admin/css/style.css"/>'>

</head>

<body class="bg-gradient-primary">



	<!-- Nested Row within Card Body -->
	<div class="row justify-content-end"
		style="background-repeat: no-repeat; background-size: cover; background-image: url(<c:url value="/sources/admin/img/loginbg.png"/>);">
		<div class="col-lg-6 p-0 d-flex justify-content-end ">
			<div class="p-5 login-form position-relative">
				<div class="text-left">
					<h1 class="h4  mb-4">Bysss</h1>
				</div>
				<div class="text-left">
					<p class="mb-4">Nhập thư điện tử để lấy mật khẩu</p>
				</div>
				<form action="" method="post" class="user">
					<div class="form-group">
						<input type="email" name="email" class="form-control form-input"
							id="" aria-describedby="emailHelp"
							placeholder="Nhập thư điện tử">
					</div>
					<button type="submit" class="btn btn-success btn-block">
						Gửi</button>
					<a href="login" class="btn btn-default btn-block">
						Quay lại trang đăng nhập </a>
				</form>
				<div class="text-left forgot-password mt-2">
					<span class="error-message">${message }</span>
				</div>

				<p class="login-footer">2021 @ bus station</p>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script
		src='<c:url value="/sources/admin/vendor/jquery/jquery.min.js" />'></script>
	<script
		src='<c:url value="/sources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js" />'></script>

	<!-- Core plugin JavaScript-->
	<script
		src='<c:url value="/sources/admin/vendor/jquery-easing/jquery.easing.min.js" />'></script>

	<!-- Custom scripts for all pages-->
	<script src='<c:url value="/sources/admin/js/sb-admin-2.min.js" />'></script>

</body>

</html>