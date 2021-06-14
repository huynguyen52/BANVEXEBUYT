package com.spring.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.GiaVeLuot;

public interface ITicketPriceRepository extends CrudRepository<GiaVeLuot, Integer>{
	
	@Query(value = "from GiaVeLuot where maCheDo = :loai")
	public GiaVeLuot getByMaCheDo(@Param("loai") String loai);
}
