package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.PhanCong;

public interface IPhanCongRepository extends CrudRepository<PhanCong, Integer> {
	// list ma nhan vien lam trong ngay hom do tuyen do
	@Query(value = "select p.maNhanVien from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong= ct.idPhanCong and ct.id = ct.idChuyen and c.maTuyen = :tuyen and p.ngay = :ngay")
	public List<Integer> getListStaff(@Param("tuyen") int maTuyen,@Param("ngay") Date date);
	
	@Query(value="select distinct p.ngay from PhanCong p where p.ngay>=:dateFrom and p.ngay <=:dateTo")
	public List<Date> getListDays(@Param("dateFrom") Date dateFrom,@Param("dateTo") Date dateTo);
	
	@Query(value="select p.idPhanCong from PhanCong p where p.ngay=:currentDay")
	public List<Integer> getListMaPhanCong(@Param("currentDay") Date currentDay);
}
