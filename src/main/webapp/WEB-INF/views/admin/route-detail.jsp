<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid">

		<!-- Current page- url -->
		<%
			session.setAttribute("current-url", (String) request.getAttribute("javax.servlet.forward.request_uri"));
		%>

		<div class="card shadow mb-4">
			<div class="card-header text-center">
				<a data-toggle="tooltip" title="Go back!"
					class="previous float-left" href="route"><i
					class="fas fa-chevron-left"></i></a> ${tuyenXe.mocTuyen1 } -
								${tuyenXe.mocTuyen2 }
			</div>
			<hr />
			<div class="card-body card-info">
				<div class="row">
					<div class="col-6">
						<div class="card-info__left">
							<p class="card-info__text">
								<span>Mã tuyến </span>${tuyenXe.maTuyen }
							</p>
							<p class="card-info__text">
								<span>Tên tuyến </span>${tuyenXe.mocTuyen1 } -
								${tuyenXe.mocTuyen2 }
							</p>
							<p class="card-info__text">
								<span>Số chuyến </span>${listChuyenXes.size()} chuyến / 1 ngày
							</p>
							<p class="card-info__text">
								<span>Thời gian chuyến </span>${tuyenXe.thoiGianChuyen } phút
							</p>
							<p class="card-info__text">
								<span>Giãn cách chuyến </span>${tuyenXe.thoiGianNghi } phút
							</p>
							<table>
								<caption>Giá vé</caption>
								<tr>
									<th>#</th>
									<c:forEach var="chedo" items="${listCheDos }">
										<th>${chedo.tenCheDo }</th>
									</c:forEach>
									<!-- <th>Thường</th>
									<th>Ưu tiên</th> -->
								</tr>
								<tr>
									<td>Vé lượt</td>
									<c:forEach var="chedo" items="${listCheDos }">
										<c:forEach var="luot" items="${listGiaVeLuots }">
											<c:if test="${chedo.maCheDo eq luot.maCheDo }">
												<td><fmt:formatNumber value="${luot.giaVeLuot }" /> <sup>vnđ</sup></td>
											</c:if>
										</c:forEach>
									</c:forEach>
									<!-- <td>6.000 đ</td>
									<td>4.000 đ</td> -->
								</tr>
								<tr>
									<td>Vé tháng</td>
									<c:forEach var="chedo" items="${listCheDos }">
										<c:forEach var="thang" items="${listGiaVeThangs }">
											<c:if test="${chedo.maCheDo eq thang.maCheDo }">
												<td><fmt:formatNumber value="${thang.giaVeThang }" />
													<sup>vnđ</sup></td>
											</c:if>
										</c:forEach>
									</c:forEach>
									<!-- <td>300.000 đ</td>
									<td>200.000 đ</td> -->
								</tr>
							</table>
						</div>
					</div>
					<div class="col-6">
						<div class="card-info__right">
							<div class="card-info__header">
								<p>
									<span></span>Đi ${tuyenXe.mocTuyen1 }
								</p>
							</div>
							<ul>
								<c:set var="count" value="1" scope="page" />
								<c:forEach var="chuyen" items="${listChuyenXes }">
									<li><span>${count }</span> ${chuyen.gioXuatPhat } -
										${chuyen.gioKetThuc }</li>
									<c:set var="count" value="${count + 1}" scope="page" />
								</c:forEach>
							</ul>
							<div class="card-info__header"
								style="border-top: 1px solid #E6E9EC;">
								<p>
									<span></span>Đi ${tuyenXe.mocTuyen2 }
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>