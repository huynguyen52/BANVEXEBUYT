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
				<input type="submit">
			</form>

		</div>
	</div>
	<ul class="footer">
		<li class="footer__item"><a href="index">Home</a></li>
		<li class="footer__item active"><a href="something">Something</a></li>
		<li class="footer__item"><a href="setting">Setting</a></li>
	</ul>
</body>