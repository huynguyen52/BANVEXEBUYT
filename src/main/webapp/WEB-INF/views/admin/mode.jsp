<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Data Modes</h1>
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
					<!-- <div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addMode"
							class="btn btn-success add">Add new mode</button>
					</div> -->
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã chế độ</th>
								<th>Tên chế độ</th>
								<th>Action</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Mã chế độ</th>
								<th>Tên chế độ</th>
								<th>Action</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="mode" items="${listCheDos}">
								<tr>
									<td>${mode.maCheDo }</td>
									<td>${mode.tenCheDo }</td>
									<td>
										<button data-toggle="modal" data-target="#editMode"
											class="btn btn-info btn-sm editMode">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button>

										<!-- <button data-toggle="modal" data-target="#deleteMode"
											class="btn btn-danger btn-sm deleteMode">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban "></i>
											</span>
										</button> --> 
										<input type="hidden" class="id" value="${mode.maCheDo}" />
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