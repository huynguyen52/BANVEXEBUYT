<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- show toast -->
<div aria-live="polite" aria-atomic="true"
	style="position: absolute; top: 0; left: 0; right: 0;">
	<c:if test="${param.message eq 'no-permission' }">
		<div class="toast toast--error d-flex align-items-center" role="alert"
			aria-live="assertive" aria-atomic="true" data-delay="2500"
			style="position: absolute; top: 190px; right: 30px; min-width: 250px;">
			<div class="toast__icon">
				<i class="fas fa-exclamation"></i>
			</div>
			<div class="toast__content">
				<div class="toast-body">Bạn không có quyền truy cập mục này!!!</div>
			</div>
		</div>
	</c:if>
	<c:if test="${message eq 'success' }">

		<div class="toast toast--success d-flex align-items-center"
			role="alert" aria-live="assertive" aria-atomic="true"
			data-delay="2500"
			style="position: absolute; top: 190px; right: 30px; min-width: 250px;">
			<div class="toast__icon">
				<i class="fas fa-check"></i>
			</div>
			<div class="toast__content">
				<div class="toast-body">Thao tác thành công!!!</div>
			</div>
		</div>
	</c:if>
	<c:if test="${message eq 'error' }">
		<div class="toast toast--error d-flex align-items-center" role="alert"
			aria-live="assertive" aria-atomic="true" data-delay="2500"
			style="position: absolute; top: 190px; right: 30px; min-width: 250px;">
			<div class="toast__icon">
				<i class="fas fa-exclamation"></i>
			</div>
			<div class="toast__content">
				<div class="toast-body">Có gì đó không ổn! Vui lòng kiểm tra lại</div>
			</div>
		</div>
	</c:if>
</div>
