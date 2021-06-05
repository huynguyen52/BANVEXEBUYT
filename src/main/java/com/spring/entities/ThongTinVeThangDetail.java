package com.spring.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class ThongTinVeThangDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngayMua;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngayHetHan;
	private Integer maGiaThang;
	private Integer maVeThang;
	private Integer addNewBy;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addNewDate;

//	Thong tin ve thang - Thong tin ve thang_detail
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maVeThang", insertable = false, updatable = false)
	private ThongTinVeThang thongTinVeThang;

//	Gia ve thang - Thong tin ve thang_detail
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maGiaThang", insertable = false, updatable = false)
	private GiaVeThang giaVeThang;

//	tai khoan - Thong tin ve thang_detail
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "addNewBy", insertable = false, updatable = false)
	private TaiKhoan taiKhoan;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getNgayMua() {
		return ngayMua;
	}

	public void setNgayMua(Date ngayMua) {
		this.ngayMua = ngayMua;
	}

	public Date getNgayHetHan() {
		return ngayHetHan;
	}

	public void setNgayHetHan(Date ngayHetHan) {
		this.ngayHetHan = ngayHetHan;
	}

	public Integer getMaGiaThang() {
		return maGiaThang;
	}

	public void setMaGiaThang(Integer maGiaThang) {
		this.maGiaThang = maGiaThang;
	}

	public Integer getMaVeThang() {
		return maVeThang;
	}

	public void setMaVeThang(Integer maVeThang) {
		this.maVeThang = maVeThang;
	}

	public ThongTinVeThangDetail() {
		// TODO Auto-generated constructor stub
	}

	public ThongTinVeThang getThongTinVeThang() {
		return thongTinVeThang;
	}

	public void setThongTinVeThang(ThongTinVeThang thongTinVeThang) {
		this.thongTinVeThang = thongTinVeThang;
	}

	public GiaVeThang getGiaVeThang() {
		return giaVeThang;
	}

	public void setGiaVeThang(GiaVeThang giaVeThang) {
		this.giaVeThang = giaVeThang;
	}

	public Integer getAddNewBy() {
		return addNewBy;
	}

	public void setAddNewBy(Integer addNewBy) {
		this.addNewBy = addNewBy;
	}

	public Date getAddNewDate() {
		return addNewDate;
	}

	public void setAddNewDate(Date addNewDate) {
		this.addNewDate = addNewDate;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

}
