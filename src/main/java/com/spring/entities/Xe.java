package com.spring.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Xe {
	@Id
	private String bienSoXe;
	public String getBienSoxe() {
		return bienSoXe;
	}
	// Xe-PhanCong
	@JsonIgnore
	@OneToMany(mappedBy = "xe", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<PhanCong> listCTChuyens;
	
	public Xe() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Xe(String bienSoXe, boolean trangThai, List<PhanCong> listCTChuyens) {
		super();
		this.bienSoXe = bienSoXe;
		this.listCTChuyens = listCTChuyens;
	}
	public String getBienSoXe() {
		return bienSoXe;
	}
	public void setBienSoXe(String bienSoXe) {
		this.bienSoXe = bienSoXe;
	}
	public List<PhanCong> getListCTChuyens() {
		return listCTChuyens;
	}
	public void setListCTChuyens(List<PhanCong> listCTChuyens) {
		this.listCTChuyens = listCTChuyens;
	}
}
