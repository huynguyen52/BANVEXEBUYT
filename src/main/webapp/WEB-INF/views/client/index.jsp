<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="header">
		<h3 class="header__title">Welcome to Bus station</h3>
	</div>
	<div
		style="background-image: url(/BANVEXEBUS/sources/admin/img/travel.jpg); background-size: cover; background-repeat: no-repeat; background-position: right;"
		class="body">
		<div class="body__left">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.520312336471!2d106.78445561428745!3d10.847973960836548!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752772b245dff1%3A0xb838977f3d419d!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCxrB1IGNow61uaCBWaeG7hW4gdGjDtG5nIEPGoSBT4bufIFThuqFpIFRQLiBI4buTIENow60gTWluaMK3!5e0!3m2!1svi!2s!4v1622008328042!5m2!1svi!2s"
				width="100%" height="100%" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe>
		</div>
		<div class="body__right">
			<button data-toggle="modal" data-target="#exampleModal"
				class="btn btn-default btn--ticket">Vé lượt</button>
			<a href="setting" class="btn btn-default btn--ticket">Vé tháng</a>
		</div>
	</div>
	<ul class="footer">
		<li class="footer__item active"><a href="index">Home</a></li>
		<li class="footer__item"><a href="something">Something</a></li>
		<li class="footer__item"><a href="setting">Setting</a></li>
	</ul>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog--center-height" role="document">
			<div class="modal-content modal-content--transparent">
				<div class="modal-body modal-body--act">
				<c:set var = "xehientai" scope = "session" value = "${sessionScope.xe}"/>
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