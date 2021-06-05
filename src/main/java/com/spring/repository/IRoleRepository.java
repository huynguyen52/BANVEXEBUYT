package com.spring.repository;

import org.springframework.data.repository.CrudRepository;

import com.spring.entities.Role;

public interface IRoleRepository  extends CrudRepository<Role, String>{

}
