package com.spring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class ThongTinVeLuot {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Integer soLuong;
	private int maPhanCong;
// 	thong tin ve-gia ve luot
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maGiaLuot", insertable = false, updatable = false)
	private GiaVeLuot giaVeLuot;
// 	thong tin ve luot- CT chuyen xe
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maPhanCong", insertable = false, updatable = false)
	private PhanCong phanCong;
	
	
	private int maGiaLuot;
	
	public int getMaGiaLuot() {
		return maGiaLuot;
	}

	public ThongTinVeLuot(Integer id, Integer soLuong, int maPhanCong, int maGiaLuot) {
		super();
		this.id = id;
		this.soLuong = soLuong;
		this.maPhanCong = maPhanCong;
		this.maGiaLuot = maGiaLuot;
	}

	public void setMaGiaLuot(int maGiaLuot) {
		this.maGiaLuot = maGiaLuot;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public GiaVeLuot getGiaVeLuot() {
		return giaVeLuot;
	}

	public void setGiaVeLuot(GiaVeLuot giaVeLuot) {
		this.giaVeLuot = giaVeLuot;
	}

	public int getMaPhanCong() {
		return maPhanCong;
	}

	public void setMaPhanCong(int maPhanCong) {
		this.maPhanCong = maPhanCong;
	}

	public PhanCong getPhanCong() {
		return phanCong;
	}

	public void setPhanCong(PhanCong phanCong) {
		this.phanCong = phanCong;
	}

	public ThongTinVeLuot() {

		// TODO Auto-generated constructor stub
	}
	
	

}
