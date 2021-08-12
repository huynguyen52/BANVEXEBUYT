package com.spring.java;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Entity;

import org.springframework.format.annotation.DateTimeFormat;

public class LichPhanCong {
	private String bienSoXe;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngay;
	private Integer maTuyen;
	private LocalTime gioXuatPhat;
	private LocalTime gioKetThuc;
	
	
	
	public LichPhanCong() {
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
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	public Integer getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(Integer maTuyen) {
		this.maTuyen = maTuyen;
	}
	public LocalTime getGioXuatPhat() {
		return gioXuatPhat;
	}
	public void setGioXuatPhat(LocalTime gioXuatPhat) {
		this.gioXuatPhat = gioXuatPhat;
	}
	public LocalTime getGioKetThuc() {
		return gioKetThuc;
	}
	public void setGioKetThuc(LocalTime gioKetThuc) {
		this.gioKetThuc = gioKetThuc;
	}
	public LichPhanCong(String bienSoXe, Date ngay, Integer maTuyen, LocalTime gioXuatPhat, LocalTime gioKetThuc) {
		super();
		this.bienSoXe = bienSoXe;
		this.ngay = ngay;
		this.maTuyen = maTuyen;
		this.gioXuatPhat = gioXuatPhat;
		this.gioKetThuc = gioKetThuc;
	}
	
}
