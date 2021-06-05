package com.spring.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class KhachThang {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maKhachThang;
	private String hoTen;
	private Date ngaySinh;
	private String note;
	// Khach Thang- Thong tin ve thang
	@OneToMany(mappedBy = "khachThang",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<ThongTinVeThang> lisThongTinVeThangs;
	
	
	public KhachThang() {
	}

	public int getMaKhachThang() {
		return maKhachThang;
	}

	public void setMaKhachHang(int maKhachThang) {
		this.maKhachThang = maKhachThang;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public KhachThang(String hoTen, Date ngaySinh, String note) {
		super();
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.note = note;
	}

	public KhachThang(int maKhachThang, String hoTen, Date ngaySinh, String note) {
		super();
		this.maKhachThang = maKhachThang;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.note = note;
	}
	
	

}
