package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ThongTinVeLuot;

public interface ITicketInformationRepository extends CrudRepository<ThongTinVeLuot, Integer> {

//	@Query(value = "select t from ThongTinVeLuot as t where t.ngay between :datestart and :dateend")
//	public List<ThongTinVeLuot> getDataByDateToDate(@Param("datestart") Date dateStart, @Param("dateend") Date dateEnd);
//	
//	@Query(value = "select tt from ThongTinVeLuot as tt where tt.ngay = :date")
//	public List<ThongTinVeLuot> getDataByDate(@Param("date") Date date);

	@Query(value = "select t from ThongTinVeLuot t where maPhanCong = :ma")
	public List<ThongTinVeLuot> getDataByMaPhanCong(@Param("ma") int maPhanCong);

	@Query(value="select t.maGiaLuot from ThongTinVeLuot t where t.maPhanCong=:idPhanCong")
	public List<Integer> listMaGiaLuot(@Param("idPhanCong") int idPhanCong);
	
	@Query(value="select soLuong from ThongTinVeLuot t where t.maPhanCong=:idPhanCong and maGiaLuot=:maGiaLuot")
	public Integer getSoLuong(@Param("idPhanCong") int idPhanCong,@Param("maGiaLuot") int maGiaLuot);

	@Query(value = "from ThongTinVeLuot where maPhanCong = :maphancong and maGiaLuot = :magialuot")
	public ThongTinVeLuot getByMaPhanCongAndMaGiaLuot(@Param("maphancong") int maPhanCong, @Param("magialuot") int maGiaLuot);

	@Query(value = "from ThongTinVeLuot ttvl where maGiaLuot = :maGiaLuot")
	public List<ThongTinVeLuot> checkDeleteGiaVeLuot(@Param("maGiaLuot") int maGiaLuot);
	
	@Query(value="select t from ThongTinVeLuot t,PhanCong p ,CTChuyen ct,ChuyenXe c where t.maPhanCong=p.idPhanCong and p.ngay=:ngay and p.idPhanCong=ct.idPhanCong and ct.idChuyen=c.id and c.maTuyen=:maTuyen")
	public List<ThongTinVeLuot> thongTinVeTuyenNgay(@Param("maTuyen") int maTuyen,@Param("ngay") Date ngay);

}
