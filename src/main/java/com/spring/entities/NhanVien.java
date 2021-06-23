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
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class NhanVien {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maNhanVien;
	private String hoTen;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date namSinh;
	private String soDienThoai;
	private String email;
	private String diaChi;

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	// nhan vien- PhanCong
	@JsonIgnore
	@OneToMany(mappedBy = "nhanVien", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<PhanCong> listCTChuyens;

	public void setEmail(String email) {
		this.email = email;
	}

	private boolean gioiTinh;

	public NhanVien() {
	}

	public int getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(int maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public List<PhanCong> getListCTChuyens() {
		return listCTChuyens;
	}

	public void setListCTChuyens(List<PhanCong> listCTChuyens) {
		this.listCTChuyens = listCTChuyens;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNamSinh() {
		return namSinh;
	}

	public void setNamSinh(Date namSinh) {
		this.namSinh = namSinh;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public boolean isGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public NhanVien(int maNhanVien, String hoTen, Date namSinh, String soDienThoai, String email,
			List<PhanCong> listCTChuyens, boolean gioiTinh) {
		super();
		this.maNhanVien = maNhanVien;
		this.hoTen = hoTen;
		this.namSinh = namSinh;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.listCTChuyens = listCTChuyens;
		this.gioiTinh = gioiTinh;
	}

}
