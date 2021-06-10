package com.spring.java;

import java.math.BigDecimal;
import java.util.Date;

public class QLVe {

	public int getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(int maTuyen) {
		this.maTuyen = maTuyen;
	}
	public int getSoLuongThuong() {
		return soLuongThuong;
	}
	public void setSoLuongThuong(int soLuongThuong) {
		this.soLuongThuong = soLuongThuong;
	}
	public String getCheDoThuong() {
		return cheDoThuong;
	}
	public void setCheDoThuong(String cheDoThuong) {
		this.cheDoThuong = cheDoThuong;
	}
	public int getSoLuongUuTien() {
		return soLuongUuTien;
	}
	public void setSoLuongUuTien(int soLuongUuTien) {
		this.soLuongUuTien = soLuongUuTien;
	}
	public String getCheDoUuTien() {
		return cheDoUuTien;
	}
	public void setCheDoUuTien(String cheDoUuTien) {
		this.cheDoUuTien = cheDoUuTien;
	}
	public BigDecimal getGiaTienThuong() {
		return giaTienThuong;
	}
	public void setGiaTienThuong(BigDecimal giaTienThuong) {
		this.giaTienThuong = giaTienThuong;
	}
	public BigDecimal getGiaTienUuTien() {
		return giaTienUuTien;
	}
	public void setGiaTienUuTien(BigDecimal giaTienUuTien) {
		this.giaTienUuTien = giaTienUuTien;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	private int maTuyen;
	private int soLuongThuong;
	private String cheDoThuong="thuong";
	private int soLuongUuTien;
	private String cheDoUuTien="uutien";
	private BigDecimal giaTienThuong;
	private BigDecimal giaTienUuTien;
	private Date ngay;
	public QLVe() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
