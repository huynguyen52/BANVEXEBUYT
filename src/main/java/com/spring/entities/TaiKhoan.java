package com.spring.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class TaiKhoan {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maTaiKhoan;
	private String username;
	private String password;
	private String maRole;
	private Integer maNhanVien;
	@Column(nullable = true)
	private String image;

	// tai khoan - nhan vien
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "maNhanVien", insertable = false, updatable = false)
	private NhanVien nhanVien;

	// taikhoan - thong tin ve thang
	@JsonIgnore
	@OneToMany(mappedBy = "taiKhoan", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<ThongTinVeThangDetail> listThongTinVeThangDetails;

	public String getMaRole() {
		return maRole;
	}

	public void setMaRole(String maRole) {
		this.maRole = maRole;
	}

	// tài khoản - role
	@JsonBackReference
	@ManyToOne(optional = false)
	@JoinColumn(name = "maRole", insertable = false, updatable = false)
	private Role role;

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public TaiKhoan() {
	}

	public int getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(int maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public Integer getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(Integer maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public TaiKhoan(int maTaiKhoan, String username, String password, String maRole, Integer maNhanVien) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.username = username;
		this.password = password;
		this.maRole = maRole;
		this.maNhanVien = maNhanVien;
	}

	public List<ThongTinVeThangDetail> getListThongTinVeThangDetails() {
		return listThongTinVeThangDetails;
	}

	public void setListThongTinVeThangDetails(List<ThongTinVeThangDetail> listThongTinVeThangDetails) {
		this.listThongTinVeThangDetails = listThongTinVeThangDetails;
	}

}
