package com.spring.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ThongTinVeThang;

public interface IMonthlyInformationRepository extends CrudRepository<ThongTinVeThang, Integer>{
	
	@Query(value = "select MAX(maVeThang) from ThongTinVeThang")
	public Integer getHighestMaVeThang();
	@Query(value="select t.maTuyenXe from ThongTinVeThang t where t.maVeThang=:maVe")
	public Integer veToMTuyen(@Param("maVe")Integer maVeThang);
}
