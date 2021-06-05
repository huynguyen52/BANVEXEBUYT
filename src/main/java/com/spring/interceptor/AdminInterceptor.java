package com.spring.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.entities.TaiKhoan;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {
		HttpSession session = request.getSession();
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoan");

		if (taiKhoan.getRole().getMaRole().equals("admin")) {
			return true;
		} else if(taiKhoan.getRole().getMaRole().equals("staff")){
			response.sendRedirect((String) request.getSession().getAttribute("current-url") + "?message=no-permission");
			return false;
		}
		return false;

	}
}
