package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.TaiKhoan;
import com.spring.repository.IAccountRepository;

@Service
public class AccountService {
	@Autowired
	private IAccountRepository repo;

	public List<TaiKhoan> listAll() {
		System.out.println("hi");
		return (List<TaiKhoan>) repo.findAll();
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public TaiKhoan get(int id) {
		return repo.findOne(id);
	}

	public void save(TaiKhoan taiKhoan) {
		repo.save(taiKhoan);
	}
	
	public List<TaiKhoan> checkDeleteNhanVien(int maNhanVien){
		return repo.checkDeleteNhanVien(maNhanVien);
	}
	public TaiKhoan getTaiKhoan(int id) {
		return repo.getTaiKhoan(id);
	}
}
