package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.ThongTinVeThang;
import com.spring.repository.IMonthlyInformationRepository;

@Service
public class MonthlyInformationService {
	@Autowired
	private IMonthlyInformationRepository repo;

	public List<ThongTinVeThang> listAll() {
		return (List<ThongTinVeThang>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public ThongTinVeThang get(Integer id) {
		return repo.findOne(id);
	}

	public void save(ThongTinVeThang thongTinVeThang) {
		repo.save(thongTinVeThang);
	}
	
	public Integer getHighestMaVeThang() {
		return repo.getHighestMaVeThang();
	}
	public Integer maVeThangToMaTuyen(Integer maTuyen) {
		return repo.veToMTuyen(maTuyen);
	}

	public List<ThongTinVeThang> checkDeleteKhachThang(int maKhachThang){
		return repo.checkDeleteKhachThang(maKhachThang);
	}
}
