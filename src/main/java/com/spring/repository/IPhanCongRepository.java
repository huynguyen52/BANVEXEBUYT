package com.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.spring.entities.PhanCong;

public interface IPhanCongRepository extends CrudRepository<PhanCong, Integer> {
}
