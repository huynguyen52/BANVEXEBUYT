<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	
	const profile = document.querySelector('.card.profile');
	if(profile){
		const toggleBtn = profile.querySelector('#toggleBtn');
		toggleBtn.onclick = function () {
			const passwordCtrl = profile.querySelector('.password-control');
			passwordCtrl.classList.toggle("show");
		}
	}
	


	const addMonthTicketForm = document.getElementById('addMonthTicketForm');
	const dateInput = addMonthTicketForm.querySelector('input[name="ngayMua"]');
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

today = yyyy+'-'+mm+'-'+dd;
dateInput.setAttribute("min", today);
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
	
	 //add staff form
	Validator({
		form : '#addStaffForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
			Validator.isRequired('.hoten'),
			Validator.isRequired('.ngaysinh'),
			Validator.isRequired('.email'),
			Validator.isRequired('.soDienThoai'),
			Validator.isEmail('.email'),
			Validator.isNumber('.soDienThoai')
				]
	}); 
	
	//edit staff form
	Validator({
		form : '#editStaffForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.ngaysinh'),
					Validator.isRequired('.email'),
					Validator.isRequired('.soDienThoai'),
					Validator.isEmail('.email'),
					Validator.isNumber('.soDienThoai')
				]
	}); 
	
	//change password form
	Validator({
		form : '#changePasswordForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.old-password'),
					Validator.isRequired('.new-password'),
					Validator.minLength('.new-password', 5),
					Validator.isRequired('.confirm-password'),
					Validator.isConfirmed('.confirm-password', function () {
						return document.querySelector('#changePasswordForm .new-password').value;
					}, 'Mật khẩu không khớp, vui lòng nhập lại!'),
				]
	}); 
	
	//edit profile form
	Validator({
		form : '#editProfileForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.hoten'),
					Validator.isRequired('.ngaysinh'),
					Validator.isRequired('.email'),
					Validator.isEmail('.email'),
				]
	}); 
	
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
	
	//edit account form
	Validator({
		form : '#editAccountForm',
		formGroupSelector : '.form-group',
		errorSelector : '.error-message',
		rules : [ 
					Validator.isRequired('.username'),
					Validator.isRequired('.password'),
					Validator.minLength('.password', 6)
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