package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.CTChuyen;
import com.spring.repository.IDetailTrip;

@Service
public class DetailTripService {
	@Autowired
	private IDetailTrip repo;

	public List<CTChuyen> listAll() {
		return (List<CTChuyen>) repo.findAll();
	}

	public void delete(String id) {
		repo.delete(id);
	}

	public CTChuyen get(String id) {
		return repo.findOne(id);
	}

	public void save(CTChuyen ctChuyen) {
		repo.save(ctChuyen);
	}
}
