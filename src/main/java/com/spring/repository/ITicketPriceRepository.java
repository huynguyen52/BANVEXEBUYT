package com.spring.repository;


import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.GiaVeLuot;

public interface ITicketPriceRepository extends CrudRepository<GiaVeLuot, Integer>{


	@Query(value="select t.maCheDo from GiaVeLuot t where t.maGia=:maGiaLuot")
	public String getMaCheDo(@Param("maGiaLuot") int maGiaLuot );
	@Query(value="select t.giaVeLuot from GiaVeLuot t where t.maGia=:maGiaLuot")
	public BigDecimal getGiaVeLuot(@Param("maGiaLuot") int maGiaLuot );

	@Query(value = "from GiaVeLuot where maCheDo = :loai")
	public GiaVeLuot getByMaCheDo(@Param("loai") String loai);
}
