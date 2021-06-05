package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.Xe;
import com.spring.repository.IBusRepository;

@Service
public class BusService {
	@Autowired
	private IBusRepository repo;

	public List<Xe> listAll() {
		return (List<Xe>) repo.findAll();
	}

	public void delete(String id) {
		repo.delete(id);
	}

	public Xe get(String id) {
		return repo.findOne(id);
	}

	public void save(Xe xe) {
		repo.save(xe);
	}
}
