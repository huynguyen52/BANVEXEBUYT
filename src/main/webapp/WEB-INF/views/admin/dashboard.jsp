<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-4">
				<h1 class="h3 mb-2 text-gray-800">Dashboard</h1>
			</div>
		</div>


		<!-- Content Row -->
		<div class="row">

			<div class="col-5">
				<!-- Bar Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row">
							<div class="col-6">
								<form action="dashboard" method="GET" class="form-search">
									<div class="form-group">
										<input id="searchBar" name="date"
											class="form-control form-input form-search__input"
											type="date" />
										<!-- <input name="date2"
							class="form-control form-input form-search__input" type="date" /> -->
										<!-- <button class="btn btn-success form-search__btn">
											<i class="fas fa-search"></i>
										</button> -->
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="chart-bar">
							<canvas id="myBarChart"></canvas>
						</div>
						<hr>
						Thống kê số lượng vé bán ra theo ngày trong tuần này.
					</div>
				</div>
			</div>
			<div class="col-7">
				<!-- Area Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
					</div>
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
						<hr>
						Thống kê số tiền bán được theo các tháng.
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-8 col-lg-8">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<form action="dashboard" method="get" class="form-search">
							<div class="form-group">
								<input name="from"
									class="form-control form-input form-search__input--datatable"
									type="date" /> <input name="to"
									class="form-control form-input form-search__input--datatable"
									type="date" />
								<button class="btn btn-success form-search__btn--datatable">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs nav--tab">
								<li class="nav-item"><a class="nav-link" id="luot"
									href="dashboard?kind=luot&from=${fromDate }&to=${toDate}">Vé
										lượt</a></li>
								<li class="nav-item"><a class="nav-link" id="thang"
									href="dashboard?kind=thang&from=${fromDate }&to=${toDate}">Vé
										tháng</a></li>
							</ul>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<c:if test="${tab eq 'luot' }">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Xe</th>
											<th>Nhân viên</th>
											<th>Ngày</th>
											<th>Loại vé</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Xe</th>
											<th>Nhân viên</th>
											<th>Ngày</th>
											<th>Loại vé</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="ttvl" items="${listThongTinVeLuots }">
											<tr>
												<td>${ttvl.phanCong.bienSoXe }</td>
												<td>${ttvl.phanCong.nhanVien.hoTen}</td>
												<td><fmt:formatDate value="${ttvl.phanCong.ngay }"
														type="date" /></td>
												<td>${ttvl.giaVeLuot.maCheDo }</td>
												<td>${ttvl.soLuong}</td>
												<th><fmt:formatNumber
														value="${ttvl.soLuong * ttvl.giaVeLuot.giaVeLuot}" /> <sup>vnđ</sup></th>
											</tr>
										</c:forEach>

									</tbody>

								</table>
							</c:if>
							<c:if test="${tab eq 'thang' }">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Tuyến xe</th>
											<th>Chuyến xe</th>
											<th>Ngày</th>
											<th>Loại</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
											<th>Ghi chú</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Tuyến xe</th>
											<th>Chuyến xe</th>
											<th>Ngày</th>
											<th>Loại</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
											<th>Ghi chú</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="ttvt" items="${listThongTinVeThangDetails }">
											<tr>
												<td>${ttvt.thongTinVeThang.tuyenXe.tenTuyen }</td>
												<td>${ttvt.thongTinVeThang.khachThang.hoTen }</td>
												<td><fmt:formatDate value="${ttvt.ngayMua }"
														type="date" /></td>
												<td>${ttvt.giaVeThang.giaVeThang}</td>
												<td><fmt:formatDate value="${ttvt.ngayHetHan }"
														type="date" /></td>
												<td>100</td>
												<td>Chưa trả tiền</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<!-- Donut Chart -->
			<div class="col-xl-4 col-lg-4">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-pie pt-4">
							<canvas id="myPieChart"></canvas>
						</div>
						<hr>
						Số lượng vé tháng, vé thường, vé ưu tiên trong tháng
					</div>
				</div>
			</div>

		</div>


	</div>
	<script>
		
	</script>
	<!-- /.container-fluid -->
	<!-- Page level plugins -->
	<script
		src='<c:url value="/sources/admin/vendor/chart.js/Chart.min.js"/>'></script>

	<!-- Page level custom scripts -->
	<script
		src='<c:url value="/sources/admin/js/demo/chart-area-demo.js"/>'></script>
	<script src='<c:url value="/sources/admin/js/demo/chart-pie-demo.js"/>'></script>
	<script src='<c:url value="/sources/admin/js/demo/chart-bar-demo.js"/>'></script>
</body>