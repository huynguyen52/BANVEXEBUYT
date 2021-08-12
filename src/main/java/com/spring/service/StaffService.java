package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.NhanVien;
import com.spring.repository.IStaffRepository;

@Service
public class StaffService {
	@Autowired
	private IStaffRepository repo;

	public List<NhanVien> listAll() {
		return (List<NhanVien>) repo.findAll();
	}
	public List<NhanVien> getListNhanVienbyRole() {
		return (List<NhanVien>) repo.getListNhanVienbyRole();
	}
	public void delete(Integer id) {
		repo.delete(id);
	}

	public NhanVien get(Integer id) {
		return repo.findOne(id);
	}

	public void save(NhanVien nhanVien) {
		repo.save(nhanVien);
	}

	// Vu
	public String getHoTen(int maNhanVien) {
		return repo.getHoTen(maNhanVien);
	}

}
