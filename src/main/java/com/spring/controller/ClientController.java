package com.spring.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.entities.GiaVeLuot;
import com.spring.entities.GiaVeThang;
import com.spring.entities.KhachThang;
import com.spring.entities.NhanVien;
import com.spring.entities.PhanCong;
import com.spring.entities.TaiKhoan;
import com.spring.entities.ThongTinVeLuot;
import com.spring.entities.ThongTinVeThang;
import com.spring.entities.ThongTinVeThangDetail;
import com.spring.entities.TuyenXe;
import com.spring.service.AccountService;
import com.spring.service.KhachThangService;
import com.spring.service.MonlyInformationDetailService;
import com.spring.service.MonthlyInformationService;
import com.spring.service.MonthlyTicketPriceService;
import com.spring.service.PhanCongService;
import com.spring.service.RouteService;
import com.spring.service.TicketInformationService;
import com.spring.service.TicketPriceService;

@Controller
public class ClientController {

	@Autowired
	private PhanCongService phanCongService;
	@Autowired
	private TicketInformationService ticketInformationService;
	@Autowired
	private TicketPriceService ticketPriceService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private RouteService routeService;
	@Autowired
	private  KhachThangService khachThangService;
	@Autowired
	private  MonthlyTicketPriceService monthlyTicketPriceService;
	@Autowired
	private MonthlyInformationService monthlyInformationService;
	@Autowired
	private MonlyInformationDetailService monthlyInformationDetailService;

	
	// home page
	@RequestMapping("/index")
	public ModelAndView indexPage() {
		ModelAndView mav = new ModelAndView("client/index");

		return mav;
	}
	
		public Date toDay() {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.HOUR_OF_DAY,0);
			cal.set(Calendar.MINUTE,0);
			cal.set(Calendar.SECOND,0);
			cal.set(Calendar.MILLISECOND,0);
			Date date = cal.getTime();
			return date;
		}
	    @RequestMapping("/add-veluot")
	 	public  ModelAndView addVeLuot(@RequestParam("loai") String loai, @RequestParam(value="biensoxe",defaultValue = "XXX-XXXXX") String bienSoXe,RedirectAttributes redirectAttributes) {
	    		
	    	Date date=toDay();
	    	List<PhanCong> listPhanCongs=phanCongService.listAll();
	    	int idPhanCong=0;
	    	for(int i=0;i<listPhanCongs.size();i++) {
	    		if(listPhanCongs.get(i).getNgay().compareTo(date)==0&& bienSoXe.equals(listPhanCongs.get(i).getBienSoXe())) {
	    			idPhanCong=listPhanCongs.get(i).getIdPhanCong();
	    		}
	    	}
	    	int idThongTinVeLuot=0;
	    	List<ThongTinVeLuot> thongTinVeLuots=ticketInformationService.listAll();
	    	for(int i=0;i<thongTinVeLuots.size();i++) {
	    		GiaVeLuot giaVeLuot=ticketPriceService.get(thongTinVeLuots.get(i).getMaGiaLuot());
	    		if(thongTinVeLuots.get(i).getMaPhanCong()==idPhanCong&& loai.equals(giaVeLuot.getMaCheDo())) {
	    			idThongTinVeLuot=thongTinVeLuots.get(i).getId();
	    		}
	    	}
	    	ThongTinVeLuot thongTinVeLuot=ticketInformationService.get(idThongTinVeLuot);
	    	thongTinVeLuot.setSoLuong(thongTinVeLuot.getSoLuong()+1);
			String message;
			try {
				ticketInformationService.save(thongTinVeLuot);
				System.out.println("SO LUONG VE LUOT TANG UPDATE");
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
			ModelAndView mav = new ModelAndView("client/index");
			return mav;
	    }
	
	// ban ve thang - new customer
	@RequestMapping("/setting")
	public ModelAndView settingPage() {
		ModelAndView mav = new ModelAndView("client/setting");
		List<KhachThang> listKhachThangs = khachThangService.listAll();
		List<GiaVeThang> listMonthPrices = monthlyTicketPriceService.listAll();
		List<TuyenXe> listTuyenXes = routeService.listAll();
		mav.addObject("listKhachThangs", listKhachThangs);
		mav.addObject("listMonthPrices", listMonthPrices);
		mav.addObject("listTuyenXes", listTuyenXes);
		return mav;
	}

	// check khách thàng đã tồn tại?
		public boolean checkKhachHang(String Kh, String maTuyen) {
			List<ThongTinVeThang> vt = monthlyInformationService.listAll();
			for (int i = 0; i < vt.size(); i++) {
				if (Kh.equals(vt.get(i).getMaKhachThang().toString()) && maTuyen.equals(vt.get(i).getMaTuyenXe().toString())){
					return true;
				}
			}
			return false;
		}

	public boolean checkKhachHang1(String Kh) {
		List<KhachThang> vt = khachThangService.listAll();
		for (int i = 0; i < vt.size(); i++) {
			if (Kh.equals(String.valueOf(vt.get(i).getMaKhachThang()))) {
				return false;
			}
		}
		return true;
	}

	// check tuyến xe
	public boolean checkRoute1(String maRoute) {
		List<TuyenXe> tx = routeService.listAll();
		for (int i = 0; i < tx.size(); i++) {
			if (maRoute.equals(tx.get(i).getMaTuyen().toString())) {
				return false;
			}
		}
		System.out.println("Khong co tuyen xe!");
		return true;
	}

	// check giá vé tháng
	public boolean checkGiaVeThang(String giaVe) {
		List<GiaVeThang> gvt = monthlyTicketPriceService.listAll();
		for (int i = 0; i < gvt.size(); i++) {
			if (Integer.valueOf(giaVe) == (gvt.get(i).getMaGia())) {
				return false;
			}
		}
		System.out.println("Khong co gia ve thang");
		return true;
	}
	
	public Date getLastDayOfMonth(Date today) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(today);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		System.out.println(calendar.getTime());
		return calendar.getTime();
		
	}
	public boolean checkDate(Date ngayMua) {
		/*
		 * DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd"); Date date = new
		 * Date();
		 */
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY,0);
		cal.set(Calendar.MINUTE,0);
		cal.set(Calendar.SECOND,0);
		cal.set(Calendar.MILLISECOND,0);
		Date date = cal.getTime();
		
		System.out.println(date+"\n"+ngayMua);
		if (ngayMua.compareTo(date) < 0) {
			System.out.println("Ngay mua ko hop le!");
			return true;
		}
		return false;
	}
	
	@RequestMapping(value = "add-customer", method = RequestMethod.POST)
	public String  addKhachThang(@RequestParam("hoTen") String hoTen,
			@RequestParam("ngaySinh") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaySinh,
			@RequestParam("note") String note, RedirectAttributes redirectAttributes) {
		KhachThang khachThang = new KhachThang(hoTen, ngaySinh, note);
		String message;
		try {
			khachThangService.save(khachThang);
			System.out.println("Them khach hang thanh cong");
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/setting";
	}
	// check tuyến xe
	public boolean checkRoute(String maRoute) {
		List<TuyenXe> tx = routeService.listAll();
		for (int i = 0; i < tx.size(); i++) {
			if (maRoute.equals(tx.get(i).getMaTuyen().toString())) {
				return false;
			}
		}
		System.out.println("khong co ma tuyen!!!");
		return true;
	}
	
	
	
	// Add a new Vé tháng
		@RequestMapping(value = "/add-monthly", method = RequestMethod.POST)
		public String addMonthlyInformation(@RequestParam("maKhachThang") String maKhachThang,
				@RequestParam("maTuyenXe") String maTuyenXe, @RequestParam("maGiaThang") String maGiaThang,
				@RequestParam("ngayMua") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayMua,
				@RequestParam(value="biensoxe",defaultValue = "XXX-XXXXX") String bienSoXe,
				RedirectAttributes redirectAttributes, HttpServletRequest request) {
			
			System.out.println("mvt: "+maGiaThang+"\tngaymua: "+ngayMua);
			
			if (checkKhachHang1(maKhachThang) || checkRoute(maTuyenXe) || checkGiaVeThang(maGiaThang)||checkDate(ngayMua)) {
				String message = "error";
				System.out.println(message);
				redirectAttributes.addFlashAttribute("message", message);
				return "redirect:/setting";
			}
			else if(checkKhachHang(maKhachThang, maTuyenXe)){
		    	Date date=toDay();
		    	List<PhanCong> listPhanCongs=phanCongService.listAll();
		    	int idNhanVien=0;
		    	for(int i=0;i<listPhanCongs.size();i++) {
		    		if(listPhanCongs.get(i).getNgay().compareTo(date)==0&& bienSoXe.equals(listPhanCongs.get(i).getBienSoXe())) {
		    			idNhanVien=listPhanCongs.get(i).getMaNhanVien();
		    			
		    		}
		    	}
		    	List<TaiKhoan> listTaiKhoans=accountService.listAll();
		    	TaiKhoan taiKhoan=new TaiKhoan();
		    	for(int i=0;i<listTaiKhoans.size();i++) {
		    		if(idNhanVien==listTaiKhoans.get(i).getMaNhanVien()) {
		    			taiKhoan=listTaiKhoans.get(i);
		    		}
		    	}
		    	int maVeThang=0;
		    	List<ThongTinVeThang> thongTinVeThangs=monthlyInformationService.listAll();
		    	for(int i=0;i<thongTinVeThangs.size();i++) {
		    		if(maKhachThang.equals(thongTinVeThangs.get(i).getMaKhachThang().toString())&&maTuyenXe.equals(thongTinVeThangs.get(i).getMaTuyenXe().toString())) {
		    			maVeThang=thongTinVeThangs.get(i).getMaVeThang();
		    		}
		    	}
		    	System.out.println(maGiaThang);
		    	ThongTinVeThangDetail  thongTinVeThangDetail=new ThongTinVeThangDetail();
		    	Date ngayHetHan = getLastDayOfMonth(ngayMua);
		    	thongTinVeThangDetail.setNgayMua(ngayMua);
		    	thongTinVeThangDetail.setMaGiaThang(Integer.valueOf(maGiaThang));
		    	thongTinVeThangDetail.setMaVeThang(maVeThang);
				thongTinVeThangDetail.setNgayHetHan(ngayHetHan);
				thongTinVeThangDetail.setAddNewBy(taiKhoan.getMaTaiKhoan());
				thongTinVeThangDetail.setAddNewDate(ngayMua);
				String message;
				if(checkGiaVeThang(maGiaThang)) {
					message="error";
				}else {
					try {
						monthlyInformationDetailService.save(thongTinVeThangDetail);
						message = "success";
					} catch (Exception e) {
						// TODO: handle exception
						message = "error";
					}
				}
				return "redirect:/setting";
			}
			else{

				Date ngayHetHan=getLastDayOfMonth(ngayMua);
				
				String message;
				HttpSession session = request.getSession();
				TaiKhoan tkSession = (TaiKhoan) session.getAttribute("taiKhoan");

				ThongTinVeThang thongTinVeThang = new ThongTinVeThang();
				thongTinVeThang.setMaKhachThang(Integer.valueOf(maKhachThang));
				thongTinVeThang.setMaTuyenXe(Integer.valueOf(maTuyenXe));
				try {
					// Lưu thông tin của vé tháng
					monthlyInformationService.save(thongTinVeThang);
			    	Date date=toDay();
			    	List<PhanCong> listPhanCongs=phanCongService.listAll();
			    	int idNhanVien=0;
			    	for(int i=0;i<listPhanCongs.size();i++) {
			    		if(listPhanCongs.get(i).getNgay().compareTo(date)==0&& bienSoXe.equals(listPhanCongs.get(i).getBienSoXe())) {
			    			idNhanVien=listPhanCongs.get(i).getMaNhanVien();
			    			
			    		}
			    	}
			    	List<TaiKhoan> listTaiKhoans=accountService.listAll();
			    	TaiKhoan taiKhoan=new TaiKhoan();
			    	for(int i=0;i<listTaiKhoans.size();i++) {
			    		if(idNhanVien==listTaiKhoans.get(i).getMaNhanVien()) {
			    			taiKhoan=listTaiKhoans.get(i);
			    		}
			    	}
			    	int maVeThang=0;
			    	List<ThongTinVeThang> thongTinVeThangs=monthlyInformationService.listAll();
			    	for(int i=0;i<thongTinVeThangs.size();i++) {
			    		if(maKhachThang.equals(thongTinVeThangs.get(i).getMaKhachThang().toString())&&maTuyenXe.equals(thongTinVeThangs.get(i).getMaTuyenXe().toString())) {
			    			maVeThang=thongTinVeThangs.get(i).getMaVeThang();
			    		}
			    	}
			    	System.out.println(maGiaThang);
			    	ThongTinVeThangDetail  thongTinVeThangDetail=new ThongTinVeThangDetail();
			    	Date ngayHetHan2 = getLastDayOfMonth(ngayMua);
			    	thongTinVeThangDetail.setNgayMua(ngayMua);
			    	thongTinVeThangDetail.setMaGiaThang(Integer.valueOf(maGiaThang));
			    	thongTinVeThangDetail.setMaVeThang(maVeThang);
					thongTinVeThangDetail.setNgayHetHan(ngayHetHan2);
					thongTinVeThangDetail.setAddNewBy(taiKhoan.getMaTaiKhoan());
					thongTinVeThangDetail.setAddNewDate(ngayMua);
					monthlyInformationDetailService.save(thongTinVeThangDetail);

					message = "success";
				} catch (Exception e) {
					message = "error";
				}
				redirectAttributes.addFlashAttribute("message", message);
				return "redirect:/setting";
			}
		}
	
	// something
	@RequestMapping("/something")
	public ModelAndView somethingPage() {
		ModelAndView mav = new ModelAndView("client/something");

		return mav;
	}
	
	
	
}
