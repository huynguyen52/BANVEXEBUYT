package com.spring.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.spring.entities.ThongTinVeThang;

public interface IMonthlyInformationRepository extends CrudRepository<ThongTinVeThang, Integer>{
	
	@Query(value = "select MAX(maVeThang) from ThongTinVeThang")
	public Integer getHighestMaVeThang();
}
