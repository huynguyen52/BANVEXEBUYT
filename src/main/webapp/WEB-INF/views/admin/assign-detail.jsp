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
		<h1 class="h3 mb-2 text-gray-800">Phân công</h1>
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
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nhân viên</th>
								<th>Xe</th>
								<th>Ngày</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>Nhân viên</th>
								<th>Xe</th>
								<th>Ngày</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="pc" items="${listPhanCongs }">
								<tr>
									<td>${pc.idPhanCong }</td>
									<td>${pc.nhanVien.hoTen }</td>
									<td>${pc.bienSoXe }</td>
									<td><fmt:formatDate value="${pc.ngay }" /></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>