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
						<button data-toggle="modal" data-target="#addroute"
							class="btn btn-success add">Add new route</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã Tuyến</th>
								<th>Tên tuyến</th>
								<th>Trạm xuất phát</th>
								<th>Trạm cuối</th>
								<th>Thời gian chuyến</th>
								<th>Giãn cách chuyến</th>
								<th>Thời gian bắt đầu</th>
								<th>Thời gian kết thúc</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã Tuyến</th>
								<th>Tên tuyến</th>
								<th>Trạm xuất phát</th>
								<th>Trạm cuối</th>
								<th>Thời gian chuyến</th>
								<th>Giãn cách chuyến</th>
								<th>Thời gian bắt đầu</th>
								<th>Thời gian kết thúc</th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="tuyen" items="${listTuyenXes }">
								<tr>
									<td>${tuyen.maTuyen }</td>
									<td>${tuyen.tenTuyen }</td>
									<td>${tuyen.mocTuyen1 }</td>
									<td>${tuyen.mocTuyen2 }</td>
									<td>${tuyen.thoiGianChuyen}</td>
									<td>${tuyen.thoiGianNghi}</td>
									<td>${tuyen.thoiGianBatDau}</td>
									<td>${tuyen.thoiGianKetThuc}</td>
									<td>
										<button data-toggle="modal" data-target="#editRoute"
											class="btn btn-info btn-sm edit">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button> <!-- <button data-toggle="modal" data-target="#deleteroute"
											class="btn btn-danger btn-sm delete">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button> --> <input type="hidden" class="id"
										value="${tuyen.maTuyen}" />
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="card shadow mb-4">
			<div class="card-header"></div>
			<div class="card-body">
				<div class="row">
					<c:forEach var="tuyen" items="${listTuyenXes }">
						<div class="col-3 mb-3">
							<a href="route-detail?tuyen=${tuyen.maTuyen }" class="box"> <span class="box__header">${tuyen.maTuyen }</span>
								<p class="box__content">${tuyen.mocTuyen1 } - ${tuyen.mocTuyen2 }</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</body>