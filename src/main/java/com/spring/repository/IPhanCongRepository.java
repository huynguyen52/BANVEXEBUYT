package com.spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.spring.entities.ChuyenXe;
import com.spring.entities.PhanCong;

public interface IPhanCongRepository extends CrudRepository<PhanCong, Integer> {

	// list ma nhan vien lam trong ngay hom do tuyen do
	@Query(value = "select p.maNhanVien from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong= ct.idPhanCong and ct.id = ct.idChuyen and c.maTuyen = :tuyen and p.ngay = :ngay")
	public List<Integer> getListStaff(@Param("tuyen") int maTuyen, @Param("ngay") Date date);

	@Query(value = "select distinct p.ngay from PhanCong p where p.ngay>=:dateFrom and p.ngay <=:dateTo")
	public List<Date> getListDays(@Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo);

	@Query(value = "select p.idPhanCong from PhanCong p where p.ngay=:currentDay")
	public List<Integer> getListMaPhanCong(@Param("currentDay") Date currentDay);

	@Query(value = "select distinct nv.maNhanVien from NhanVien nv where nv.maNhanVien in (select p.maNhanVien from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong= ct.idPhanCong and ct.id = ct.idChuyen and c.maTuyen = 1 and p.ngay = '2021-06-04')")
	public List<Object> filter();

	@Query(value = "select distinct pc.bienSoXe from PhanCong pc where pc.bienSoXe in (select p.bienSoXe from PhanCong p,CTChuyen ct,ChuyenXe c where ct.idPhanCong=ct.idPhanCong and ct.idChuyen=c.id and c.maTuyen='1' and p.ngay='2021-06-04' and p.maNhanVien = '1')")
	public List<Object> filter2();

	@Query(value = "from ChuyenXe chuyen where chuyen.id=(select cx.id from ChuyenXe cx where cx.id in (select c.id from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong = ct.idPhanCong and ct.idChuyen=c.id and matuyen='1' and ngay='2021-06-04' and maNhanvien='1'))")
	public List<ChuyenXe> filter3();

	@Query(value = "select nv.hoTen from NhanVien nv where nv.maNhanVien = '1'")
	public List<Object> filter4();

	// lấy ra phân công dựa vào ngày và xe
	@Query(value = "from PhanCong where ngay = :date and bienSoXe = :biensoxe")
	public PhanCong getByDateAndXe(@Param("date") Date date, @Param("biensoxe") String bienSoXe);

	// Vu
	@Query(value = "select distinct pc.idPhanCong from PhanCong pc,CTChuyen ct where pc.ngay=:ngay")
	public List<Integer> getListIdPCByNgay(@Param("ngay") Date ngay);

	// Vu
	@Query(value = "select pc.idPhanCong from PhanCong pc where pc.bienSoXe=:bienSoXe and pc.maNhanVien=:maNhanVien and pc.ngay=:ngay")
	public int getIDPC(@Param("bienSoXe") String bienSoXe, @Param("maNhanVien") int maNhanVien,
			@Param("ngay") Date ngay);

	// Vu
	@Query(value = "select ct.idChuyen from CTChuyen ct, PhanCong pc where pc.idPhanCong=:idPhanCong and pc.idPhanCong=ct.idPhanCong")
	public List<Integer> getListChuyenByIDPC(@Param("idPhanCong") int idPhanCong);

	// Vu
	// list nhan vien tu ngay va tuyen
	@Query(value = "select distinct p.maNhanVien from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong= ct.idPhanCong and c.id = ct.idChuyen and c.maTuyen =:tuyen and p.ngay = :ngay")
	public List<Integer> getListNhanVien(@Param("ngay") Date ngay, @Param("tuyen") int tuyen);
	
	//Vu
	@Query(value = "select distinct pc.bienSoXe from PhanCong pc where pc.bienSoXe in (select p.bienSoXe from PhanCong p,CTChuyen ct,ChuyenXe c where ct.idPhanCong=ct.idPhanCong and ct.idChuyen=c.id and c.maTuyen=:tuyen and p.ngay=:ngay and p.maNhanVien = :maNhanVien)")
	public String getBienSoXe(@Param("ngay") Date ngay, @Param("tuyen") int tuyen, @Param("maNhanVien") int maNhanVien);
	
	
	//Vu
	@Query(value = "select c from PhanCong p, CTChuyen ct, ChuyenXe c where p.idPhanCong = ct.idPhanCong and ct.idChuyen=c.id and matuyen=:tuyen and ngay=:ngay and maNhanVien=:maNhanVien ORDER BY c.id")
	public List<ChuyenXe> getListChuyenXe(@Param("ngay") Date ngay, @Param("tuyen") int maTuyen,@Param("maNhanVien") int maNhanVien);
	
	@Query(value = "from PhanCong where ngay = :ngay and maNhanVien = :manv")
	public PhanCong getByNgayAndMaNV(@Param("ngay") Date date, @Param("manv") int maNhanVien);

	
	
}
