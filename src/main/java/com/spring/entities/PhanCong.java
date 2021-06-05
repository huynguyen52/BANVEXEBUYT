package com.spring.entities;

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

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class PhanCong {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idPhanCong;
	private int maNhanVien;
	private String bienSoXe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngay;
	//phancong- nhanvien
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.ALL)
	@JoinColumn(name = "maNhanVien", insertable = false, updatable = false)
	private NhanVien nhanVien;

	// Phancong- xe
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.ALL)
	@JoinColumn(name = "bienSoXe", insertable = false, updatable = false)
	private Xe xe;

//	PhanCong-CTchuyen
	@JsonIgnore
	@OneToMany(mappedBy = "phanCong", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<CTChuyen> listCTChuyens;
	
	public PhanCong() {
		super();
		// TODO Auto-generated constructor stub
	}

	// PhanCong-thongtinveluot
	@JsonIgnore
	@OneToMany(mappedBy = "phanCong", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<ThongTinVeLuot> listThongTinVeLuots;


	public PhanCong(int idPhanCong, int maNhanVien, String bienSoXe, Date ngay, NhanVien nhanVien, Xe xe,
			List<CTChuyen> listCTChuyens, List<ThongTinVeLuot> listThongTinVeLuots) {
		super();
		this.idPhanCong = idPhanCong;
		this.maNhanVien = maNhanVien;
		this.bienSoXe = bienSoXe;
		this.ngay = ngay;
		this.nhanVien = nhanVien;
		this.xe = xe;
		this.listCTChuyens = listCTChuyens;
		this.listThongTinVeLuots = listThongTinVeLuots;
	}

	public int getIdPhanCong() {
		return idPhanCong;
	}

	public void setIdPhanCong(int idPhanCong) {
		this.idPhanCong = idPhanCong;
	}

	public List<CTChuyen> getListCTChuyens() {
		return listCTChuyens;
	}

	public void setListCTChuyens(List<CTChuyen> listCTChuyens) {
		this.listCTChuyens = listCTChuyens;
	}

	public int getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(int maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getBienSoXe() {
		return bienSoXe;
	}

	public void setBienSoXe(String bienSoXe) {
		this.bienSoXe = bienSoXe;
	}

	public Date getNgay() {
		return ngay;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public Xe getXe() {
		return xe;
	}

	public void setXe(Xe xe) {
		this.xe = xe;
	}

	public List<ThongTinVeLuot> getListThongTinVeLuots() {
		return listThongTinVeLuots;
	}

	public void setListThongTinVeLuots(List<ThongTinVeLuot> listThongTinVeLuots) {
		this.listThongTinVeLuots = listThongTinVeLuots;
	}

	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}

}
