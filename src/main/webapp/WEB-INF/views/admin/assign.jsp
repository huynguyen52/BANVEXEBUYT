<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Current page- url -->
		<%
			session.setAttribute("current-url", (String) request.getAttribute("javax.servlet.forward.request_uri"));
		%>

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Phân Công Lịch Làm Việc</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<p class="m-0 text-primary">Bảng Dữ Liệu</p>
			</div>
			<div class="card-body">
				<div class="row mb-4">

					<div class="col-6">
						<!-- <form class="form d-flex">
							<div class="form-row">
								<div class="form-group col-md-6">
									<input list="routes" value="" type="text" class="form-control form-input "
										placeholder="Nhập tuyến xe">
									<datalist id="routes">
										<option value="Tuyến 58">
										<option value="Tuyến 56">
										<option value="Tuyến 57">
										<option value="Tuyến 54">
									</datalist>
								</div>
								<div class="form-group col-md-6">
									<input value="" name="email" type="date"
										class="form-control form-input ">
								</div>
							</div>
							<button style="height: 100%" type="submit" class="btn btn-violet">Submit</button>
						</form> -->

						<!-- Vu -->
						<form id="loctuyenForm" action="loctuyen" class="form d-flex">
							<div class="form-row">
								<div class="form-group col-md-6">
									<input name="tuyen" list="routes" value="" type="text"
										class="form-control form-input tuyen" placeholder="Nhập tuyến xe">
										<span class="error-message"></span>
									<datalist id="routes">
										<c:forEach items="${listTuyenXes}" var="tuyen">
											<option value=${tuyen.maTuyen }>${tuyen.tenTuyen }</option>
										</c:forEach>
									</datalist>
								</div>
								<div class="form-group col-md-6">
									<input value="" name="ngay" type="date"
										class="form-control form-input ngay">
										<span class="error-message"></span>
								</div>
							</div>
							<button style="height: 100%" type="submit" class="btn btn-violet">Xác nhận</button>
						</form>
					</div>
					<div class="col-3">
						<!-- <button data-toggle="modal" data-target="#addCTChuyenXe"
							class="btn btn-success add">New assignment</button> -->

						<!-- Vu -->
						<c:if test="${ngay!=null }">
							<button data-toggle="modal" data-target="#addCTChuyenXe"
								class="btn btn-success add">Phân Công Mới</button>
						</c:if>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered data-table" id=""
						cellspacing="0">
						<thead>
							<tr>

								<!-- Vu -->
								<c:forEach items="${listTTPCs }" var="tt">
									<th style="width: 250px; word-wrap: break-word;" class="data-table__header">${tt.hoTen }|${tt.bienSoXe }</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- <td>
									<p class="data-table__label">03:00</p>
									<p class="data-table__label data-table__label--primary">03:00</p>

									<p class="data-table__label data-table__label--success">03:00</p>

									<p class="data-table__label data-table__label--info">03:00</p>

									<p class="data-table__label data-table__label--warning">03:00</p>
									<p class="data-table__label data-table__label--danger">03:00</p>
								</td>
								<td>
									<p class="data-table__label">03:00</p>
									<p class="data-table__label data-table__label--primary">03:00</p>

									<p class="data-table__label data-table__label--success">03:00</p>

									<p class="data-table__label data-table__label--info">03:00</p>

									<p class="data-table__label data-table__label--warning">03:00</p>
								</td>
								<td>
									<p class="data-table__label">03:00</p>
									<p class="data-table__label data-table__label--primary">03:00</p>

									<p class="data-table__label data-table__label--success">03:00</p>

								</td>
								<td>
									<p class="data-table__label">03:00</p>
									<p class="data-table__label data-table__label--primary">03:00</p>

									<p class="data-table__label data-table__label--success">03:00</p>

									<p class="data-table__label data-table__label--info">03:00</p>

									<p class="data-table__label data-table__label--warning">03:00</p>
								</td>
								<td>
									<p class="data-table__label">03:00</p>
									<p class="data-table__label data-table__label--primary">03:00</p>

									<p class="data-table__label data-table__label--success">03:00</p>

									<p class="data-table__label data-table__label--info">03:00</p>

								</td> -->


								<c:set var="colors" value="${fn:split('data-table__label--primary, data-table__label--success, data-table__label--info, data-table__label--warning, data-table__label--danger', ',') }" />
								<!-- Vu -->
								<c:forEach items="${listTTPCs }" var="tt">
									<td><c:forEach items="${tt.listChuyenXes }" var="cx"
											varStatus="loop">
											<fmt:parseNumber var="index" integerOnly="true" type="number"
												value="${loop.index }" />
											<c:set var="i" value="${index%6}" />
											<p class="data-table__label ${colors[i]}">${cx.gioXuatPhat }
												- ${cx.gioKetThuc }
											</p>
										</c:forEach></td>
								</c:forEach>
							</tr>
						</tbody>




					</table>
				</div>
			</div>
		</div>

	</div>
</body>