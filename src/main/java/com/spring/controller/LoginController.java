package com.spring.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.entities.NhanVien;
import com.spring.entities.TaiKhoan;
import com.spring.service.AccountService;
import com.spring.service.StaffService;

@Controller
public class LoginController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private StaffService staffService;

	// Login GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGetPage() {
		
		return "admin/login";
	}
	public static String getMd5(String input) 
    { 
        try { 
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5"); 
  
            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes()); 
  
            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest); 
  
            // Convert message digest into hex value 
            String hashtext = no.toString(16); 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            return hashtext; 
        }  
        // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    }
	// Login POST
	// Login POST
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginPostPage(@RequestParam("username") String username, @RequestParam("password") String password,
				HttpServletRequest request, RedirectAttributes redirectAttributes) {
			List<TaiKhoan> listTK = accountService.listAll();
			HttpSession sessionHttp = request.getSession();
			for (int i = 0; i < listTK.size(); i++) {
				if (username.equals(listTK.get(i).getUsername()) && getMd5(password).equals(listTK.get(i).getPassword())) {
					sessionHttp.setAttribute("taiKhoan", listTK.get(i));
					return "redirect:/admin/dashboard";
				}
			}
			redirectAttributes.addFlashAttribute("message", "Sai username ho???c password!");
			return "redirect:/login";
		}

	public boolean checkMail(String mail) {
		List<TaiKhoan> listTK = accountService.listAll();
		for (int i = 0; i < listTK.size(); i++) {
			NhanVien nhanVien = staffService.get(listTK.get(i).getMaNhanVien());
			System.out.println(nhanVien.getEmail());
			if (nhanVien.getEmail().equals(mail)) {
				return true;
			}
		}
		return false;
	}

	public String returnPass(String mail) {
		if (checkMail(mail)) {
			List<TaiKhoan> listTK = accountService.listAll();
			for (int i = 0; i < listTK.size(); i++) {
				NhanVien nhanVien = staffService.get(listTK.get(i).getMaNhanVien());
				if (nhanVien.getEmail().equals(mail)) {
					return listTK.get(i).getPassword();
				}
			}
		}
		return "";
	}
	
	//random password
	public String randomPass() {

	    String alphabet = "123456789!@#$%^&*ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	
	    StringBuilder sb = new StringBuilder();
	
	    Random random = new Random();
	
	    int length = 7;
	    for(int i = 0; i < length; i++) {
	
	      int index = random.nextInt(alphabet.length());

	      char randomChar = alphabet.charAt(index);

	      sb.append(randomChar);
	    }
	    String randomString = sb.toString();
	    return randomString;
	}
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String sendMail(@RequestParam("email") String email, RedirectAttributes redirectAttributes) {
		String random = randomPass();
		List<TaiKhoan> listTaiKhoans = accountService.listAll();
		List<NhanVien> listNhanViens = staffService.listAll();
		for(int i=0;i<listNhanViens.size();i++) {
			if(email.equals(listNhanViens.get(i).getEmail())) {
				for(int j=0;j<listTaiKhoans.size();j++) {
					if(listNhanViens.get(i).getMaNhanVien()==listTaiKhoans.get(j).getMaNhanVien()) {
						listTaiKhoans.get(j).setPassword(getMd5(random));
						accountService.save(listTaiKhoans.get(j));
						
					}
				}
			}
		}
		if (checkMail(email)) {
			try {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setSubject("C???P L???I M???T KH???U");
				message.setTo(email);
				//message.setText("M???t Kh???u l??: " + returnPass(email));
				message.setText("M???t Kh???u m???i c???a b???n l??: " + random);
				mailSender.send(message);
				redirectAttributes.addFlashAttribute("message", "success");
				System.out.println("Mail success");
			} catch (Exception ex) {
				
				redirectAttributes.addFlashAttribute("message", "error");
				System.out.println("Mail fail");
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "error");
			System.out.println("Mail kh ton tai");
		}

		return "redirect:/forgot-password.html";
	}

	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String sendMail(RedirectAttributes redirectAttributes) {

		return "admin/forgot-password";
	}

}