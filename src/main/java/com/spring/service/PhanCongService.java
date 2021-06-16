package com.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.spring.entities.ChuyenXe;
import com.spring.entities.PhanCong;
import com.spring.repository.IPhanCongRepository;

@Service
public class PhanCongService {
	@Autowired
	private IPhanCongRepository repo;

	public List<PhanCong> listAll() {
		return (List<PhanCong>) repo.findAll();
	}

	public void delete(int id) {
		repo.delete(id);
	}

	public PhanCong get(int id) {
		return repo.findOne(id);
	}

	public void save(PhanCong phanCong) {
		repo.save(phanCong);
	}

	public List<Integer> getListNhanVien(int maTuyen, Date date) {
		return repo.getListStaff(maTuyen, date);
	}

	public List<Date> getListDays(Date dateFrom, Date dateTo) {
		return repo.getListDays(dateFrom, dateTo);
	}

	public List<Integer> getListMaPhanCong(Date currentDay) {
		return repo.getListMaPhanCong(currentDay);
	}

	public List<Object> filter() {
		return repo.filter();
	}

	public List<Object> filter2() {
		return repo.filter2();
	}

	public List<ChuyenXe> filter3() {
		return repo.filter3();
	}

	public List<Object> filter4() {
		return repo.filter4();
	}

	public PhanCong getByDateAndXe(Date date, String bienSoXe) {
		return repo.getByDateAndXe(date, bienSoXe);
	}

	// Vu
	public List<Integer> getListIdPCByNgay(Date ngay) {
		return repo.getListIdPCByNgay(ngay);
	}

	// Vu
	public int getIDPC(String bienSoXe, int maNhanVien, Date ngay) {
		return repo.getIDPC(bienSoXe, maNhanVien, ngay);
	}

	// Vu
	public List<Integer> getListChuyenByIDPC(int idPhanCong) {
		return repo.getListChuyenByIDPC(idPhanCong);
	}

	// Vu
	public List<Integer> getListNhanVien(Date ngay, int maTuyen) {
		return repo.getListNhanVien(ngay, maTuyen);
	}

	// Vu
	public String getBienSoXe(Date ngay, int maTuyen, int maNhanVien) {
		return repo.getBienSoXe(ngay, maTuyen, maNhanVien);
	}

	// Vu
	public List<ChuyenXe> getListChuyenXe(Date ngay, int maTuyen, int maNhanVien) {
		return repo.getListChuyenXe(ngay, maTuyen, maNhanVien);
	}
	
	public PhanCong getByNgayAndMaNV(Date date, int maNhanVien) {
		return repo.getByNgayAndMaNV(date, maNhanVien);
	}

	public List<Object> filter() {
		return repo.filter();
	}
	
	public List<Object> filter2() {
		return repo.filter2();
	}
	
	public List<ChuyenXe> filter3(){
		return repo.filter3();
	}
	
	public List<Object> filter4(){
		return repo.filter4();
	}
	
}
