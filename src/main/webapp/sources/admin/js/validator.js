


function Validator(options){

	function getParent(element, selector){
		while(element.parentElement){
			if(element.parentElement.matches(selector)){
				return element.parentElement;
			}
			element = element.parentElement;
		}
	}

	//lưu lại các rule
	var selectorRules = {};

	//hàm thực hiện validate
	function validate(inputElement, rule){
		var errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);
		var errorMessage;

		//lấy ra các rule của selector
		var rules = selectorRules[rule.selector];

		//lặp qua từng rule và test
		//Nếu có lỗi thì break 
		for(var i = 0; i < rules.length; i++){
			errorMessage = rules[i](inputElement.value);
			if(errorMessage) break;
		}

		if (errorMessage) {
			errorElement.innerText = errorMessage;
			getParent(inputElement, options.formGroupSelector).classList.add('invalid');
		}else{
			errorElement.innerText = '';
			getParent(inputElement, options.formGroupSelector).classList.remove('invalid');
		}

		return !errorMessage;
	}

	//lấy element của form cần validate
	var formElement = document.querySelector(options.form);

	if(formElement){
		//khi submit form
		formElement.onsubmit = function(e){
			e.preventDefault();

			var isFormValid = true;

			//lặp qua từng rule và validate
			options.rules.forEach(function(rule){
				var inputElement = formElement.querySelector(rule.selector);
				var isValid = validate(inputElement, rule);
				if(!isValid){
					isFormValid = false;
				}
			});



			if(isFormValid){

				//submit với javascript
				if(typeof options.onSubmit === 'function'){

					var enableInputs = formElement.querySelectorAll('[name]:not([disabled])');
			
					//convert NodeList -> Array
					var formValues = Array.from(enableInputs).reduce(function(values, input){
						values[input.name] = input.value;
						return values;
					}, {});

					options.onSubmit({
						formValues
					});
				}else{ //submit mặc định
					formElement.submit();
				}
			}
		}

		//lặp qua mỗi rule và xử lý 
		options.rules.forEach(function(rule){

			//lưu lại các rule cho mỗi input
			if(Array.isArray(selectorRules[rule.selector])){
				selectorRules[rule.selector].push(rule.test);
			}else{
				selectorRules[rule.selector] = [rule.test];
			}
			
			var inputElement = formElement.querySelector(rule.selector);

			if(inputElement){

				//xử lý khi blur khỏi input
				inputElement.onblur = function(){
					validate(inputElement, rule);
				}

				//xử lý khi nhập input
				inputElement.oninput = function(){
					var errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);
					errorElement.innerText = '';
					getParent(inputElement, options.formGroupSelector).classList.remove('invalid');
				}
			}
		});
	}
}

Validator.isRequired = function(selector, message){
	return {
		selector : selector,
		test: function(value){
			return value.trim() ? undefined : message || 'Trường này là bắt buộc';
		}
	}
}

Validator.isEmail = function(selector, message){
	return {
		selector : selector,
		test: function(value){
			let regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			return regex.test(value) ? undefined : message || 'Trường này phải là email';
		}
	}
}

Validator.minLength = function(selector, min){
	return {
		selector : selector,
		test: function(value){
			return value.length >= min ? undefined : `Vui lòng nhập tối thiểu ${min} ký tự`;
		}
	}
}

Validator.isConfirmed = function(selector, confirmValue, message){
	return {
		selector : selector,
		test: function(value){
			return value === confirmValue() ? undefined : message || 'Giá trị nhập vào không chính xác!';
		}
	}
}

Validator.isNumber = function(selector, message){
	return {
		selector : selector,
		test: function(value){
			let regex = /^[0-9]*$/;
			return regex.test(value) ? undefined : message || 'Giá trị không hợp lệ';
		}
	}
}

Validator.isSpecialChar = function(selector, message){
	return {
		selector : selector,
		test: function(value){
			let regex = /[^A-Za-z0-9]/;
			return regex.test(value) ? 'Giá trị không hợp lệ' : message || undefined;
		}
	}
}