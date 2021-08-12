

$(document).ready(function() {

	//==============================================================
	//===========================dashboard==========================

	//bar-chart
	var date1Input = document.querySelectorAll('.form-search .form-search__input')[0];
	var date2Input = document.querySelectorAll('.form-search .form-search__input')[1];
	var btnSearch = document.querySelector('.form-search .form-search__btn');
	if (btnSearch) {
		btnSearch.onclick = function() {
			var dateInputValue = date1Input.value;
			var date2InputValue = date2Input.value;

			$.ajax({
				type: "POST",
				contentType: "application/json",
				url: "get-data-by-date?date=" + dateInputValue + "&date2=" + date2InputValue,
				dataType: 'json',
				data: {
					'date': dateInputValue,
					'date2': date2InputValue
				},
				success: function(data) {
					localStorage.setItem("thongtinveluot", JSON.stringify(data));

				}
			});
		}
	}


	//==============================End: dashboard===============================



	//=====================================Prevent popup modal========================
	const sessionElement = document.getElementById('sessionAccount').value;
	if (sessionElement.localeCompare('staff') == 0) {

		$('tbody ').on('click', '[class*=edit]', function(e) {
			e.stopPropagation();
			window.location.search += '&message=no-permission';
		});
		$('button[class~=add]').on('click', function(e) {
			console.log('add');
			e.stopPropagation();
			window.location.search += '&message=no-permission';
		});
		$('tbody ').on('click', '[class*=delete]', function(e) {
			e.stopPropagation();
			window.location.search += '&message=no-permission';
		});
	}

	//=====================================End: Prevent popup modal===================



	//============================route===========================
	//edit route
	$('tbody ').on('click', '.edit', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-route?matuyen=" + String(id),
			dataType: 'json',
			data: { 'matuyen': String(id) },
			success: function(data) {
				var thoiGianBatDau = getTime(data.thoiGianBatDau.hour, data.thoiGianBatDau.minute);
				var thoiGianKetThuc = getTime(data.thoiGianKetThuc.hour, data.thoiGianKetThuc.minute);
				$('#editRoute input[name="matuyen"]').val(data.maTuyen);
				$('#editRoute input[name="tentuyen"]').val(data.tenTuyen);
				$('#editRoute input[name="thoigianchuyen"]').val(data.thoiGianChuyen);
				$('#editRoute input[name="thoigiannghi"]').val(data.thoiGianNghi);
				$('#editRoute input[name="moctuyen1"]').val(data.mocTuyen1);
				$('#editRoute input[name="moctuyen2"]').val(data.mocTuyen2);
				$('#editRoute input[name="thoigianbatdau"]').val(thoiGianBatDau);
				$('#editRoute input[name="thoigianketthuc"]').val(thoiGianKetThuc);
			}
		});
	});

	//delete route
	$('tbody ').on('click', '.delete', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteroute input[name="maTuyen"]').val(id);
	});

	//tooltip bootstrap
	$('[data-toggle="tooltip"]').tooltip();


	//=======================Trip=========================
	//edit trip
	$('tbody ').on('click', '.edittrip', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-trip?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var gioXuatPhat = getTime(data.gioXuatPhat.hour, data.gioXuatPhat.minute);
				$('#editTrip input[name="id"]').val(data.id);
				$('#editTrip input[name="maTuyen"]').val(data.maTuyen);
				$('#editTrip input[name="gioXuatPhat"]').val(gioXuatPhat);
			}
		});
	});

	//delete trip
	$('tbody ').on('click', '.deletetrip', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteTrip input[name="id"]').val(id);
	});


	//get time hh:mm
	function getTime(hh, mm) {

		hh = hh < 10 ? '0' + hh : hh;
		mm = mm < 10 ? '0' + mm : mm;
		time = hh + ':' + mm;
		return time;
	}

	//================================Role==============================
	//==================================================================
	//edit role
	$('tbody ').on('click', '.editrole', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-role?marole=" + String(id),
			dataType: 'json',
			data: { 'marole': String(id) },
			success: function(data) {
				$('#editRole input[name="maRole"]').val(data.maRole);
				$('#editRole input[name="tenRole"]').val(data.tenRole);
			}
		});
	});

	//delete role
	$('tbody ').on('click', '.deleterole', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleterole input[name="maRole"]').val(id);
	});

	//================================Account==============================
	//==================================================================

	$('tbody .editaccount').on('click', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-account?maTaiKhoan=" + String(id),
			dataType: 'json',
			data: { 'maTaiKhoan': String(id) },
			success: function(data) {
				console.log(data);
				$('#editaccount input[name="maTaiKhoan"]').val(data.maTaiKhoan);
				$('#editaccount input[name="username"]').val(data.username);
				$('#editaccount input[name="password"]').val(data.password);
				$('#editaccount input[name="maRole"]').val(data.maRole);
				$('#editaccount input[name="maNhanVien"]').val(data.maNhanVien);
				$('#editaccount input[name="image"]').parent().find('label').text(data.image);

			}
		});
	});

	//==================================================================
	//========================Khach Thang ==============================
	$('tbody ').on('click', '.editKhachThang', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-customer?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var dateStr = getDateStr(data.ngaySinh);

				$('#editKhachThang input[name="maKhachThang"]').val(data.maKhachThang);
				$('#editKhachThang input[name="hoTen"]').val(data.hoTen);
				$('#editKhachThang input[name="ngaySinh"]').val(dateStr);
				$('#editKhachThang input[name="note"]').val(data.note);
			}
		});
	});

	//delete customer
	$('tbody ').on('click', '.deleteKhachThang', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteKhachThang input[name="maKhachThang"]').val(id);
	});


	//===================================================================
	//=============================Staff=================================
	$('.tbody ').on('click', '.editStaff', function() {
		var id = $(this).parent().find('.id').val();
		console.log(id);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-staff?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var dateStr = getDateStr(data.namSinh);
				var isMale = (data.gioiTinh === "true");

				$('#editStaff input[name="maNhanVien"]').val(parseInt(data.maNhanVien));
				$('#editStaff input[name="hoTen"]').val(data.hoTen);
				$('#editStaff input[name="email"]').val(data.email);
				$('#editStaff input[name="namSinh"]').val(dateStr);
				$('#editStaff input[name="soDienThoai"]').val(data.soDienThoai);
				if (isMale)
					$('#editStaff input[name="gioiTinh"][value="1"]').attr('checked', true);
				else
					$('#editStaff input[name="gioiTinh"][value="0"]').attr('checked', true);
			}
		});
	});

	//get date string
	function getDateStr(dateStr) {
		var date = new Date(dateStr);
		var day = date.getDate();
		var month = parseInt(date.getMonth()) + 1;
		var year = date.getFullYear();
		month = month < 10 ? '0' + month : month;
		day = day < 10 ? '0' + day : day;
		return year + '-' + month + '-' + day;
	}


	//delete staff
	$('tbody ').on('click', '.deleteStaff', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteStaff input[name="maNhanVien"]').val(id);
	});

	//============================mode===========================
	//edit mode
	$('tbody ').on('click', '.editMode', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-mode?maCheDo=" + String(id),
			dataType: 'json',
			data: { 'maCheDo': String(id) },
			success: function(data) {
				$('#editMode input[name="maCheDo"]').val(data.maCheDo);
				$('#editMode input[name="tenCheDo"]').val(data.tenCheDo);
			}
		});
	});

	//delete mode
	$('tbody ').on('click', '.deleteMode', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteMode input[name="maCheDo"]').val(id);
		console.log(id);
	});


	//============================Month Ticket===========================
	//add month ticket information
	$('tbody ').on('click', '.newExitMonthTicket', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "add-exit-monthly?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var ngayHetHanStr = getDateStr(data.ngayHetHan);
				
				if(new Date(ngayHetHanStr).getTime() < new Date().getTime()){
					ngayHetHanStr = getDateStr(new Date());
				}
				
				$('#newExistMonthTicket input[name="maKhachThang"]').val(data.maKhachThang);
				$('#newExistMonthTicket input[name="maTuyenXe"]').val(data.maTuyenXe);
				$('#newExistMonthTicket input[name="maGiaThang"]').val(data.maGiaThang);
				$('#newExistMonthTicket input[name="ngayMua"]').val(ngayHetHanStr);
				$('#newExistMonthTicket input[name="ngayMua"]').attr("min", ngayHetHanStr);
				$('#newExistMonthTicket input[name="maVeThang"]').val(data.maVeThang);
			}
		});
	});
	//add month ticket information in monthly-information-detail
	$('.new-exit-monthly').on('click', '.newExitMonthTicketDetail', function() {
		var id = $(this).parent().find('.id').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "add-exit-monthly-detail?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var ngayHetHanStr = getDateStr(data.ngayHetHan);
				
				if(new Date(ngayHetHanStr).getTime() < new Date().getTime()){
					ngayHetHanStr = getDateStr(new Date());
				}
				
				$('#newExistMonthTicket input[name="maKhachThang"]').val(data.maKhachThang);
				$('#newExistMonthTicket input[name="maTuyenXe"]').val(data.maTuyenXe);
				$('#newExistMonthTicket input[name="maGiaThang"]').val(data.maGiaThang);
				$('#newExistMonthTicket input[name="ngayMua"]').val(ngayHetHanStr);
				$('#newExistMonthTicket input[name="ngayMua"]').attr("min", ngayHetHanStr);
				$('#newExistMonthTicket input[name="maVeThang"]').val(data.maVeThang);
			}
		});
	});
	//Gia Ve Luot
	$('tbody .editgiaveluot').on('click', function() {
		var id = $(this).parent().find('.id').val();

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-price-ticket?magia=" + String(id),
			dataType: 'json',
			data: { 'magia': String(id) },
			success: function(data) {



				var e = new Date(data.thoiGianApDung).toLocaleDateString('en-GB');
				console.log(e);
				var f = e.split('/').reverse().join('-');

				$('#editgiaveluot input[name="magia"]').val(data.maGia);
				$('#editgiaveluot input[name="machedo"]').val(data.maCheDo);
				$('#editgiaveluot input[name="giave"]').val(data.giaVeLuot);
				$('#editgiaveluot input[name="thoigianapdung"]').val(f);

			}
		});
	});


	//delete gia ve luot
	$('tbody ').on('click', '.deletegiaveluot', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteGiaVeLuot input[name="maGia"]').val(id);

	});


	//Gia Ve Tháng
	$('tbody .editgiavethang').on('click', function() {
		var id = $(this).parent().find('.id').val();

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-monthly-price?magia=" + String(id),
			dataType: 'json',
			data: { 'magia': String(id) },
			success: function(data) {

				console.log(data);

				var e = new Date(data.thoiGianApDung).toLocaleDateString('en-GB');
				console.log(e);
				var f = e.split('/').reverse().join('-');

				$('#editGiaVeThang input[name="magia"]').val(data.maGia);
				$('#editGiaVeThang input[name="machedo"]').val(data.maCheDo);
				$('#editGiaVeThang input[name="giave"]').val(data.giaVeThang);
				$('#editGiaVeThang input[name="thoigianapdung"]').val(f);

			}
		});
	});
	//delete gia ve thang
	$('tbody ').on('click', '.deletegiavethang', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteGiaVeThang input[name="maGia"]').val(id);

	});

	//============================Phân công - assign===========================
	//edit assign
	$('tbody ').on('click', '.edit', function() {
		var id = $(this).parent().find('.id').val();
		console.log(id);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "edit-assign?id=" + String(id),
			dataType: 'json',
			data: { 'id': String(id) },
			success: function(data) {
				var dateStr = getDateStr(data.ngay);
				$('#editCTChuyenXe input[name="maNhanVien"]').val(data.maNhanVien);
				$('#editCTChuyenXe input[name="bienSoXe"]').val(data.bienSoXe);
				$('#editCTChuyenXe input[name="ngay"]').val(dateStr);
			}
		});
	});

	//delete route
	$('tbody ').on('click', '.delete', function() {
		var id = $(this).parent().find('.id').val();
		$('#deleteCTChuyenXe input[name="idCTChuyen"]').val(id);

	});

	//================================Bus====================================
	//delete bus
	$('tbody ').on('click', '.deletebus', function() {
		var id = $(this).parent().find('.id').val();
		$('#deletebus input[name="bienSoXe"]').val(id);
	});
});