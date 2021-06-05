package com.spring.repository;

import org.springframework.data.repository.CrudRepository;

import com.spring.entities.NhanVien;

public interface IStaffRepository extends CrudRepository<NhanVien, Integer> {

}
