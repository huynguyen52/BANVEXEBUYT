<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Dữ Liệu Nhân Viên</h1>
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
						<button data-toggle="modal" data-target="#addstaff"
							class="btn btn-success add">Thêm Mới Nhân Viên</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Nhân Viên</th>
								<th>Họ Tên</th>
								<th>Ngày sinh</th>
								<th>Số điện thoại</th>
								<th>Email</th>
								<th>Giới tính</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Nhân Viên</th>
								<th>Họ Tên</th>
								<th>Ngày sinh</th>
								<th>Số điện thoại</th>
								<th>Email</th>
								<th>Giới tính</th>
								<th></th>
							</tr>
						</tfoot>
						<tbody class="tbody">
							<c:forEach var="nhanvien" items="${listNhanViens }">
								<tr>
									<td>${nhanvien.maNhanVien }</td>
									<td>${nhanvien.hoTen }</td>
									<td><fmt:formatDate value="${nhanvien.namSinh }"
											type="date" /></td>
									<td>${nhanvien.soDienThoai }</td>
									<td>${nhanvien.email }</td>
									<c:if test="${nhanvien.gioiTinh == true }">
										<td>Nam</td>
									</c:if>
									<c:if test="${nhanvien.gioiTinh == false }">
										<td>Nữ</td>
									</c:if>
									<td>
										<button data-toggle="modal" data-target="#editStaff"
											class="btn btn-info btn-sm editStaff">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>

										<button data-toggle="modal" data-target="#deleteStaff"
											class="btn btn-danger btn-sm deleteStaff">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button> <input type="hidden" class="id"
										value="${nhanvien.maNhanVien }" />
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