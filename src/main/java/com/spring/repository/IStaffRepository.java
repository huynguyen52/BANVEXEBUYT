package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.NhanVien;

public interface IStaffRepository extends CrudRepository<NhanVien, Integer> {
	
	//Vu
	@Query(value = "select nv.hoTen from NhanVien nv where nv.maNhanVien=:maNhanVien")
	public String getHoTen(@Param("maNhanVien") int maNhanVien);
	@Query(value = "select nv from NhanVien nv ,TaiKhoan tk where nv.maNhanVien=tk.maNhanVien and tk.maRole='staff'")
	public List<NhanVien> getListNhanVienbyRole();
}
