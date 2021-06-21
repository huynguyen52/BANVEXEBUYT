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
		<h1 class="h3 mb-2 text-gray-800">Thông Tin Vé Lượt</h1>
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

					<div class="col-6">
	
						<form action="thongtinveluot" class="form d-flex">
							<div class="form-row">
								<div class="form-group col-md-6">
									<input name="tuyen" list="routes" value="" type="text"
										class="form-control form-input " placeholder="Nhập tuyến xe">
									<datalist id="routes">
										<c:forEach items="${listTuyenXes}" var="tuyen">
											<option value=${tuyen.maTuyen }>${tuyen.tenTuyen}</option>
										</c:forEach>
									</datalist>
								</div>
								<div class="form-group col-md-6">
									<input value="" name="ngay" type="date"
										class="form-control form-input ">
								</div>
							</div>
							<button style="height: 100%" type="submit" class="btn btn-violet">Submit</button>
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Nhân viên</th>
								<th>Giá vé Lượt</th>
								<th>Số Lượng</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ttvl" items="${listThongTinVeLuots}">
								<tr>
									<td>${ttvl.phanCong.nhanVien.hoTen}</td>
									<td>${ttvl.giaVeLuot.giaVeLuot}</td>
									<td>${ttvl.soLuong}</td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>