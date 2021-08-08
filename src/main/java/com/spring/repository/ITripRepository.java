package com.spring.repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ChuyenXe;

public interface ITripRepository extends CrudRepository<ChuyenXe, Integer>{
	
	@Query(value = "update ChuyenXe set chuyen = :chuyen, maTuyen = :maTuyen, gioXuatPhat = ':gioXuatPhat', gioQuayVe = ':gioQuayVe', bienSoXe = ':bienSoXe', maNhanVien = :maNhanVien where id = :id")
	public void updateById(@Param("id") Integer id,
			@Param("chuyen") Integer chuyen,
			@Param("maTuyen") Integer maTuyen,
			@Param("gioXuatPhat") LocalDate gioXuatPhat,
			@Param("gioQuayVe") LocalDate gioQuayVe,
			@Param("bienSoXe") String bienSoXe,
			@Param("maNhanVien") Integer maNhanVien);
	
	@Query(value = "from ChuyenXe cx where cx.maTuyen = :maTuyen")
	public List<ChuyenXe> getDataByMatuyen(@Param("maTuyen") Integer maTuyen);
	
	@Query(value="select distinct cx.maTuyen from PhanCong p,CTChuyen c,ChuyenXe cx,ThongTinVeLuot t where p.idPhanCong=c.idPhanCong and p.idPhanCong=t.maPhanCong and c.idPhanCong=t.maPhanCong and c.idChuyen=cx.id and p.ngay>=:fromDate and p.ngay <=:toDate")
	public List<Integer> listMaTuyen(@Param("fromDate") Date fromDate,@Param("toDate") Date toDate);
	@Query(value="select c.maTuyen from ChuyenXe c where c.id=:idChuyen")
	public Integer getMaTuyens(@Param("idChuyen") Integer idChuyen);
	@Query(value = "from ChuyenXe cx where maTuyen = :maTuyen")
	public List<ChuyenXe> checkDeleteTuyenXe(@Param("maTuyen") int maTuyen);
}
