<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="header">
		<h3 class="header__title">Xe Buýt Nhanh Hơn Xe Đạp, Rẻ Hơn Xe Máy</h3>
	</div>
	<div
		style="background-image: url(/BANVEXEBUS/sources/admin/img/station.jpg); background-size: cover; background-repeat: no-repeat; background-position: right;"
		class="body">
		<button data-toggle="modal" data-target="#exampleModal"
			class="btn btn-default btn--ticket btn--warning">Vé lượt</button>
		<a href="setting" class="btn btn-default btn--ticket btn--warning">Vé tháng</a>
	</div>
	<ul class="footer">
		<li class="footer__item active"><a href="index">Trang Chủ</a></li>
		<li class="footer__item"><a href="something">Tổng Kết</a></li>
		<li class="footer__item"><a href="setting">Bán Vé</a></li>
	</ul>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog--center-height" role="document">
			<div class="modal-content modal-content--transparent">
				<div class="modal-body modal-body--act">
					<c:set var="xehientai" scope="session" value="${sessionScope.xe}" />
					<form action="add-to-cart">
						<input hidden="" name="loai" value="thuong" /> <input hidden=""
							name="biensoxe" value="${xehientai }" />
						<button class="btn btn-default btn--ticket btn--success"
							type="submit">Thường</button>
					</form>
					<form action="add-to-cart">
						<input hidden="" name="loai" value="uutien" /> <input hidden=""
							name="biensoxe" value="${xehientai }" />
						<button class="btn btn-default btn--ticket btn--success"
							type="submit">Ưu Tiên</button>
					</form>
					<!-- 					<a href="#" class="btn btn-default btn--ticket btn--success">Thường</a>
					<a href="#" class="btn btn-default btn--ticket btn--warning">Ưu tiên</a> -->
				</div>
			</div>
		</div>
	</div>
</body>