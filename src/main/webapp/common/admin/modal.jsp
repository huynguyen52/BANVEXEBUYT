<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="form-title modal-header">
				<h4 class="modal-title">Ready to leave?</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p class="modal-body__desc">Select "Logout" below if you are
					ready to end your current session.</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">Hủy</button>
				<a class="btn btn-warning" href="logout">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- edit route modal -->
<div class="modal fade" id="editRoute" role="dialog">
	<div class="modal-dialog">
		<form id="editRouteForm" method="post" action="update-route"
			class="form modal-content" modelAttribute="tuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit Route</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input readonly="true" name="matuyen" type="number"
						class="form-control form-input matuyen" value=""
						placeholder="Mã tuyến"> <span class="error-message"></span>
				</div>
				<div class="form-group">
					<input readonly="true" name="tentuyen" type="text" value=""
						class="form-control form-input tentuyen" placeholder="Tên tuyến">
					<span class="error-message"></span>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input readonly="true" value="" name="thoigianchuyen"
							type="number" min="1"
							class="form-control form-input thoigianchuyen"
							placeholder="Thời gian chuyến"> <span
							class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input readonly="true" value="" name="thoigiannghi" type="number"
							min="1" class="form-control form-input thoigiannghi"
							placeholder="Thời gian nghỉ"> <span class="error-message"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name="moctuyen1" type="text"
							class="form-control form-input moctuyen1"
							placeholder="Mốc tuyến 1"> <span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input value="" name="moctuyen2" type="text"
							class="form-control form-input moctuyen2"
							placeholder="Mốc tuyến 2"> <span class="error-message"></span>
					</div>
					<div class="form-group">
						<input readonly="true" name="thoigianbatdau" type="time" value=""
							class="form-control form-input thoiGianBatDau"
							placeholder="Thời Gian Bắt Đầu"> <span
							class="error-message"></span>
					</div>
					<div class="form-group">
						<input readonly="true" name="thoigianketthuc" type="time" value=""
							class="form-control form-input thoiGianKetThuc"
							placeholder="Thời Gian Kết Thúc"> <span
							class="error-message"></span>
					</div>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>


<!-- ===============================================Route================================================== -->
<!-- add route modal -->
<div class="modal fade" id="addroute" role="dialog">
	<div class="modal-dialog">
		<form id="addRouteForm" method="post" action="add-route"
			class="form modal-content" modelAttribute="tuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">New route</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="tenTuyen" type="text" value=""
						class="form-control form-input tentuyen" placeholder="Tên tuyến">
					<span class="error-message"></span>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name="thoiGianChuyen" type="number" min="1"
							class="form-control form-input thoigianchuyen"
							placeholder="Thời gian chuyến"> <span
							class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input value="" name="thoiGianNghi" type="number" min="1"
							class="form-control form-input thoigiannghi"
							placeholder="Thời gian nghỉ"> <span class="error-message"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name="mocTuyen1" type="text"
							class="form-control form-input moctuyen1"
							placeholder="Mốc tuyến 1"> <span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input value="" name="mocTuyen2" type="text"
							class="form-control form-input moctuyen2"
							placeholder="Mốc tuyến 2"> <span class="error-message"></span>
					</div>

					<div class="form-group">
						<input name="thoigianbatdau" type="time" value=""
							class="form-control form-input thoigianbatdau"
							placeholder="Thời Gian Bắt Đầu"> <span
							class="error-message"></span>
					</div>
					<div class="form-group">
						<input name="thoigianketthuc" type="time" value=""
							class="form-control form-input thoigianketthuc"
							placeholder="Thời Gian Kết Thúc"> <span
							class="error-message"></span>
					</div>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- delete route modal -->
<div class="modal fade" id="deleteroute" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-route" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maTuyen" type="number"
					class="form-control form-input" placeholder="Mã tuyến">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>








<!-- add trip modal -->
<div class="modal fade" id="addtrip" role="dialog">
	<div class="modal-dialog">
		<form id="addTripForm" method="post" action="add-trip"
			class="form modal-content" modelAttribute="chuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">New trip</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<!-- 				<div class="form-group">
					<input name="chuyen" type="number" value=""
						class="form-control form-input chuyen" placeholder="Chuyến xe">
					<span class="error-message"></span>
				</div> -->
				<div class="form-group">
					<input list="routes" name="maTuyen" placeholder="Mã Tuyến Xe"
						class="form-control form-input matuyen"> <span
						class="error-message"></span>
					<datalist id="routes">
						<c:forEach var="route" items="${listTuyenXes}">
							<option value="${route.maTuyen }">${route.tenTuyen}</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group">
					<input name="gioXuatPhat" type="time" value=""
						class="form-control form-input gioxuatphat"
						placeholder="Giờ Xuất Phát"> <span class="error-message"></span>
				</div>
				<!-- 				<div class="form-group">
					<input name="gioKetThuc" type="time" value=""
						class="form-control form-input gioKetThuc"
						placeholder="Giờ Kết Thúc"> <span class="error-message"></span>
				</div> -->
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- edit trip modal -->
<div class="modal fade" id="editTrip" role="dialog">
	<div class="modal-dialog">
		<form id="editTripForm" method="post" action="update-trip"
			class="form modal-content" modelAttribute="chuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit trip</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="id" type="hidden" value=""
						class="form-control form-input" placeholder="Id">
				</div>
				<!-- 				<div class="form-group">
					<input name="chuyen" type="text" value=""
						class="form-control form-input chuyen" placeholder="Chuyến xe">
					<span class="error-message"></span>
				</div> -->
				<div class="form-group">
					<input readonly="" list="routes" name="maTuyen"
						placeholder="Mã Tuyến Xe" class="form-control form-input">
					<span class="error-message matuyen"></span>
					<datalist id="routes">
						<c:forEach var="route" items="${listTuyenXes}">
							<option value="${route.maTuyen }">${route.tenTuyen }</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group">
					<input name="gioXuatPhat" type="time" value=""
						class="form-control form-input gioxuatphat"
						placeholder="Giờ Xuất Phát"> <span class="error-message"></span>
				</div>
				<!-- 				<div class="form-group">
					<input name="gioKetThuc" type="time" value=""
						class="form-control form-input gioKetThuc"
						placeholder="Giờ Quay Về"> <span class="error-message"></span>
				</div> -->
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- delete trip modal -->
<div class="modal fade" id="deleteTrip" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-trip" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="id" type="number"
					class="form-control form-input" placeholder="Id">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>


<!-- add role modal -->
<div class="modal fade" id="addrole" role="dialog">
	<div class="modal-dialog">
		<form id="addRoleForm" method="post" action="add-role"
			class="form modal-content" modelAttribute="role">
			<div class="form-title modal-header">
				<h4 class="modal-title">New role</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="maRole" type="text" value=""
						class="form-control form-input marole" placeholder="Mã quyền">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="tenRole" type="text" value=""
						class="form-control form-input tenrole" placeholder="Tên quyền">
					<span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- edit role modal -->
<div class="modal fade" id="editRole" role="dialog">
	<div class="modal-dialog">
		<form id="editRoleForm" method="post" action="update-role"
			class="form modal-content" modelAttribute="role">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit role</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="maRole" readonly="true" type="text" value=""
						class="form-control form-input marole" placeholder="Mã quyền">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="tenRole" type="text" value=""
						class="form-control form-input tenrole" placeholder="Tên quyền">
					<span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- delete role modal -->
<div class="modal fade" id="deleterole" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-role" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maRole" type="text"
					class="form-control form-input" placeholder="Mã role">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>


<!-- add customer modal -->
<div class="modal fade" id="addcustomer" role="dialog">
	<div class="modal-dialog">
		<form id="addCustomerForm" method="post" action="add-customer"
			class="form modal-content" modelAttribute="customer">
			<div class="form-title modal-header">
				<h4 class="modal-title">Thêm Khách Hàng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="hoTen" type="text" value=""
						class="form-control form-input hoten" placeholder="Họ tên">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="ngaySinh" type="date" value=""
						class="form-control form-input ngaysinh" placeholder="Ngày sinh">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="note" type="text" value=""
						class="form-control form-input" placeholder="Note">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>


<!-- edit mode modal -->
<div class="modal fade" id="editMode" role="dialog">
	<div class="modal-dialog">
		<form id="editModeForm" method="post" action="update-mode"
			class="form modal-content" modelAttribute="chedo">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit mode</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-row">
					<div class="form-group col-md-6">
						<input readonly="true" value="" name="maCheDo" type="text"
							class="form-control form-input mamode" placeholder="Mã chế độ">
						<span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input value="" name="tenCheDo" type="text"
							class="form-control form-input tenmode" placeholder="Tên chế độ">
						<span class="error-message"></span>
					</div>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>
<!-- delete mode -->
<div class="modal fade" id="deleteMode" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-mode" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maCheDo" type="number"
					class="form-control form-input" placeholder="Id">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>



<!-- edit customer modal -->
<div class="modal fade" id="editKhachThang" role="dialog">
	<div class="modal-dialog">
		<form id="editCustomerForm" method="post" action="update-customer"
			class="form modal-content" modelAttribute="customer">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit customer</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<input hidden="true" type="text" class="form-control form-input"
					name="maKhachThang" />
				<div class="form-group">
					<input name="hoTen" type="text" value=""
						class="form-control form-input hoten" placeholder="Họ tên">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="ngaySinh" type="date" value=""
						class="form-control form-input ngaysinh" placeholder="Ngày sinh">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="note" type="text" value=""
						class="form-control form-input" placeholder="Note">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- delete customer -->
<div class="modal fade" id="deleteKhachThang" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-customer"
			class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maKhachThang" type="number"
					class="form-control form-input" placeholder="Mã Khách Tháng">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- add staff modal -->
<div class="modal fade" id="addstaff" role="dialog">
	<div class="modal-dialog">
		<form id="addStaffForm" method="post" action="add-staff"
			class="form modal-content" modelAttribute="nhanVien">
			<div class="form-title modal-header">
				<h4 class="modal-title">New Staff</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="hoTen" type="text" value=""
						class="form-control form-input hoten" placeholder="Họ tên">
					<span class="error-message"></span>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name=namSinh type="date"
							class="form-control form-input ngaysinh" placeholder="Ngày sinh">
						<span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<div class="form-check">
							<input checked="" class="form-check-input" type="radio"
								name="gioiTinh" id="gioiTinhRadio" value="1" checked> <label
								class="form-check-label" for="gioiTinhRadio"> Nam </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gioiTinh"
								id="gioiTinhRadio2" value="0"> <label
								class="form-check-label" for="gioiTinhRadio2"> Nữ </label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input name="soDienThoai" type="text" value=""
						class="form-control form-input" placeholder="Số điện thoại">
				</div>
				<div class="form-group">
					<input name="email" type="email" value=""
						class="form-control form-input email" placeholder="Email">
					<span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>




<!-- edit staff modal -->
<div class="modal fade" id="editStaff" role="dialog">
	<div class="modal-dialog">
		<form id="editStaffForm" method="post" action="update-staff"
			class="form modal-content" modelAttribute="nhanVien">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit Staff</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input hidden="true" name="maNhanVien" type="number" value=""
						class="form-control form-input" placeholder="Mã nhân viên">
				</div>
				<div class="form-group">
					<input name="hoTen" type="text" value=""
						class="form-control form-input hoten" placeholder="Họ tên">
					<span class="error-message"></span>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name=namSinh type="date"
							class="form-control form-input ngaysinh" placeholder="Ngày sinh">
						<span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gioiTinh"
								id="exampleRadios1" value="1"> <label
								class="form-check-label" for="exampleRadios1"> Nam </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gioiTinh"
								id="exampleRadios2" value="0"> <label
								class="form-check-label" for="exampleRadios2"> Nữ </label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input name="soDienThoai" type="text" value=""
						class="form-control form-input" placeholder="Số điện thoại">
				</div>
				<div class="form-group">
					<input name="email" type="email" value=""
						class="form-control form-input email" placeholder="Email">
					<span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- add mode modal -->
<div class="modal fade" id="addMode" role="dialog">
	<div class="modal-dialog">
		<form id="addModeForm" method="post" action="add-mode"
			class="form modal-content" modelAttribute="chedo">
			<div class="form-title modal-header">
				<h4 class="modal-title">New mode</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-row">
					<div class="form-group col-md-6">
						<input value="" name="maCheDo" type="text"
							class="form-control form-input mamode" placeholder="Mã chế độ">
						<span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input value="" name="tenCheDo" type="text"
							class="form-control form-input tenmode" placeholder="Tên chế độ">
						<span class="error-message"></span>
					</div>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- add account modal -->
<div class="modal fade" id="addAccount" role="dialog">
	<div class="modal-dialog">
		<form id="addAccountForm" method="post" enctype="multipart/form-data"
			action="add-account" class="form modal-content"
			modelAttribute="account">
			<div class="form-title modal-header">
				<h4 class="modal-title">New account</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="username" type="text" value=""
						class="form-control form-input username" placeholder="Username">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input name="password" type="password" value=""
						class="form-control form-input password" placeholder="Password">
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<input type="password" value=""
						class="form-control form-input confirmpassword"
						placeholder="Confirm password"> <span
						class="error-message"></span>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input list="roles" name="maRole" placeholder="Role"
							class="form-control form-input marole"> <span
							class="error-message"></span>
						<datalist id="roles">
							<c:forEach var="role" items="${listRoles}">
								<option value="${role.maRole }">${role.tenRole }</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group col-md-6">
						<input list="staffs" name="maNhanVien" placeholder="Nhân Viên"
							class="form-control form-input manhanvien"> <span
							class="error-message"></span>
						<datalist id="staffs">
							<c:forEach var="staff" items="${listNhanViens}">
								<option value="${staff.maNhanVien }">${staff.hoTen }</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="custom-file">
					<input name="image" type="file" id="validatedCustomFile"
						class="custom-file-input"> <label
						class="custom-file-label" for="validatedCustomFile">Choose
						file...</label> <span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>



<!-- edit account -->
<div class="modal fade" id="editaccount" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="update-account" class="form modal-content"
			enctype="multipart/form-data">
			<div class="form-title modal-header">
				<h4 class="modal-title">Edit Account</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="maTaiKhoan" type="hidden" value=""
						class="form-control form-input" placeholder="Mã Tài Khoản">
				</div>
				<div class="form-content modal-body">
					<div class="form-group">
						<input name="username" type="text" value=""
							class="form-control form-input" placeholder="Username">
					</div>

					<div class="form-group">
						<input value="" name="password" type="password"
							class="form-control form-input" placeholder="password">
					</div>


					<div class="form-row">
						<div class="form-group col-md-6">
							<input readonly="true" value="" name="maNhanVien" type="number"
								class="form-control form-input" placeholder="Mã Nhân Viên">
						</div>
						<div class="form-group col-md-6">
							<input readonly="true" value="" name="maRole" type="text"
								class="form-control form-input" placeholder="Mã Role">
						</div>
					</div>
					<div class="custom-file">
						<input name="image" type="file" id="validatedCustomFile"
							class="custom-file-input"> <label
							class="custom-file-label" for="validatedCustomFile">Choose
							file...</label> <span class="error-message"></span>
					</div>
				</div>
				<div class="form--footer modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-default">Cancel</button>
					<button type="submit" class="btn btn-success">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>


<!-- add price ticket -->
<div class="modal fade" id="addGiaVeLuot" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="add-price-ticket"
			class="form modal-content" modelAttribute="giaveluot">
			<div class="form-title modal-header">
				<h4 class="modal-title">Thêm Giá Vé Lượt</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input list="modes" name="machedo" type="text" value=""
						class="form-control form-input" placeholder="Mã Chế Độ">
					<datalist id="modes">
						<c:forEach var="mode" items="${listCheDos}">
							<option value="${mode.maCheDo }">${mode.tenCheDo}</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group">
					<input name="giaveluot" type="number" value=""
						class="form-control form-input" placeholder="Giá Vé Lượt">
				</div>
				<div class="form-group">
					<input name="thoigianapdung" type="date" pattern="dd-MM-YYYY"
						value="" class="form-control form-input"
						placeholder="Thời Gian Áp Dụng">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>
<!-- add monthly price -->
<div class="modal fade" id="addGiaVeThang" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="add-monthly-price"
			class="form modal-content" modelAttribute="giavethang">
			<div class="form-title modal-header">
				<h4 class="modal-title">Thêm Giá Vé Tháng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input list="modes" name="machedo" type="text" value=""
						class="form-control form-input" placeholder="Mã Chế Độ">
					<datalist id="modes">
						<c:forEach var="mode" items="${listCheDos}">
							<option value="${mode.maCheDo }">${mode.tenCheDo}</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group">
					<input name="giavethang" type="number" value=""
						class="form-control form-input" placeholder="Giá Vé Tháng">
				</div>
				<div class="form-group">
					<input name="thoigianapdung" type="date" pattern="dd-MM-YYYY"
						value="" class="form-control form-input"
						placeholder="Thời Gian Áp Dụng">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>
<!-- edit monthly price modal -->
<div class="modal fade" id="editGiaVeThang" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="update-monthly-price"
			class="form modal-content" modelAttribute="giavethang">
			<div class="form-title modal-header">
				<h4 class="modal-title">Chỉnh sửa Giá Vé Tháng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input readonly="true" name="magia" type="number"
						class="form-control form-input" value="" placeholder="Mã Giá">
				</div>
				<div class="form-group">
					<input name="machedo" type="text" value=""
						class="form-control form-input" placeholder="Mã Chế Độ">
				</div>
				<div class="form-group">
					<input name="giave" type="number" value=""
						class="form-control form-input" placeholder="Giá Vé Lượt">
				</div>
				<div class="form-group">
					<input name="thoigianapdung" type="date" pattern="dd-MM-YYYY"
						value="" class="form-control form-input"
						placeholder="Thời Gian Áp Dụng">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>


<!-- edit ticket-price modal -->
<div class="modal fade" id="editgiaveluot" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="update-price-ticket"
			class="form modal-content" modelAttribute="giaveluot">
			<div class="form-title modal-header">
				<h4 class="modal-title">Chỉnh sửa Giá Vé Lượt</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input readonly="true" name="magia" type="number"
						class="form-control form-input" value="" placeholder="Mã Giá">
				</div>
				<div class="form-group">
					<input name="machedo" type="text" value=""
						class="form-control form-input" placeholder="Mã Chế Độ">
				</div>
				<div class="form-group">
					<input name="giave" type="number" value=""
						class="form-control form-input" placeholder="Giá Vé Lượt">
				</div>
				<div class="form-group">
					<input name="thoigianapdung" type="date" pattern="dd-MM-YYYY"
						value="" class="form-control form-input"
						placeholder="Thời Gian Áp Dụng">
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>



<!-- delete price ticket -->
<div class="modal fade" id="deleteGiaVeLuot" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-price-ticket"
			class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maGia" type="number"
					class="form-control form-input" placeholder="Mã Giá">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- delete monthly ticket -->
<div class="modal fade" id="deleteGiaVeThang" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-monthly-price"
			class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maGia" type="number"
					class="form-control form-input" placeholder="Mã Giá">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>



<!-- add CT_Chuyen modal -->
<div class="modal fade" id="addCTChuyenXe" role="dialog">
	<div class="modal-dialog">
		<form id="addCTChuyenForm" method="post" action="add-assign"
			class="form modal-content" modelAttribute="ct_chuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">Phân Công Mới</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<label for="">Nhân viên</label> <input list="staffs"
						name="maNhanVien" type="text" value=""
						class="form-control form-input manhanvien" placeholder="Nhân viên">
					<span class="error-message"></span>
					<datalist>
						<c:forEach var="staff" items="${listNhanViens}">
							<option value="${staff.maNhanVien }">${staff.hoTen }</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group">
					<label for="">Xe</label> <input list="buses" name="bienSoXe"
						type="text" value="" class="form-control form-input biensoxe"
						placeholder="Xe">
					<datalist id="buses">
						<c:forEach var="xe" items="${listXes}">
							<option value="${xe.bienSoxe }">${xe.bienSoxe }</option>
						</c:forEach>
					</datalist>
					<span class="error-message"></span>
				</div>
				<div class="form-group">
					<label for="">Ngày bắt đầu</label> <input name="ngay" type="date"
						value="" class="form-control form-input ngay"
						placeholder="Ngày phân công"> <span class="error-message"></span>
				</div>
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- edit Phân Công modal -->
<div class="modal fade" id="editCTChuyenXe" role="dialog">
	<div class="modal-dialog">
		<form id="editCTChuyenForm" method="post" action="update-assign"
			class="form modal-content" modelAttribute="ct_chuyenxe">
			<div class="form-title modal-header">
				<h4 class="modal-title">Chỉnh sửa Phân công</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<div class="form-group">
						<div class="form-group">
							<label for="">Nhân viên</label> <input list="staffs"
								name="maNhanVien" type="text" value=""
								class="form-control form-input manhanvien"
								placeholder="Nhân viên"> <span class="error-message"></span>
						</div>
						<div class="form-group">
							<div class="form-group">
								<label for="">Xe</label> <input list="buses" name="bienSoXe"
									type="text" value="" class="form-control form-input biensoxe"
									placeholder="Xe"> <span class="error-message"></span>
							</div>
							<div class="form-group">
								<label for="">Ngày bắt đầu</label> <input name="ngay"
									type="date" value="" class="form-control form-input ngay"
									placeholder="Ngày phân công"> <span
									class="error-message"></span>
							</div>
							<input type="hidden" name="idCTChuyen" type="text" value=""
								class="form-control form-input" placeholder="Id ct chuyến">
						</div>
						<div class="form--footer modal-footer">
							<button type="button" data-dismiss="modal"
								class="btn btn-default">Hủy</button>
							<button type="Gửi" class="btn btn-success">Gửi</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>




<!-- delete staff -->
<div class="modal fade" id="deleteStaff" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-staff" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="maNhanVien" type="number"
					class="form-control form-input" placeholder="Mã Nhân Viên">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>

<!-- add new Month Ticket modal -->
<div class="modal fade" id="newMonthTicket" role="dialog">
	<div class="modal-dialog">
		<form id="addMonthTicketForm" method="post" action="add-monthly"
			class="form modal-content">
			<div class="form-title modal-header">
				<h4 class="modal-title">Thông tin Vé</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input list="customers" name="maKhachThang"
						placeholder="Khách hàng"
						class="form-control form-input makhachhang"> <span
						class="error-message"></span>
					<datalist id="customers">
						<c:forEach var="customer" items="${listKhachThangs}">
							<option value="${customer.maKhachThang}">${customer.hoTen}</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<input list="routes" value="" name="maTuyenXe"
							class="form-control form-input matuyenxe" placeholder="Tuyến xe">
						<span class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<input list="monthPrices" name="maGiaThang" placeholder="Giá vé"
							class="form-control form-input magiathang"> <span
							class="error-message"></span>
						<datalist id="monthPrices">
							<c:forEach var="price" items="${listMonthPrices}">
								<option value="${price.maGia}">${price.maCheDo }</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="form-group">
					<input value="" name="ngayMua" type="date"
						class="form-control form-input ngaymua" placeholder="Ngày mua">
					<span class="error-message"></span>
				</div>

			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>




<!-- add exist Month Ticket modal -->
<div class="modal fade" id="newExistMonthTicket" role="dialog">
	<div class="modal-dialog">
		<form id="addExistMonthTicketForm" method="post"
			action="add-exist-monthly" class="form modal-content"
			modelAttribute="monthly-information-detail">
			<div class="form-title modal-header">
				<h4 class="modal-title">New Ticket</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="">Mã khách hàng</label> <input readonly="true"
							name="maKhachThang" placeholder="Khách hàng"
							class="form-control form-input makhachhang"> <span
							class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<label for="">Mã tuyến xe</label> <input readonly="true" value=""
							name="maTuyenXe" class="form-control form-input matuyenxe"
							placeholder="Tuyến xe"> <span class="error-message"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="">Loại vé</label> <input list="monthPrices"
							name="maGiaThang" placeholder="Giá vé"
							class="form-control form-input magiathang"> <span
							class="error-message"></span>
					</div>
					<div class="form-group col-md-6">
						<label for="">Ngày mua</label> <input value="" name="ngayMua"
							type="date" class="form-control form-input ngaymua"
							placeholder="Ngày mua"> <span class="error-message"></span>
					</div>
				</div>
				<input value="" name="maVeThang" type="hidden"
					class="form-control form-input" placeholder="Mã vé tháng">
			</div>
			<div class="form--footer modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-success">Gửi</button>
			</div>
		</form>
	</div>
</div>



<!-- =======================================Bus====================================================== -->
<!-- delete bus modal -->
<div class="modal fade" id="deletebus" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-bus" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="bienSoXe" type="text"
					class="form-control form-input" placeholder="Biển Số Xe">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>
<!-- add bus modal -->
<div class="modal fade" id="addbus" role="dialog">
	<div class="modal-dialog">
		<form id="addBusForm" method="post" action="add-bus"
			class="form modal-content" modelAttribute="bus">
			<div class="form-title modal-header">
				<h4 class="modal-title">New bus</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="form-content modal-body">
				<div class="form-group">
					<input name="bienSoXe" type="text" value=""
						class="form-control form-input bienSoXe" placeholder="Biển Số Xe">
					<span class="error-message"></span>
				</div>
				<div class="form--footer modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
					<button type="Gửi" class="btn btn-success">Gửi</button>
				</div>
		</form>
	</div>
</div>

<!-- delete assignment modal -->
<div class="modal fade" id="deleteCTChuyenXe" role="dialog">
	<div class="modal-dialog">
		<form method="post" action="delete-assign" class="form modal-content">
			<div class="form--footer modal-footer d-flex justify-content-around">
				<input type="hidden" value="" name="idCTChuyen" type="number"
					class="form-control form-input" placeholder="Mã assign">
				<button type="button" data-dismiss="modal" class="btn btn-default">Hủy</button>
				<button type="Gửi" class="btn btn-danger">Gửi</button>
			</div>
		</form>
	</div>
</div>




