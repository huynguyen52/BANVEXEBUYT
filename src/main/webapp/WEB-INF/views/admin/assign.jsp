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
		<h1 class="h3 mb-2 text-gray-800">Assignment</h1>
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
						<button data-toggle="modal" data-target="#addCTChuyenXe"
							class="btn btn-success add">New assignment</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Nhân viên</th>
								<th>Biển số xe</th>
								<th>Ngày</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Nhân viên</th>
								<th>Biển số xe</th>
								<th>Ngày</th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="phanCong" items="${listPhanCongs}">
								<tr>
									<td>${phanCong.nhanVien.hoTen }</td>
									<td>${phanCong.bienSoXe }</td>
									<td><fmt:formatDate value="${phanCong.ngay }" type="date" /></td>
									
									<td>
										<!-- <button data-toggle="modal" data-target="#editCTChuyenXe"
											class="btn btn-info btn-sm edit">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button> -->

										<!-- <button data-toggle="modal" data-target="#deleteCTChuyenXe"
											class="btn btn-danger btn-sm delete">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button>  -->
										<input type="hidden" class="id" value="${phanCong.idPhanCong}" />
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