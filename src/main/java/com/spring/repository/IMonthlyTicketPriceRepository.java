package com.spring.repository;

import java.math.BigDecimal;
import java.util.HashMap;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.GiaVeThang;

public interface IMonthlyTicketPriceRepository extends CrudRepository<GiaVeThang, Integer>{

	
	@Query(value="select t.maCheDo,t.giaVeThang from GiaVeThang t where t.maGia=:maGia")
	public HashMap<String, BigDecimal> hCheDo_GiaVe(@Param("maGia")int maGia);
	@Query(value="select t.maCheDo from GiaVeThang t where t.maGia=:maGia")
	public String getMaCheDo(@Param("maGia")int maGia);
	
	@Query(value="select t.giaVeThang from GiaVeThang t where t.maCheDo=:maCheDo")
	public BigDecimal getTien(@Param("maCheDo")String maCheDo);
}
