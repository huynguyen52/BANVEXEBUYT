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
		<h1 class="h3 mb-2 text-gray-800">Data Routes</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<p class="m-0 text-primary">DataTables Example</p>
			</div>
			<div class="card-body">
				<div class="row mb-4">
					<div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addGiaVeThang"
						class="btn btn-success add">Thêm Giá Vé Tháng</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Giá</th>
								<th>Chế Độ</th>
								<th>Giá</th>
								<th>Ngày bắt đầu áp dụng</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Giá</th>
								<th>Chế Độ</th>
								<th>Giá</th>
								<th>Ngày bắt đầu áp dụng</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="gvt" items="${listGiaVeThangs}">
								<tr>
									<td>${gvt.maGia }</td>
									<td>${gvt.maCheDo }</td>
									<td>${gvt.giaVeThang}</td>
									<td>${gvt.thoiGianApDung}</td>
									<td>
										<button data-toggle="modal" data-target="#editGiaVeThang"
											class="btn btn-info btn-sm editgiavethang">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>
										<button data-toggle="modal" data-target="#deleteGiaVeThang"
											class="btn btn-danger btn-sm deletegiavethang">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban fa-spin"></i>
											</span>
										</button> <input type="hidden" class="id" value="${gvt.maGia}" />
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