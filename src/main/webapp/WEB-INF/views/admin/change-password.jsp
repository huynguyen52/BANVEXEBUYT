<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thay đổi mật khẩu</title>
</head>
<body>
	<form action="change-password" method="post">
		<div>
		<label >Mật khẩu hiện tại: </label>
			<input type="password" name="passCur" id="passCur"
				placeholder="Mật khẩu hiện tại"> <br><br>
				<label >Mật khẩu mới: </label>
			<input type="password"
				name="passNew" id="passNew" placeholder="Mật khẩu mới"> <br><br>
				<label >Xác nhận mật khẩu mới: </label>
			<input type="password"
				name="passRep" id="passRep" placeholder="Xác nhận mật khẩu mới"> <br><br>
				<span
				class="error-message"> <span class="error-message"></span>
		</div>
		<button type="submit" formaction="./profile" >Xác nhận</button>
		<button type="submit" >Hủy</button>
	</form>
</body>
</html>