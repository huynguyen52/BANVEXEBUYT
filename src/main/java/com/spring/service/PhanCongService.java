package com.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.spring.entities.PhanCong;
import com.spring.repository.IPhanCongRepository;
@Service
public class PhanCongService {
	@Autowired
	private IPhanCongRepository repo;

	public List<PhanCong> listAll() {
		return (List<PhanCong>) repo.findAll();
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public PhanCong get(int id) {
		return repo.findOne(id);
	}

	public void save(PhanCong phanCong) {
		repo.save(phanCong);
	}
	public List<Integer> getListNhanVien(int maTuyen,Date date){
		return repo.getListStaff(maTuyen, date);
	}
	public List<Date> getListDays(Date dateFrom,Date dateTo){
		return repo.getListDays(dateFrom, dateTo);
	}
	public List<Integer> getListMaPhanCong(Date currentDay){
		return repo.getListMaPhanCong(currentDay);
	}
	
}
