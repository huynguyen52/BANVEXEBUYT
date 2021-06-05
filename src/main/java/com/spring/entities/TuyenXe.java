package com.spring.entities;

import java.time.LocalTime;
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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class TuyenXe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maTuyen;
	private String tenTuyen;
	private Integer thoiGianChuyen;
	private Integer thoiGianNghi;
	private String mocTuyen1;
	private String mocTuyen2;
	private LocalTime thoiGianBatDau;
	private LocalTime thoiGianKetThuc;
	// tuyen xe - thong tin ve thang
	@JsonIgnore
	@OneToMany(mappedBy = "tuyenXe",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<ThongTinVeThang> listThongTinVeThangs;
	
	// tuyen xe - chuyen xe
	@JsonIgnore
	@OneToMany(mappedBy = "tuyenXe",fetch = FetchType.EAGER)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<ChuyenXe> listChuyenXes;
	
	public List<ThongTinVeThang> getListThongTinVeThangs() {
		return listThongTinVeThangs;
	}

	public void setListThongTinVeThangs(List<ThongTinVeThang> listThongTinVeThangs) {
		this.listThongTinVeThangs = listThongTinVeThangs;
	}

	public List<ChuyenXe> getListChuyenXes() {
		return listChuyenXes;
	}

	public void setListChuyenXes(List<ChuyenXe> listChuyenXes) {
		this.listChuyenXes = listChuyenXes;
	}

	public TuyenXe() {
	}

	public Integer getMaTuyen() {
		return maTuyen;
	}



	public void setMaTuyen(Integer maTuyen) {
		this.maTuyen = maTuyen;
	}

	public TuyenXe(Integer maTuyen, String tenTuyen, Integer thoiGianChuyen, Integer thoiGianNghi, String mocTuyen1,
			String mocTuyen2, LocalTime thoiGianBatDau, LocalTime thoiGianKetThuc) {
		this.maTuyen = maTuyen;
		this.tenTuyen = tenTuyen;
		this.thoiGianChuyen = thoiGianChuyen;
		this.thoiGianNghi = thoiGianNghi;
		this.mocTuyen1 = mocTuyen1;
		this.mocTuyen2 = mocTuyen2;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	public String getTenTuyen() {
		return tenTuyen;
	}

	public LocalTime getThoiGianBatDau() {
		return thoiGianBatDau;
	}

	public void setThoiGianBatDau(LocalTime thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}

	public LocalTime getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}

	public void setThoiGianKetThuc(LocalTime thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	public void setTenTuyen(String tenTuyen) {
		this.tenTuyen = tenTuyen;
	}

	public Integer getThoiGianChuyen() {
		return thoiGianChuyen;
	}

	public void setThoiGianChuyen(Integer thoiGianChuyen) {
		this.thoiGianChuyen = thoiGianChuyen;
	}

	public Integer getThoiGianNghi() {
		return thoiGianNghi;
	}

	public void setThoiGianNghi(Integer thoiGianNghi) {
		this.thoiGianNghi = thoiGianNghi;
	}

	public String getMocTuyen1() {
		return mocTuyen1;
	}

	public void setMocTuyen1(String mocTuyen1) {
		this.mocTuyen1 = mocTuyen1;
	}

	public String getMocTuyen2() {
		return mocTuyen2;
	}

	public void setMocTuyen2(String mocTuyen2) {
		this.mocTuyen2 = mocTuyen2;
	}

}
