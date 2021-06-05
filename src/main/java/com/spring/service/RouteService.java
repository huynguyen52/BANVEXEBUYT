package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.TuyenXe;
import com.spring.repository.IRouteRepository;

@Service
public class RouteService {

	@Autowired
	private IRouteRepository repo;

	public List<TuyenXe> listAll() {
		return (List<TuyenXe>) repo.findAll();
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public TuyenXe get(int id) {
		return repo.findOne(id);
	}

	public void save(TuyenXe tuyenXe) {
		repo.save(tuyenXe);
	}
}
