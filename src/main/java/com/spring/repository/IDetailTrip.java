package com.spring.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.CTChuyen;

public interface IDetailTrip extends CrudRepository<CTChuyen, Serializable> {
	@Query(value = "select c.idChuyen from CTChuyen c where c.idPhanCong=:idPhanCong")
	public List<Integer> getListChuyens(@Param("idPhanCong") int idPhanCong);

	//Vu
	@Query(value = "from CTChuyen where idChuyen=:idChuyen and idPhanCong=:idPhanCong")
	public CTChuyen getByIDChuyenIDPhanCong(@Param("idChuyen") int idChuyen, @Param("idPhanCong") int idPhanCong);

}
