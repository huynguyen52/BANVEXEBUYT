package com.spring.entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class GiaVeLuot {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maGia;
	private String maCheDo;
	private BigDecimal giaVeLuot;
	@Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
	private Date thoiGianApDung;
	
	public CheDo getCheDo() {
		return cheDo;
	}

	public void setCheDo(CheDo cheDo) {
		this.cheDo = cheDo;
	}

	
	// gia ve luot- thong tin ve luot
	@JsonIgnore
	@OneToMany(mappedBy = "giaVeLuot", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<ThongTinVeLuot> thongTinVeLuots;
	//gia ve luot- Che do
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.PERSIST)
	@JoinColumn(name="maCheDo",insertable = false,updatable = false)
	private CheDo cheDo;
	
	public List<ThongTinVeLuot> getThongTinVeLuots() {
		return thongTinVeLuots;
	}

	public void setThongTinVeLuots(List<ThongTinVeLuot> thongTinVeLuots) {
		this.thongTinVeLuots = thongTinVeLuots;
	}

	public GiaVeLuot() {
	}

	public int getMaGia() {
		return maGia;
	}

	public void setMaGia(int maGia) {
		this.maGia = maGia;
	}


	public BigDecimal getGiaVeLuot() {
		return giaVeLuot;
	}

	public void setGiaVeLuot(BigDecimal giaVeLuot) {
		this.giaVeLuot = giaVeLuot;
	}



	public Date getThoiGianApDung() {
		return thoiGianApDung;
	}

	public void setThoiGianApDung(Date thoiGianApDung) {
		this.thoiGianApDung = thoiGianApDung;
	}

	public String getMaCheDo() {
		return maCheDo;
	}

	public void setMaCheDo(String maCheDo) {
		this.maCheDo = maCheDo;
	}

	public GiaVeLuot(int maGia, String maCheDo, BigDecimal giaVeLuot, Date thoiGianApDung) {
		super();
		this.maGia = maGia;
		this.maCheDo = maCheDo;
		this.giaVeLuot = giaVeLuot;
		this.thoiGianApDung = thoiGianApDung;
	}

	

	

}
