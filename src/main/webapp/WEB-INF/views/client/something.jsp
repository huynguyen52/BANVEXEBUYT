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
		<div class="body__content">
			<form class="set-bus__form" action="set-bus" method="get">
				<input list="buses" name="bus" placeholder="Chọn xe">
				<datalist id="buses">
					<c:forEach var="xe" items="${listBuses }">
						<option value="${xe.bienSoXe }" />
					</c:forEach>
				</datalist>
				<button class="set-bus__btn set-bus__btn--success" type="submit">Xác nhận</button>
			</form>
			<c:set var="veluot" scope="session" value="${sessionScope.veluot}" />
			<c:set var="xehientai" scope="session" value="${sessionScope.xe}" />
			<c:if test="${xehientai != null }">
				<div class="ticket-info">
					<div  class="ticket-info__item">
						<p>
							Số lượng vé thường: 
						</p>
						<span>${veluot.thuong }</span>
					</div>
					<div class="ticket-info__item">
						<p>
							Số lượng vé ưu tiên: 
						</p>
						<span>${veluot.uutien}</span>
					</div>
					<div class="ticket-info__item" style="padding: 8px 0; border-top: 1px solid #ccc">
						<p>
							Xe: 
						</p>
						<span>${xehientai != null ? xehientai : 'Chưa có xe' }</span>
					</div>
					<form action="add-veluot" method="post">
						<button type="submit" class="btn ticket-input__btn ticket-input__btn--success">Xác nhận</button>
					</form>
				</div>
			</c:if>

		</div>
	</div>
	<ul class="footer">
		<li class="footer__item"><a href="index">Trang chủ</a></li>
		<li class="footer__item active"><a href="something">Tổng Kết</a></li>
		<li class="footer__item"><a href="setting">Bán vé</a></li>
	</ul>
</body>