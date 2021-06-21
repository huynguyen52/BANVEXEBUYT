package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.TaiKhoan;

public interface IAccountRepository extends CrudRepository<TaiKhoan, Integer>{

	@Query(value = "select tk from TaiKhoan tk where tk.username = :username")
	public TaiKhoan findByUsername(@Param("username") String username); 
	
	@Query(value = "from TaiKhoan where maNhanVien = :maNhanVien")
	public List<TaiKhoan> checkDeleteNhanVien(@Param("maNhanVien") int maNhanVien);
	@Query(value = "select tk from TaiKhoan tk where tk.maTaiKhoan = :maTaiKhoan")
	public TaiKhoan getTaiKhoan(@Param("maTaiKhoan") int maTaiKhoan);
}
