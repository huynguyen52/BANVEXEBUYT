package com.spring.repository;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ChuyenXe;

public interface ITripRepository extends CrudRepository<ChuyenXe, Integer>{
	
	@Query(value = "update ChuyenXe set chuyen = :chuyen, maTuyen = :maTuyen, gioXuatPhat = ':gioXuatPhat', gioQuayVe = ':gioQuayVe', bienSoXe = ':bienSoXe', maNhanVien = :maNhanVien where id = :id")
	public void updateById(@Param("id") Integer id,
			@Param("chuyen") Integer chuyen,
			@Param("maTuyen") Integer maTuyen,
			@Param("gioXuatPhat") LocalDate gioXuatPhat,
			@Param("gioQuayVe") LocalDate gioQuayVe,
			@Param("bienSoXe") String bienSoXe,
			@Param("maNhanVien") Integer maNhanVien);
	
}
