package com.spring.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class CTChuyen {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int idPhanCong;
	private int idChuyen;
//	CTchuyen-PhanCong
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.ALL)
	@JoinColumn(name = "idPhanCong", insertable = false, updatable = false)
	private PhanCong phanCong;
	
//	CTchuyen-Chuyen
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.ALL)
	@JoinColumn(name = "idChuyen", insertable = false, updatable = false)
	private ChuyenXe chuyenXe;
	
	public int getId() {
		return id;
	}
	public CTChuyen(int id, int idPhanCong, int idChuyen, PhanCong phanCong, ChuyenXe chuyenXe) {
		super();
		this.id = id;
		this.idPhanCong = idPhanCong;
		this.idChuyen = idChuyen;
		this.phanCong = phanCong;
		this.chuyenXe = chuyenXe;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdPhanCong() {
		return idPhanCong;
	}
	public void setIdPhanCong(int idPhanCong) {
		this.idPhanCong = idPhanCong;
	}
	public int getIdChuyen() {
		return idChuyen;
	}
	public void setIdChuyen(int idChuyen) {
		this.idChuyen = idChuyen;
	}
	public PhanCong getPhanCong() {
		return phanCong;
	}
	public void setPhanCong(PhanCong phanCong) {
		this.phanCong = phanCong;
	}
	public ChuyenXe getChuyenXe() {
		return chuyenXe;
	}
	public void setChuyenXe(ChuyenXe chuyenXe) {
		this.chuyenXe = chuyenXe;
	}
	public CTChuyen() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
