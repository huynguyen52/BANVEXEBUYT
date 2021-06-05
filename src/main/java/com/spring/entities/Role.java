package com.spring.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Role {

	@Id
	private String maRole;
	private String tenRole;
	public List<TaiKhoan> getLisTaiKhoans() {
		return lisTaiKhoans;
	}

	public void setLisTaiKhoans(List<TaiKhoan> lisTaiKhoans) {
		this.lisTaiKhoans = lisTaiKhoans;
	}

	// role - tai khoan
	@OneToMany(mappedBy = "role",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<TaiKhoan> lisTaiKhoans;
	public Role() {
	}

	public String getMaRole() {
		return maRole;
	}

	public void setMaRole(String maRole) {
		this.maRole = maRole;
	}

	public String getTenRole() {
		return tenRole;
	}

	public void setTenRole(String tenRole) {
		this.tenRole = tenRole;
	}
}
