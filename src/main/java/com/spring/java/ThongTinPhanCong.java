package com.spring.java;

import java.util.List;

import com.spring.entities.ChuyenXe;

public class ThongTinPhanCong {
	private String hoTen;
	private String bienSoXe;
	private List<ChuyenXe> listChuyenXes;

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getBienSoXe() {
		return bienSoXe;
	}

	public void setBienSoXe(String bienSoXe) {
		this.bienSoXe = bienSoXe;
	}

	public List<ChuyenXe> getListChuyenXes() {
		return listChuyenXes;
	}

	public void setListChuyenXes(List<ChuyenXe> listChuyenXes) {
		this.listChuyenXes = listChuyenXes;
	}

	public ThongTinPhanCong(String hoTen, String bienSoXe, List<ChuyenXe> listChuyenXes) {
		super();
		this.hoTen = hoTen;
		this.bienSoXe = bienSoXe;
		this.listChuyenXes = listChuyenXes;
	}

	public ThongTinPhanCong() {
	}

}
