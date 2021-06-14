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
		<div class="body__content">
			<form action="set-bus" method="get">
				<label for="">Choose your bus</label> <input
					list="buses" name="bus" id="">
				<datalist id="buses">
				<c:forEach var="xe" items="${listBuses }">
					<option value="${xe.bienSoXe }"/>
				</c:forEach>
				</datalist>
				<button type="submit">Xác nhận</button>
			</form>
			<c:set var = "veluot" scope = "session" value = "${sessionScope.veluot}"/>
			<c:set var = "xehientai" scope = "session" value = "${sessionScope.xe}"/>
			<div>
				<p>Số lượng vé thường: <span>${veluot.thuong }</span></p>
			</div>
			<div>				
				<p>Số lượng vé ưu tiên: <span>${veluot.uutien}</span></p>
			</div>
			<div>
				<p>Xe: <span>${xehientai != null ? xehientai : 'Chưa có xe' }</span></p>
			</div>
			<form action="add-veluot" method="post">
				<button type="submit">Chốt</button>
			</form>

		</div>
	</div>
	<ul class="footer">
		<li class="footer__item"><a href="index">Home</a></li>
		<li class="footer__item active"><a href="something">Something</a></li>
		<li class="footer__item"><a href="setting">Setting</a></li>
	</ul>
</body>