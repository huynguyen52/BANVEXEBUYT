package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.CheDo;
import com.spring.repository.IModeRepository;
@Service
public class ModeService {
	@Autowired
	private IModeRepository repo;

	public List<CheDo> listAll() {
		return (List<CheDo>) repo.findAll();
	}

	public void delete(String id) {
		repo.delete(id);
	}

	public CheDo get(String id) {
		return repo.findOne(id);
	}

	public void save(CheDo cheDo) {
		repo.save(cheDo);
	}
}
