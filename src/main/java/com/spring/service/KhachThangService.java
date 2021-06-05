package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.KhachThang;
import com.spring.repository.IKhachThangRepository;

@Service
public class KhachThangService {
	@Autowired
	private IKhachThangRepository repo;

	public List<KhachThang> listAll() {
		return (List<KhachThang>) repo.findAll();
	}

	public void delete(Integer id) {
		repo.delete(id);
	}

	public KhachThang get(Integer id) {
		return repo.findOne(id);
	}

	public void save(KhachThang khachThang) {
		repo.save(khachThang);
	}
}
