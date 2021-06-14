package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ThongTinVeThangDetail;

public interface IMonthlyInformationDetailRepository extends CrudRepository<ThongTinVeThangDetail, Integer> {

	@Query(value = "select max(ngayHetHan) from ThongTinVeThangDetail")
	public Date highestNgayHetHan();

	// lấy ra thông tin vé tháng detail có mã vé tháng tương ứng và ngày hết hạn lớn
	// nhất
	@Query(value = "select t from ThongTinVeThangDetail as t where t.maVeThang = :maVeThang and t.ngayHetHan = (select MAX(tt.ngayHetHan) from ThongTinVeThangDetail as tt where tt.maVeThang = :maVeThang)")
	public List<ThongTinVeThangDetail> getDataByMaxNgayHetHan(@Param("maVeThang") int maVeThang);

	@Query(value = "select t from ThongTinVeThangDetail t where t.maVeThang = :maVeThang")
	public List<ThongTinVeThangDetail> getThongTinVeThangDetailByMaVeThang(@Param("maVeThang") Integer maVeThang);

	@Query(value = "select t from ThongTinVeThangDetail t where MONTH(t.ngayMua) = :month")
	public List<ThongTinVeThangDetail> getDataByMonth(@Param("month") Integer month);

	@Query(value = "select t from ThongTinVeThangDetail t where t.ngayMua = :date")
	public List<ThongTinVeThangDetail> getDataByDate(@Param("date") Date date);

	@Query(value = "select t from ThongTinVeThangDetail t where t.ngayMua between :fromDate and :toDate")
	public List<ThongTinVeThangDetail> getDataByDateToDate(@Param("fromDate") Date fromDate, @Param("toDate") Date toDate);
	
	@Query(value= "SELECT DISTINCT ngayMua FROM ThongTinVeThangDetail")
	public List<Date> getNgayMua();
	
	@Query(value="select t.id from ThongTinVeThangDetail t where t.ngayMua=:ngay")
	public Integer getListIDs(@Param("ngay")Date date);
	
	@Query(value="select t.maGiaThang from ThongTinVeThangDetail t where t.id=:id")
	public Integer idToMaGia(@Param("id")int id);
}
