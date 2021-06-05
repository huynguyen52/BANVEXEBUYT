package com.spring.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class CheDo {

	@Id
	private String maCheDo;
	private String tenCheDo;
	// che do -gia ve luot
	@OneToMany(mappedBy = "cheDo",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<GiaVeLuot> giaVeLuots;
	
	// che do -gia ve thang
	@OneToMany(mappedBy = "cheDo",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<GiaVeThang> giaVeThangs;
	public List<GiaVeLuot> getGiaVeLuots() {
		return giaVeLuots;
	}

	public void setGiaVeLuots(List<GiaVeLuot> giaVeLuots) {
		this.giaVeLuots = giaVeLuots;
	}

	public List<GiaVeThang> getGiaVeThangs() {
		return giaVeThangs;
	}

	public void setGiaVeThangs(List<GiaVeThang> giaVeThangs) {
		this.giaVeThangs = giaVeThangs;
	}

	public CheDo() {
	}

	public String getMaCheDo() {
		return maCheDo;
	}

	public void setMaCheDo(String maCheDo) {
		this.maCheDo = maCheDo;
	}

	public String getTenCheDo() {
		return tenCheDo;
	}

	public void setTenCheDo(String tenCheDo) {
		this.tenCheDo = tenCheDo;
	}

}
