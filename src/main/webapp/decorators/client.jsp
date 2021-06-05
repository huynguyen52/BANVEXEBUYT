<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Bus</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/jpg"
	href='<c:url value="/sources/admin/img/favicon.ico"/>' />

<!-- Custom fonts for this template -->
<link
	href='<c:url value="/sources/admin/vendor/fontawesome-free/css/all.min.css"/>'
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href='<c:url value="/sources/admin/css/sb-admin-2.min.css"/>'
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href='<c:url value="/sources/admin/vendor/datatables/dataTables.bootstrap4.min.css"/>'
	rel="stylesheet">

<!-- client css -->
<link rel="stylesheet"
	href='<c:url value="/sources/admin/css/client.css"/>'>

</head>

<body id="page-top">



	<decorator:body></decorator:body>



	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- load active element -->
	<input type="text" value="${active }" id="activeElement" hidden="true" />


	<!-- Show toast -->
	<%@include file="/common/admin/toast.jsp"%>

	<!-- Validator -->
	<script src='<c:url value="/sources/admin/js/validator.js" />'></script>



	<!-- Bootstrap core JavaScript-->
	<script
		src='<c:url value="/sources/admin/vendor/jquery/jquery.min.js" />'></script>
	<script
		src='<c:url value="/sources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"/>'></script>

	<!-- Core plugin JavaScript-->
	<script
		src='<c:url value="/sources/admin/vendor/jquery-easing/jquery.easing.min.js"/>'></script>

	<!-- Custom scripts for all pages-->
	<script src='<c:url value="/sources/admin/js/sb-admin-2.min.js"/>'></script>

	<!-- Page level plugins -->
	<script
		src='<c:url value="/sources/admin/vendor/datatables/jquery.dataTables.min.js"/>'></script>
	<script
		src='<c:url value="/sources/admin/vendor/datatables/dataTables.bootstrap4.min.js"/>'></script>

	<!-- Page level custom scripts -->
	<script
		src='<c:url value="/sources/admin/js/demo/datatables-demo.js"/>'></script>

</body>

</html>