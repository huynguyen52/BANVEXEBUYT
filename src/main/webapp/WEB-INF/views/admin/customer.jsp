<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Dữ Liệu Khách Hàng</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<p class="m-0 text-primary">Bảng dữ liệu</p>
			</div>
			<div class="card-body">
				<div class="row mb-4">
					<div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addcustomer"
							class="btn btn-success add">Thêm Mới Khách Hàng</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Khách Hàng</th>
								<th>Họ Tên</th>
								<th>Ngày Sinh</th>
								<th>Chú Thích</th>
								<th>Action</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Khách Hàng</th>
								<th>Họ Tên</th>
								<th>Ngày Sinh</th>
								<th>Chú Thích</th>
								<th>Action</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="khachthang" items="${listKhachThangs }">
								<tr>
									<td>${khachthang.maKhachThang }</td>
									<td>${khachthang.hoTen }</td>
									<td><fmt:formatDate value="${khachthang.ngaySinh }"
											type="date" /></td>
									<td>${khachthang.note }</td>
									<td>
										<button data-toggle="modal" data-target="#editKhachThang"
											class="btn btn-info btn-sm editKhachThang">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>

										<button data-toggle="modal" data-target="#deleteKhachThang"
											class="btn btn-danger btn-sm deleteKhachThang">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button> <input type="hidden" class="id"
										value="${khachthang.maKhachThang }" />
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