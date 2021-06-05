<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Mã Phân Công</th>
								<th>Mã Giá Lượt</th>
								<th>Số Lượng</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>Mã Phân Công</th>
								<th>Mã Giá Lượt</th>
								<th>Số Lượng</th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="ttvl" items="${listThongTinVeLuots}">
								<tr>
									<td>${ttvl.id }</td>
									<td>${ttvl.maPhanCong}</td>
									<td>${ttvl.maGiaLuot}</td>
									<td>${ttvl.soLuong}</td>
									<td></td>
									<%-- <td>
										<button data-toggle="modal" data-target="#editThongTinVeLuot"
											class="btn btn-info btn-sm edit">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>

										<button data-toggle="modal" data-target="#deleteThongTinVeLuot"
											class="btn btn-danger btn-sm delete">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban fa-spin"></i>
											</span>
										</button> <input type="hidden" class="id" value="${ttvl.id }" />
									</td> --%>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>