package com.spring.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.spring.entities.ChuyenXe;
import com.spring.entities.TuyenXe;
import com.spring.repository.ITripRepository;

@Service
public class TripService {

	@Autowired
	private ITripRepository repo;

	public List<ChuyenXe> listAll() {
		return (List<ChuyenXe>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public ChuyenXe get(Integer id) {
		return repo.findOne(id);
	}

	public void save(ChuyenXe chuyenXe) {
		repo.save(chuyenXe);
	}
	
	public void updateById(Integer id,Integer chuyen,Integer maTuyen,LocalTime gioXuatPhat,LocalTime gioQuayVe,
			String bienSoXe,
			Integer maNhanVien) {
		updateById(id, chuyen, maTuyen, gioXuatPhat, gioQuayVe, bienSoXe, maNhanVien);
	}
	
	public List<ChuyenXe> getDataByMaTuyen(Integer maTuyen){
		
		return repo.getDataByMatuyen(maTuyen);
	}
	
}
