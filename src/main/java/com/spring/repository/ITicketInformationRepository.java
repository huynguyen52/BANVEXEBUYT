package com.spring.repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ThongTinVeLuot;

public interface ITicketInformationRepository extends CrudRepository<ThongTinVeLuot, Integer> {

//	@Query(value = "select t from ThongTinVeLuot as t where t.ngay between :datestart and :dateend")
//	public List<ThongTinVeLuot> getDataByDateToDate(@Param("datestart") Date dateStart, @Param("dateend") Date dateEnd);
//	
//	@Query(value = "select tt from ThongTinVeLuot as tt where tt.ngay = :date")
//	public List<ThongTinVeLuot> getDataByDate(@Param("date") Date date);

	@Query(value = "select t from ThongTinVeLuot t where maPhanCong = :ma")
	public List<ThongTinVeLuot> getDataByMaPhanCong(@Param("ma") int maPhanCong);
	
	@Query(value="select t.maGiaLuot from ThongTinVeLuot t where t.maPhanCong=:idPhanCong")

	public List<Integer> listMaGiaLuot(@Param("idPhanCong") int idPhanCong);
	
	@Query(value="select soLuong from ThongTinVeLuot t where t.maPhanCong=:idPhanCong and maGiaLuot=:maGiaLuot")
	public Integer getSoLuong(@Param("idPhanCong") int idPhanCong,@Param("maGiaLuot") int maGiaLuot);
}
