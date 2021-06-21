<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">
		<!-- Current page- url -->
		<%
			session.setAttribute("current-url", (String) request.getAttribute("javax.servlet.forward.request_uri"));
		%>
		<div class="row">
			<div class="col-3">
				<div class="card profile text-center p-3"
					style="background-color: #24344d;">
					<p class="card-text text-left">Thông tin cá nhân</p>
					<img style="width: 100px;"
						class="card-img-top rounded mx-auto d-block mt-2"
						src='<c:url value="/sources/admin/img/${sessionScope.taiKhoan.image}" />'
						alt="Card image cap">
					<h4 style="font-size: 18px" class="mt-5">${account.nhanVien.hoTen}</h4>
					<p class="card-text">${account.maRole }</p>
					<div class="profile__body">
						<p class="card-text">
							<i class="fab fa-telegram-plane mr-2"></i>${account.nhanVien.email}</p>
<!-- 						<p class="card-text">
							<i class="fas fa-map-marker-alt mr-2"></i>123 Line Street, New
							Yorks
						</p> -->
					</div>
					<div class="tbody">

						<a href="#" data-toggle="modal" data-target="#editStaff"
							class="btn btn-info mt-3 editStaff">Edit</a> <input type="hidden"
							class="id" value="${account.nhanVien.maNhanVien }" />
					</div>
				</div>
			</div>
			<div class="col-7">
				<div class="panel">
					<form id="addStaffForm" modelAttribute="nhanvien" action="edit-profile" method="post"
						class="form form--profile">
						<div class="form-group">
							<h4 class="form-heading">THAY ĐỔI THÔNG TIN CÁ NHÂN</h4>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="">Fullname</label> <input value="" name="hoTen"
									type="text" class="form-control form-input hoten"
									placeholder="Fullname">
									<span class="error-message"></span>
							</div>
							<div class="form-group col-md-6">
								<label for="">Email</label> <input value="" name="email"
									type="email" class="form-control form-input email"
									placeholder="Email">
									<span class="error-message"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="">Address</label> <input value="" name="diaChi"
								type="text" class="form-control form-input"
								placeholder="Address">
						</div>
						<div class="form-group">
							<label for="">Phone</label> <input type="text"
								class="form-control" name="soDienThoai" placeholder="text">
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<label for="">Birthday</label> <input name="namSinh" type="date"
									class="form-control ngaysinh">
									<span class="error-message"></span>
							</div>
							<div class="form-group col-5 offset-1">
								<label for="" class="d-block">Gender: </label>
								<div class="custom-control custom-radio custom-control-inline ">
									<input checked="" value="1" type="radio" id="genderInputProfile1"
										name="gioiTinh" class="custom-control-input"> <label
										class="custom-control-label" for="genderInputProfile1">Male</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input value="0" type="radio" id="genderInputProfile2"
										name="gioiTinh" class="custom-control-input"> <label
										class="custom-control-label" for="genderInputProfile2">Female</label>
								</div>
							</div>

						</div>



						<button type="submit" class="btn btn-violet">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>