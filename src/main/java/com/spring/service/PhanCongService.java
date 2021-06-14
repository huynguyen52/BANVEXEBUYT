package com.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.ChuyenXe;
import com.spring.entities.PhanCong;
import com.spring.repository.IPhanCongRepository;

import net.bytebuddy.asm.Advice.OffsetMapping.ForOrigin.Renderer.ForReturnTypeName;
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
	
	public List<Object> filter() {
		return repo.filter();
	}
	
	public List<Object> filter2() {
		return repo.filter2();
	}
	
	public List<ChuyenXe> filter3(){
		return repo.filter3();
	}
	
	public List<Object> filter4(){
		return repo.filter4();
	}
	
	public PhanCong getByDateAndXe(Date date, String bienSoXe) {
		return repo.getByDateAndXe(date, bienSoXe);
	}
	
}
