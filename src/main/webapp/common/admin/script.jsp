<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	
	let tabs = document.querySelectorAll('.card .nav-item');
	for(tab of tabs){
		tab.onclick = function(e){
			if(e.target.id == 'luot'){
				for(t of tabs){
					t.classList.remove('active');
				}
				e.target.classList.add('active');
				document.querySelector('.card table#tabluot').classList.remove('disable');
				document.querySelector('.card table#tabthang').classList.add('disable');
			}else if(e.target.id == 'thang'){
				for(t of tabs){
					t.classList.remove('active');
				}
				e.target.classList.add('active');
				document.querySelector('.card table#tabthang').classList.remove('disable');
				document.querySelector('.card table#tabluot').classList.add('disable');
			}
		}
	}
	

	//load active element
	const activeElement = document.getElementById('activeElement').value;
	const tabElement = document.getElementById('tabElement').value;
	function loadActive() {
		var active = document.getElementById(activeElement);
		var tabActive = document.getElementById(tabElement);
		if (active) {
			active.classList.add('active');
		}
		if(tabActive){
			tabActive.classList.add('active');
		}
	}
	loadActive();
	
	//edit route form
	Validator({
		form : '#editRouteForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.matuyen'),
					Validator.isRequired('.tentuyen'),
					Validator.isRequired('.thoigianchuyen'),
					Validator.isRequired('.thoigiannghi'),
					Validator.isRequired('.moctuyen1'),
					Validator.isRequired('.moctuyen2')
				]
	});
	
	//add route form
	Validator({
		form : '#addRouteForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.tentuyen'),
					Validator.isRequired('.thoigianchuyen'),
					Validator.isRequired('.thoigiannghi'),
					Validator.isRequired('.moctuyen1'),
					Validator.isRequired('.moctuyen2')
				]
	});
	
	//add trip form
/* 	Validator({
		form : '#addTripForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.chuyen'),
					Validator.isRequired('.matuyen'),
					Validator.isNumber('.matuyen'),
					Validator.isRequired('.gioxuatphat'),
					Validator.isRequired('.gioketthuc')
				]
	}); */
	
	//edit trip form
/* 	Validator({
		form : '#editTripForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.chuyen'),
					Validator.isRequired('.matuyen'),
					Validator.isRequired('.gioxuatphat'),
					Validator.isRequired('.gioketthuc'),
				]
	}); */
	
	//add role form
	Validator({
		form : '#addRoleForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.marole'),
					Validator.isRequired('.tenrole')
				]
	});
	
	//edit role form
	Validator({
		form : '#editRoleForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.marole'),
					Validator.isRequired('.tenrole')
				]
	});
	
	//add customer form
	Validator({
		form : '#addCustomerForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.ngaysinh')
				]
	});
	
	
	//edit customer form
	Validator({
		form : '#editCustomerForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.ngaysinh')
				]
	});
	
	/* //add staff form
	Validator({
		form : '#addStaffForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.namSinh'),
					Validator.isRequired('.email'),
					Validator.isEmail('.email'),
					//Validator.isNumber('.soDienThoai')
				]
	}); */
	
	//edit staff form
/* 	Validator({
		form : '#editStaffForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.ngaysinh'),
					Validator.isRequired('.email'),
					Validator.isEmail('.email'),
					Validator.isNumber('.soDienThoai')
				]
	}); */
	
	//add mode form
	Validator({
		form : '#addModeForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.mamode'),
					Validator.isSpecialChar('.mamode'),
					Validator.isRequired('.tenmode')
				]
	});
	//edit mode form
	Validator({
		form : '#editModeForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.mamode'),
					Validator.isRequired('.tenmode')
				]
	});
	
	//add account form
	Validator({
		form : '#addAccountForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.username'),
					Validator.isRequired('.password'),
					Validator.minLength('.password', 6),
					Validator.isRequired('.confirmpassword'),
					Validator.isConfirmed('.confirmpassword', function () {
						return document.querySelector('#addAccountForm .password').value;
					}, 'Mật khẩu không khớp, vui lòng nhập lại!'),
					Validator.isRequired('.marole'),
					Validator.isRequired('.manhanvien')
				]
	});
	
	//add month ticket form
	Validator({
		form : '#addMonthTicketForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.makhachhang'),
					Validator.isNumber('.makhachhang'),
					Validator.isRequired('.matuyenxe'),
					Validator.isNumber('.matuyenxe'),
					Validator.isRequired('.magiathang'),
					Validator.isNumber('.magiathang'),
					Validator.isRequired('.ngaymua')
				]
	});
	
	//add exist month ticket form
	Validator({
		form : '#addExistMonthTicketForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.makhachhang'),
					Validator.isRequired('.matuyenxe'),
					Validator.isRequired('.magiathang'),
					Validator.isRequired('.ngaymua')
				]
	});
	
	//forgot password form
	Validator({
		form : '#forgotPasswordForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.email'),
					Validator.isEmail('.email')
				]
	});
	
	//forgot password form
	Validator({
		form : '#loginForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.username'),
					Validator.isRequired('.password')
				]
	});
	
	//lọc tuyến form
	Validator({
		form : '#loctuyenForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.tuyen'),
					Validator.isRequired('.ngay')
				]
	});
	
</script>