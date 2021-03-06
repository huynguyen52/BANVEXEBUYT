package com.spring.service;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.ChuyenXe;
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
	
	public List<ChuyenXe> getDataByMaTuyen(int maTuyen){
		return repo.getDataByMatuyen(maTuyen);
		
	}
	public List<Integer> listTuyenXes(Date fromDate,Date toDate){
		return repo.listMaTuyen(fromDate, toDate);
	}
	public Integer getMaTuyens(Integer idChuyen) {
		return repo.getMaTuyens(idChuyen);
	}
	public List<ChuyenXe> checkDeleteTuyenXe(int maTuyen){
		return repo.checkDeleteTuyenXe(maTuyen);
	}
}
