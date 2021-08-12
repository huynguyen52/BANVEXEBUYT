package com.spring.entities;

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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ThongTinVeThang {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maVeThang;
	private Integer maKhachThang;
	private Integer maTuyenXe;

	// thong tin ve thang- Khach Thang
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maKhachThang", insertable = false, updatable = false)
	private KhachThang khachThang;
	
	// thong tin ve thang -Tuyen Xe
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maTuyenXe", insertable = false, updatable = false)
	private TuyenXe tuyenXe;

	// thông tin vé tháng - thông tin vé tháng detail
	@JsonIgnore
	@OneToMany(mappedBy = "thongTinVeThang", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<ThongTinVeThangDetail> thongTinVeThangDetails;

	public Integer getMaKhachThang() {
		return maKhachThang;
	}

	public void setMaKhachThang(Integer maKhachThang) {
		this.maKhachThang = maKhachThang;
	}

	public Integer getMaTuyenXe() {
		return maTuyenXe;
	}

	public void setMaTuyenXe(Integer maTuyenXe) {
		this.maTuyenXe = maTuyenXe;
	}

	public KhachThang getKhachThang() {
		return khachThang;
	}

	public void setKhachThang(KhachThang khachThang) {
		this.khachThang = khachThang;
	}

	public TuyenXe getTuyenXe() {
		return tuyenXe;
	}

	public void setTuyenXe(TuyenXe tuyenXe) {
		this.tuyenXe = tuyenXe;
	}

	public ThongTinVeThang() {
	}

	public int getMaVeThang() {
		return maVeThang;
	}

	public void setMaVeThang(int maVeThang) {
		this.maVeThang = maVeThang;
	}

	public List<ThongTinVeThangDetail> getThongTinVeThangDetails() {
		return thongTinVeThangDetails;
	}

	public void setThongTinVeThangDetails(List<ThongTinVeThangDetail> thongTinVeThangDetails) {
		this.thongTinVeThangDetails = thongTinVeThangDetails;
	}

}
