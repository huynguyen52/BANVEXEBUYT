package com.spring.entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class GiaVeThang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maGia;
	private BigDecimal giaVeThang;
	private Date thoiGianApDung;
	private String maCheDo;

	// gia ve thang- Che do
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maCheDo", insertable = false, updatable = false)
	private CheDo cheDo;

//	 gia ve thang - Thong Tin ve Thang detail
	@JsonIgnore
	@OneToMany(mappedBy = "giaVeThang", fetch = FetchType.EAGER)
	private List<ThongTinVeThangDetail> lisThongTinVeThangDetails;

	public CheDo getCheDo() {
		return cheDo;
	}

	public void setCheDo(CheDo cheDo) {
		this.cheDo = cheDo;
	}

	public BigDecimal getGiaVeThang() {
		return giaVeThang;
	}

	public GiaVeThang(int maGia, BigDecimal giaVeThang, String maCheDo,Date thoiGianApDung) {
		super();
		this.maGia = maGia;
		this.giaVeThang = giaVeThang;
		this.thoiGianApDung = thoiGianApDung;
		this.maCheDo = maCheDo;
	}

	public GiaVeThang() {
	}

	public int getMaGia() {
		return maGia;
	}

	public void setMaGia(int maGia) {
		this.maGia = maGia;
	}

	public void setGiaVeThang(BigDecimal giaVeThang) {
		this.giaVeThang = giaVeThang;
	}

	public String getMaCheDo() {
		return maCheDo;
	}

	public void setMaCheDo(String maCheDo) {
		this.maCheDo = maCheDo;
	}

	public Date getThoiGianApDung() {
		return thoiGianApDung;
	}

	public void setThoiGianApDung(Date thoiGianApDung) {
		this.thoiGianApDung = thoiGianApDung;
	}

	public List<ThongTinVeThangDetail> getLisThongTinVeThangDetails() {
		return lisThongTinVeThangDetails;
	}

	public void setLisThongTinVeThangDetails(List<ThongTinVeThangDetail> lisThongTinVeThangDetails) {
		this.lisThongTinVeThangDetails = lisThongTinVeThangDetails;
	}

}
