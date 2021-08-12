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
		<h1 class="h3 mb-2 text-gray-800">Dữ Liệu Vé Lượt</h1>
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
<!-- 					<div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addGiaVeLuot"
							class="btn btn-success add">Thêm Giá Vé Lượt</button>
					</div> -->
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Giá</th>
								<th>Chế Độ</th>
								<th>Giá</th>
<!-- 								<th>Ngày bắt đầu áp dụng</th> -->
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Giá</th>
								<th>Chế Độ</th>
								<th>Giá</th>
<!-- 								<th>Ngày bắt đầu áp dụng</th> -->
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="gvl" items="${listGiaVeLuots }">
								<tr>
									<td>${gvl.maGia }</td>
									<td>${gvl.cheDo.tenCheDo }</td>
									<td>${gvl.giaVeLuot}</td>
								<%-- 	<td>${gvl.thoiGianApDung}</td> --%>
									<td>
<!-- 										<button data-toggle="modal" data-target="#editgiaveluot"
											class="btn btn-info btn-sm editgiaveluot">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button> -->
										

<%-- 										<button data-toggle="modal" data-target="#deleteGiaVeLuot"
											class="btn btn-danger btn-sm deletegiaveluot">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban fa-spin"></i>
											</span>
										</button> <input type="hidden" class="id" value="${gvl.maGia }" /> --%>
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