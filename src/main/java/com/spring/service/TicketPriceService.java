package com.spring.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.GiaVeLuot;
import com.spring.entities.GiaVeThang;
import com.spring.repository.IMonthlyTicketPriceRepository;
import com.spring.repository.ITicketPriceRepository;

@Service
public class TicketPriceService {
	@Autowired
	private ITicketPriceRepository repo;

	public List<GiaVeLuot> listAll() {
		return (List<GiaVeLuot>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public GiaVeLuot get(Integer id) {
		return repo.findOne(id);
	}

	public void save(GiaVeLuot giaVeLuot) {
		repo.save(giaVeLuot);
	}

	public String getMaCheDo(int maGiaLuot) {
		return repo.getMaCheDo(maGiaLuot);
	}
	public BigDecimal getGiaVeLuot(int maGiaLuot) {
		return repo.getGiaVeLuot(maGiaLuot);

	
	public GiaVeLuot getByMaCheDo(String loai) {
		return repo.getByMaCheDo(loai);

	}
}
