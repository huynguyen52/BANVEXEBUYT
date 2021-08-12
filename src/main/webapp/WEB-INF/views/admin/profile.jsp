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
					<div class="profile__img-box">
						<img style="width: 100px;"
							class="card-img-top rounded mx-auto d-block mt-2"
							src='<c:url value="/sources/admin/img/${account.image}" />'
							alt="Card image cap"> <span data-toggle="modal"
							data-target="#editImage"><i class="fas fa-camera"></i></span>
					</div>
					<h4 style="font-size: 18px" class="mt-5">${account.nhanVien.hoTen}</h4>
					<p class="card-text">${account.maRole }</p>
					<div class="profile__body">
						<p class="card-text">
							<i class="fab fa-telegram-plane mr-2"></i>${account.nhanVien.email}</p>
						<p class="card-text">
							<i class="fas fa-map-signs mr-2"></i></i>${account.nhanVien.diaChi ? account.nhanVien.diaChi : 'Chưa xác định'}</p>
						<p class="card-text">
							<i class="fas fa-birthday-cake mr-2"></i><fmt:formatDate value="${account.nhanVien.namSinh}" />
						</p>
						<!-- 						<p class="card-text">
							<i class="fas fa-map-marker-alt mr-2"></i>123 Line Street, New
							Yorks
						</p> -->
					</div>
					<div class=" mt-2 mb-2">
						<h4 id="toggleBtn">Thay đổi mật khẩu</h4>
					</div>

					<section class="password-control ">
						<form id="changePasswordForm" action="change-password"
							method="post">
							<div class="form-group text-left">
								<label for="">Mật khẩu cũ</label> <input name="old-password"
									type="password" class="form-control form-input old-password"
									placeholder="Nhập mật khẩu cũ"> <span
									class="error-message"></span>
							</div>
							<div class="form-group text-left">
								<label for="">Mật khẩu mới</label> <input name="password"
									type="password" class="form-control form-input new-password"
									placeholder="Nhập mật khẩu mới"> <span
									class="error-message"></span>
							</div>
							<div class="form-group text-left">
								<label for="">Nhập lại mật khẩu mới</label> <input name=""
									type="password"
									class="form-control form-input confirm-password"
									placeholder="Nhập lại mật khẩu mới"> <span
									class="error-message"></span>
							</div>
							<button type="submit" class="btn btn-danger">Xác Nhận</button>
						</form>
					</section>
				</div>
			</div>
			<div class="col-7">
				<div class="panel">
					<form id="editProfileForm" modelAttribute="nhanvien"
						action="edit-profile" method="post" class="form form--profile">
						<div class="form-group">
							<h4 class="form-heading">THAY ĐỔI THÔNG TIN CÁ NHÂN</h4>
						</div>
						<input hidden="" type="text"
							value="${account.nhanVien.maNhanVien }" name="maNhanVien" />
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="">Tên Đầy Đủ</label> <input
									value="${account.nhanVien.hoTen }" name="hoTen" type="text"
									class="form-control form-input hoten" placeholder="Tên Đầy Đủ">
								<span class="error-message"></span>
							</div>
							<div class="form-group col-md-6">
								<label for="">Thư Điện Tử</label> <input
									value="${account.nhanVien.email }" name="email" type="email"
									class="form-control form-input email" placeholder="Thư Điện Tử">
								<span class="error-message"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="">Địa Chỉ</label> <input
								value="${account.nhanVien.diaChi }" name="diaChi" type="text"
								class="form-control form-input" placeholder="Địaa Chỉ">
						</div>
						<div class="form-group">
							<label for="">Số Điện Thoại</label> <input type="text"
								class="form-control" value="${account.nhanVien.soDienThoai }"
								name="soDienThoai" placeholder="e.g. 013413242342">
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<label for="">Ngày Sinh</label> <input value="${ngaySinhStr }"
									name="namSinh" type="date" class="form-control ngaysinh">
								<span class="error-message"></span>
							</div>
							<div class="form-group col-5 offset-1">

								<label for="" class="d-block">Giới Tính: </label>
								<div class="custom-control custom-radio custom-control-inline ">
									<input
										<c:if test="${account.nhanVien.gioiTinh }"> <c:out value="checked"></c:out> </c:if>
										value="1" type="radio" id="genderInputProfile1"
										name="gioiTinh" class="custom-control-input"> <label
										class="custom-control-label" for="genderInputProfile1">Nam</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input
										<c:if test="${!account.nhanVien.gioiTinh }"> <c:out value="checked"></c:out> </c:if>
										value="0" type="radio" id="genderInputProfile2"
										name="gioiTinh" class="custom-control-input"> <label
										class="custom-control-label" for="genderInputProfile2">Nữ</label>
								</div>
							</div>

						</div>

						<button type="submit" class="btn btn-danger">Xác Nhận</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>