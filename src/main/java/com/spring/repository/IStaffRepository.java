package com.spring.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.NhanVien;

public interface IStaffRepository extends CrudRepository<NhanVien, Integer> {
	
	//Vu
	@Query(value = "select nv.hoTen from NhanVien nv where nv.maNhanVien=:maNhanVien")
	public String getHoTen(@Param("maNhanVien") int maNhanVien);
}
