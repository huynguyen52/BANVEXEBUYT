package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.ThongTinVeLuot;
import com.spring.repository.ITicketInformationRepository;

@Service
public class TicketInformationService {
	@Autowired
	private ITicketInformationRepository repo;

	public List<ThongTinVeLuot> listAll() {
		return (List<ThongTinVeLuot>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public ThongTinVeLuot get(Integer id) {
		return repo.findOne(id);
	}

	public void save(ThongTinVeLuot thongTinVeLuot) {
		repo.save(thongTinVeLuot);
	}

	public List<ThongTinVeLuot> getDataByMaPhanCong(int maPhanCong) {
		return repo.getDataByMaPhanCong(maPhanCong);
	}
	
	public ThongTinVeLuot getByMaPhanCongAndMaGiaLuot(int maPhanCong, int maGiaLuot) {
		return repo.getByMaPhanCongAndMaGiaLuot(maPhanCong, maGiaLuot);
	}

	public List<Integer> listMaGiaLuot(int idPhanCong){
		return repo.listMaGiaLuot(idPhanCong);
	}
	public Integer getSoLuong(int idPhanCong, int maGiaLuot) {
		return repo.getSoLuong(idPhanCong, maGiaLuot);
	}
	

}
