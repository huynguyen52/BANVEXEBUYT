<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div id="app">
		<div class="app__content">
			<div class="header">
				<h3 class="header__title">Welcome to Bus station</h3>
			</div>
			<div
				style="background-image: url(/BANVEXEBUS/sources/admin/img/travel.jpg); background-size: cover; background-repeat: no-repeat; background-position: right;"
				class="body">
				<div class="body__left">
					<form method="post" action="add-customer" class="form form--ticket"
						modelAttribute="customer">
						<div class="form-title ">
							<p>New customer</p>
						</div>
						<div class="form-content">
							<div class="form-group">
								<label for="">Họ tên</label> <input name="hoTen" type="text"
									value="" class="form-control form-input hoten"
									placeholder="Họ tên"> <span class="error-message"></span>
							</div>
							<div class="form-group">
								<label for="">Ngày sinh</label> <input name="ngaySinh"
									type="date" value="" class="form-control form-input ngaysinh"
									placeholder="Ngày sinh"> <span class="error-message"></span>
							</div>
							<div class="form-group">
								<label for="">Ghi chú</label> <input name="note" type="text"
									value="" class="form-control form-input" placeholder="Note">
							</div>
						</div>
						<div class="form--footer ">
							<button type="button" data-dismiss="modal" class="btn btn-dark">Cancel</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>
				<div class="body__right">
					<form method="post" action="add-exist-monthly"
						class="form form--ticket"
						modelAttribute="monthly-information-detail">
						<div class="form-title ">
							<p>New Ticket</p>
						</div>
						<div class="form-content">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="">Mã khách hàng</label> <input name="maKhachThang"
										placeholder="Khách hàng"
										class="form-control form-input makhachhang"> <span
										class="error-message"></span>
								</div>
								<div class="form-group col-md-6">
									<label for="">Mã tuyến xe</label> <input value=""
										name="maTuyenXe" class="form-control form-input matuyenxe"
										placeholder="Tuyến xe"> <span class="error-message"></span>
								</div>
							</div>

							<div class="form-group ">
								<label for="">Loại vé</label> <input list="monthPrices"
									name="maGiaThang" placeholder="Giá vé"
									class="form-control form-input magiathang"> <span
									class="error-message"></span>
							</div>
							<div class="form-group ">
								<label for="">Ngày mua</label> <input value="" name="ngayMua"
									type="date" class="form-control form-input ngaymua"
									placeholder="Ngày mua"> <span class="error-message"></span>
							</div>
						</div>
						<div class="form--footer">
							<button type="button" data-dismiss="modal" class="btn btn-dark">Cancel</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>
			</div>
			<ul class="footer">
				<li class="footer__item"><a href="banve-luot">Home</a></li>
				<li class="footer__item"><a href="#">Something</a></li>
				<li class="footer__item active"><a href="banve-thang">Setting</a></li>
			</ul>
		</div>
	</div>
</body>