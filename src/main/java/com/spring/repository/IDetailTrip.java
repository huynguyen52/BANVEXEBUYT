package com.spring.repository;

import java.io.Serializable;

import org.springframework.data.repository.CrudRepository;

import com.spring.entities.CTChuyen;

public interface IDetailTrip extends CrudRepository<CTChuyen, Serializable>{

}
