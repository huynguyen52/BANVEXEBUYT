<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Dữ Liệu Tài Khoản</h1>
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
					<div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addAccount"
							class="btn btn-success add">Thêm Mới Tài Khoản</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã tài khoản</th>
								<th>Username</th>
								<th>Password</th>
								<th>Role</th>
								<th>Nhân viên</th>
								<th>Action</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã tài khoản</th>
								<th>Username</th>
								<th>Password</th>
								<th>Role</th>
								<th>Nhân viên</th>
								<th>Action</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="taikhoan" items="${listTaiKhoans }">
								<tr>
									<td>${taikhoan.maTaiKhoan }</td>
									<td>${taikhoan.username }</td>
									<td>***********</td>
									<td>${taikhoan.role.tenRole }</td>
									<td>${taikhoan.nhanVien.hoTen }</td>
									<td>
										<button data-toggle="modal" data-target="#editaccount"
											class="btn btn-info btn-sm editaccount">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>

										<!-- <button data-toggle="modal" data-target="#deleteAccount"
											class="btn btn-danger btn-sm deleteAccount">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button> --> 
										<input type="hidden" class="id" value="${taikhoan.maTaiKhoan }" />
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>