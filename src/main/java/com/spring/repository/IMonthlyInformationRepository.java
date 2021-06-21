package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ThongTinVeThang;

public interface IMonthlyInformationRepository extends CrudRepository<ThongTinVeThang, Integer>{
	
	@Query(value = "select MAX(maVeThang) from ThongTinVeThang")
	public Integer getHighestMaVeThang();
	@Query(value="select t.maTuyenXe from ThongTinVeThang t where t.maVeThang=:maVe")
	public Integer veToMTuyen(@Param("maVe")Integer maVeThang);
	
	@Query(value = "from ThongTinVeThang ttvt where maKhachThang = :maKhachThang")
	public List<ThongTinVeThang> checkDeleteKhachThang(@Param("maKhachThang") int maKhachThang);
}
