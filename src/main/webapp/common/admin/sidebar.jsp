<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.html">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			BUSS <sup>2</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li id="dashboard" class="nav-item"><a class="nav-link"
		href='<c:url value="dashboard" />'> <i
			class="fas fa-fw fa-tachometer-alt i-dashboard"></i> <span>Thống Kê</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Quản lý</div>

	<!-- Nav Item - Components Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-cog fa-spin i-components"></i> <span>Thành Phần</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Quản Lý Thành Phần:</h6>
				<a id="route" class="collapse-item" href="route">Tuyến Xe</a><a
					class="collapse-item" id="customer" href="customer">Khách Hàng</a> <a
					id="monthly-information" class="collapse-item"
					href="monthly-information">Vé Tháng</a> <a
					class="collapse-item" id="staff" href="staff">Nhân Viên</a> <a
					class="collapse-item" id="account" href="account">Tài Khoản</a> <a
					class="collapse-item" id="account" href="monthly-price">Giá Vé Tháng</a> <a
					class="collapse-item" id="account" href="price-ticket">Giá Vé Lượt</a><a
					class="collapse-item" id="account" href="bus">Xe</a> <a
					class="collapse-item" id="account" href="information-ticket">Thông Tin Vé</a>
			</div>
		</div></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Chức Năng</div>

	

	<!-- Nav Item - Assign -->
	<li id="assign" class="nav-item"><a class="nav-link" href="assign">
			<i class="fas fa-spell-check"></i> <span>Phân Công</span>
	</a></li>
	
	<!-- Nav Item - Phân công -->
	<li id="assignDetail" class="nav-item"><a class="nav-link" href="assign-detail">
			<i class="fas fa-car"></i> <span>Chi Tiết Phân Công</span>
	</a></li>



	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>