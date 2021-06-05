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
		<h1 class="h3 mb-2 text-gray-800">Data Tickets</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo
			table below. For more information about DataTables, please visit the
			<a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<a data-toggle="tooltip" title="Go back!" class="previous"
					href="monthly-information"><i class="fas fa-chevron-left"></i></a>
			</div>
			<div class="card-body">
				<div class="row mb-4">
					<div
						class="col-6 d-flex justify-content-start align-items-center new-exit-monthly">
						<button data-toggle="modal" data-target="#newExistMonthTicket"
							class="btn btn-success newExitMonthTicketDetail">Add new
							ticket</button>
						<!-- lay ra ma ve thang cua thongtinvethang detail -->
						<input type="hidden" class="id" value="${listThongTinVeThangDetails[0].maVeThang}" />
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

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>