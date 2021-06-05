package com.spring.repository;

import org.springframework.data.repository.CrudRepository;

import com.spring.entities.Xe;

public interface IBusRepository extends CrudRepository<Xe, String> {

}
