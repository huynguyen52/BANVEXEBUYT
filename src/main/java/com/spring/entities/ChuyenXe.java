package com.spring.entities;

import java.time.LocalTime;
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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ChuyenXe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private LocalTime gioXuatPhat;
	private LocalTime gioKetThuc;
	private Integer maTuyen;
	public Integer getMaTuyen() {
		return maTuyen;
	}

	public void setMaTuyen(Integer maTuyen) {
		this.maTuyen = maTuyen;
	}

	//	chuyen xe- tuyen xe
	@JsonBackReference
	@ManyToOne(optional = false, cascade = CascadeType.PERSIST)
	@JoinColumn(name = "maTuyen", insertable = false, updatable = false)
	private TuyenXe tuyenXe;
	
	// chuyen xe- CT chuyen
	@JsonIgnore
	@OneToMany(mappedBy = "chuyenXe", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(value=FetchMode.SUBSELECT)
	private List<CTChuyen> listCTChuyens;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public TuyenXe getTuyenXe() {
		return tuyenXe;
	}

	public List<CTChuyen> getListCTChuyens() {
		return listCTChuyens;
	}

	public ChuyenXe(Integer id, LocalTime gioXuatPhat, LocalTime gioKetThuc, Integer maTuyen) {
		super();
		this.id = id;
		this.gioXuatPhat = gioXuatPhat;
		this.gioKetThuc = gioKetThuc;
		this.maTuyen = maTuyen;
	}

	public void setListCTChuyens(List<CTChuyen> listCTChuyens) {
		this.listCTChuyens = listCTChuyens;
	}

	public void setTuyenXe(TuyenXe tuyenXe) {
		this.tuyenXe = tuyenXe;
	}


	public ChuyenXe() {
	}


	

}
