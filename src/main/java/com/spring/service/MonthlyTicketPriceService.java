package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.GiaVeThang;
import com.spring.repository.IMonthlyTicketPriceRepository;

@Service
public class MonthlyTicketPriceService {
	@Autowired
	private IMonthlyTicketPriceRepository repo;

	public List<GiaVeThang> listAll() {
		return (List<GiaVeThang>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public GiaVeThang get(Integer id) {
		return repo.findOne(id);
	}

	public void save(GiaVeThang giaVeThang) {
		repo.save(giaVeThang);
	}
}
