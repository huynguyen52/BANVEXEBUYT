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
		<h1 class="h3 mb-2 text-gray-800">Dữ Liệu Vé</h1>
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
						<button data-toggle="modal" data-target="#newMonthTicket"
							class="btn btn-success new">Thêm Mới 1 Vé</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Vé Tháng</th>
								<th>Họ tên</th>
								<th>Tuyến Xe</th>
								<th>Giá tiền</th>
								<th>Ngày Mua</th>
								<th>Ngày Hết Hạn</th>
								<th>Ghi Chú</th>
								<th>Mua vé</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Vé Tháng</th>
								<th>Họ tên</th>
								<th>Tuyến Xe</th>
								<th>Giá tiền</th>
								<th>Ngày Mua</th>
								<th>Ngày Hết Hạn</th>
								<th>Ghi Chú</th>
								<th>Mua vé</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="ttvtdt" items="${listThongTinVeThangDetails}">
								<tr>
									<td>${ttvtdt.maVeThang }</td>
									<td>${ttvtdt.thongTinVeThang.khachThang.hoTen }</td>
									<td>${ttvtdt.thongTinVeThang.tuyenXe.tenTuyen}</td>
									<fmt:setLocale value="vi-VN" />
									<td><fmt:formatNumber
											value="${ttvtdt.giaVeThang.giaVeThang}" /> <sup>vnđ</sup></td>
									<td><fmt:formatDate value="${ttvtdt.ngayMua}" /></td>
									<td><fmt:formatDate value="${ttvtdt.ngayHetHan}" /></td>
									<td>Chưa trả tiền</td>
									<td><a
										href="monthly-information-detail?mavethang=${ttvtdt.maVeThang }"
										class="btn btn-info btn-sm mr-3"> <span
											data-toggle="tooltip" title="Detail!"> <i
												class="fas fa-info"></i>
										</span>
									</a>
										<button data-toggle="modal" data-target="#newExistMonthTicket"
											class="btn btn-violet btn-sm newExitMonthTicket">
											<span data-toggle="tooltip" title="Add"> <i
												class="fas fa-plus"></i>
											</span>
										</button> <input type="hidden" class="id" value="${ttvtdt.id}" /></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>