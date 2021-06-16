package com.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.ThongTinVeThangDetail;
import com.spring.repository.IMonthlyInformationDetailRepository;

@Service
public class MonlyInformationDetailService {
	
	@Autowired
	private IMonthlyInformationDetailRepository repo;
	
	public List<ThongTinVeThangDetail> listAll() {
		return (List<ThongTinVeThangDetail>) repo.findAll();
	}
	
	public void delete(Integer id) {
		repo.delete(id);
	}

	public ThongTinVeThangDetail get(Integer id) {
		return repo.findOne(id);
	}

	public void save(ThongTinVeThangDetail thongTinVeThangDetail) {
		System.out.println("thong tin ve thang");
		System.out.println("Thong tin ve thang: " + thongTinVeThangDetail.getAddNewBy());
		System.out.println("Thong tin ve thang: " + thongTinVeThangDetail.getAddNewDate());
		repo.save(thongTinVeThangDetail);
	}
	
	public Date highestNgayHetHan() {
		return repo.highestNgayHetHan();
	}
	
	public List<ThongTinVeThangDetail> getDataByMaxNgayHetHan(int maVeThang) {
		return repo.getDataByMaxNgayHetHan(maVeThang);
	}
	
	public List<ThongTinVeThangDetail> getThongTinVeThangDetailByMaVeThang(Integer maVeThang) {
		return repo.getThongTinVeThangDetailByMaVeThang(maVeThang);
	}
	
	public List<ThongTinVeThangDetail> getDataByMonth(int month){
		return repo.getDataByMonth(month);
	}
	
	public List<ThongTinVeThangDetail> getDataByDate(Date date){
		return repo.getDataByDate(date);
	}
	
	public List<ThongTinVeThangDetail> getDataByDateToDate(Date fromDate, Date toDate){
		return repo.getDataByDateToDate(fromDate, toDate);
	}
	
	public List<Date> getNgayMua(){
		return repo.getNgayMua();
	}
	public Integer  getListIDs(Date date) {
		return repo.getListIDs(date);
	}
	public Integer idToMaGia(int id) {
		return repo.idToMaGia(id);
	}
}
