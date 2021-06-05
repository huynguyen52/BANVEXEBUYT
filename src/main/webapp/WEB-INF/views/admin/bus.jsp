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
				<div class="row mb-4">
					<!-- <div class="col-6 d-flex justify-content-start align-items-center">
						<button data-toggle="modal" data-target="#addbus"
							class="btn btn-success add">Add new bus</button>
					</div> -->
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Biển Số Xe</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Biển Số Xe</th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="xe" items="${listXes }">
								<tr>
									<td>${xe.bienSoxe }</td>
									<td>
										<!-- <button data-toggle="modal" data-target="#editbus"
											class="btn btn-info btn-sm edit">
											<span data-toggle="tooltip" title="Edit!"> <i
												class="fas fa-info"></i>
											</span>
										</button> -->

										<!-- <button data-toggle="modal" data-target="#deletebus"
											class="btn btn-danger btn-sm deletebus">
											<span data-toggle="tooltip" title="Delete!"> <i
												class="fas fa-ban fa-spin"></i>
											</span>
										</button> --> 
										<input type="hidden" class="id" value="${xe.bienSoxe }" />
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