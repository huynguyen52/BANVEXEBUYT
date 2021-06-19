package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.Role;
import com.spring.repository.IRoleRepository;

@Service
public class RoleService {
	@Autowired
	private IRoleRepository repo;

	public List<Role> listAll() {
		return (List<Role>) repo.findAll();
	}

	public void delete(String id) {
		repo.delete(id);
	}

	public Role get(String id) {
		return repo.findOne(id);
	}

	public void save(Role role) {
		repo.save(role);
	}
}
