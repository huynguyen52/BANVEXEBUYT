package com.spring.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.entities.CheDo;
import com.spring.entities.ChuyenXe;
import com.spring.entities.GiaVeLuot;
import com.spring.entities.GiaVeThang;
import com.spring.entities.KhachThang;
import com.spring.entities.NhanVien;
import com.spring.entities.PhanCong;
import com.spring.entities.Role;
import com.spring.entities.TaiKhoan;
import com.spring.entities.ThongTinVeLuot;
import com.spring.entities.ThongTinVeThang;
import com.spring.entities.ThongTinVeThangDetail;
import com.spring.entities.TuyenXe;
import com.spring.entities.Xe;
import com.spring.service.AccountService;
import com.spring.service.BusService;
import com.spring.service.KhachThangService;
import com.spring.service.ModeService;
import com.spring.service.MonlyInformationDetailService;
import com.spring.service.MonthlyInformationService;
import com.spring.service.MonthlyTicketPriceService;
import com.spring.service.PhanCongService;
import com.spring.service.RoleService;
import com.spring.service.RouteService;
import com.spring.service.StaffService;
import com.spring.service.TicketInformationService;
import com.spring.service.TicketPriceService;
import com.spring.service.TripService;

@RequestMapping(value = "/admin")
@Controller()
public class AdminController {

	private final Long ONE_MONTH = 2592000000L;
	private final Long ONE_DAY = 86400000L;

	@Autowired
	private RouteService routeService;
	@Autowired
	private TripService tripService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private BusService busService;
	@Autowired
	private KhachThangService khachThangService;
	@Autowired
	private ModeService modeService;
	@Autowired
	private MonthlyInformationService monthlyInformationService;
	@Autowired
	private MonlyInformationDetailService monthlyInformationDetailService;
	@Autowired
	private MonthlyTicketPriceService monthlyTicketPriceService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private TicketInformationService ticketInformationService;
	@Autowired
	private TicketPriceService ticketPriceService;
	@Autowired
	private PhanCongService phanCongService;

//	public void checkCTChuyen() throws ParseException {
//		Scanner scanner=new Scanner(System.in);
//		System.out.println("Ma chuyen xe: ");
//		int maChuyenXe=scanner.nextInt();
//		System.out.println("Mã tuyen xe: ");
//		int maTuyenXe=scanner.nextInt();
//		System.out.println("Nhập ngay: ");
//		String date=scanner.next();
//		Date date1=new SimpleDateFormat("yyyy/MM/dd").parse(date);
//		System.out.println(date+"\t"+date1);
//		
//		List<ChuyenXe> chuyenXes=tripService.listAll();
//		List<PhanCong> PhanCongs=phanCongService.listAll();
//		for(int i=0;i<chuyenXes.size();i++) {
//			if(maChuyenXe==chuyenXes.get(i).getChuyen()&&maTuyenXe==chuyenXes.get(i).getMaTuyen()) {
//				for(int j=0;j<PhanCongs.size();j++) {
//					if(PhanCongs.get(j).getMaChuyenXe()==chuyenXes.get(i).getChuyen() && date1.compareTo(PhanCongs.get(j).getNgay())==0) {
//						System.out.println("CT_Chuyen ma nhan vien: "+ PhanCongs.get(j).getMaNhanVien());
//						System.out.println("CT_Chuyen ma bien so xe: "+ PhanCongs.get(j).getMaNhanVien());
//					}
//				}
//			}
//		}
//
//	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView indexPage() {
		ModelAndView mav = new ModelAndView("admin/index");

		return mav;
	}

	// Errors page
	@RequestMapping(value = "/errors", method = RequestMethod.GET)
	public String errorsPage() {
		return "admin/errors";
	}

	// Login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() throws ParseException {

		return "admin/login";
	}

	// Logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpSession session) {
		session.removeAttribute("taiKhoan");
		return "redirect:/login";
	}

	public List<NhanVien> checkNhanVien() {
		List<NhanVien> listStaff = staffService.listAll();
		List<TaiKhoan> listAccounts = accountService.listAll();
		List<NhanVien> listNhanViens = new ArrayList<NhanVien>();
		if (listAccounts.isEmpty()) {
			listNhanViens.addAll(listStaff);
		} else {
			for (int i = 0; i < listStaff.size(); i++) {
				int num = 0;
				for (int j = 0; j < listAccounts.size(); j++) {
					if (listStaff.get(i).getMaNhanVien() == listAccounts.get(j).getNhanVien().getMaNhanVien()) {
						num = num + 1;
					}
				}
				if (num == 0) {
					listNhanViens.add(listStaff.get(i));
				} else {
					num = 0;
				}
			}
		}

		System.out.println(listNhanViens.toString());
		return listNhanViens;
	}

	// Account
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public ModelAndView accountPage() throws ParseException {
		ModelAndView mav = new ModelAndView("admin/account");
//		checkCTChuyen();

		List<TaiKhoan> listTaiKhoans = accountService.listAll();
		List<Role> listRoles = roleService.listAll();
		List<NhanVien> listStaffs = staffService.listAll();
		List<NhanVien> listNhanViens = checkNhanVien();

		mav.addObject("listTaiKhoans", listTaiKhoans);
		mav.addObject("listRoles", listRoles);
		mav.addObject("listStaffs", listStaffs);
		mav.addObject("listNhanViens", listNhanViens);
		mav.addObject("active", "account");
		return mav;
	}

	// check username
	public boolean checkUserName(String userName) {
		List<TaiKhoan> listTaiKhoans = accountService.listAll();
		for (int i = 0; i < listTaiKhoans.size(); i++) {
			if (listTaiKhoans.get(i).getUsername().equals(userName)) {
				return true;
			}
		}
		return false;
	}

	// add a new account
	public static String getMd5(String input) {
		try {
			// Static getInstance method is called with hashing MD5
			MessageDigest md = MessageDigest.getInstance("MD5");

			// digest() method is called to calculate message digest
			// of an input digest() return array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		}
		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	@RequestMapping(value = "add-account", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String addAccount(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("maRole") String maRole, @RequestParam("maNhanVien") int maNhanVien,
			@RequestParam(value = "image", required = false) CommonsMultipartFile image, HttpSession s,
			RedirectAttributes redirectAttributes) {
		TaiKhoan taiKhoan = new TaiKhoan();
		taiKhoan.setUsername(username);
		taiKhoan.setPassword(password);
		taiKhoan.setMaRole(maRole);
		taiKhoan.setMaNhanVien(maNhanVien);

		if (image.getOriginalFilename() == "") {
			taiKhoan.setImage("undraw_profile.svg");
		} else {
			byte[] data = image.getBytes();
			String nameImage = String.valueOf(new Date().getTime()) + "-" + image.getOriginalFilename();
			String path = s.getServletContext().getRealPath("/") + "sources" + File.separator + "admin" + File.separator
					+ "img" + File.separator + nameImage;
			System.out.println(path);
			try {
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(data);
				fos.close();
				taiKhoan.setImage(nameImage);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String message;
		if (checkUserName(taiKhoan.getUsername().trim())) {
			message = "error";
		} else {
			try {
				taiKhoan.setPassword(getMd5(taiKhoan.getPassword()));
				accountService.save(taiKhoan);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}

		redirectAttributes.addFlashAttribute("message", message);

		return "redirect:/admin/account";
	}

	// edit a account
	public boolean checkPass_1(String password) {
		List<TaiKhoan> listTaiKhoans = accountService.listAll();
		for (int i = 0; i < listTaiKhoans.size(); i++) {
			if (password.compareTo(listTaiKhoans.get(i).getPassword()) == 0) {
				listTaiKhoans.get(i).setPassword(password);
				return true;
			}
		}
		return false;
	}

	// @RequestParam(value = "image", required = false) CommonsMultipartFile image
	@RequestMapping(value = "/edit-account")
	public @ResponseBody HashMap<String, String> postAccountData(@RequestParam("maTaiKhoan") String maTaiKhoan) {
		HashMap<String, String> data = new HashMap<String, String>();
		TaiKhoan taiKhoan = accountService.get(Integer.parseInt(maTaiKhoan));
		data.put("maTaiKhoan", String.valueOf(taiKhoan.getMaTaiKhoan()));
		data.put("username", taiKhoan.getUsername());
		data.put("password", taiKhoan.getPassword());
		data.put("maRole", taiKhoan.getRole().getMaRole());
		data.put("maNhanVien", String.valueOf(taiKhoan.getNhanVien().getMaNhanVien()));
		data.put("image", taiKhoan.getImage());
		return data;
	}

	// update-account
	@RequestMapping(value = "update-account", method = RequestMethod.POST)
	public String updateAccount(@RequestParam("maTaiKhoan") String maTaiKhoan,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("maRole") String maRole, @RequestParam("maNhanVien") String maNhanVien,
			@RequestParam(value = "image", required = false) CommonsMultipartFile image, HttpSession s,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		TaiKhoan taiKhoan = new TaiKhoan();

		if (checkPass_1(password)) {
			taiKhoan = new TaiKhoan(Integer.valueOf(maTaiKhoan), username, password, maRole,
					Integer.valueOf(maNhanVien));
		} else {
			taiKhoan = new TaiKhoan(Integer.valueOf(maTaiKhoan), username, getMd5(password), maRole,
					Integer.valueOf(maNhanVien));
		}
		String message = "";

		// save image
		if (image.getOriginalFilename() == "") {
			taiKhoan.setImage("undraw_profile.svg");
		} else {
			byte[] data = image.getBytes();
			String nameImage = String.valueOf(new Date().getTime()) + "-" + image.getOriginalFilename();
			String path = s.getServletContext().getRealPath("/") + "sources" + File.separator + "admin" + File.separator
					+ "img" + File.separator + nameImage;
			System.out.println(path);
			try {
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(data);
				fos.close();
				taiKhoan.setImage(nameImage);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		try {
			accountService.save(taiKhoan);
			message = "Update Success!";
		} catch (Exception e) {
			// TODO: handle exception
			message = "Error!";
		}

		// reset current session
		HttpSession session = request.getSession();
		TaiKhoan tkTemp = (TaiKhoan) session.getAttribute("taiKhoan");
		TaiKhoan tkMoi = accountService.get(tkTemp.getMaTaiKhoan());
		s.removeAttribute("taiKhoan");
		s.setAttribute("taiKhoan", tkMoi);

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/account";
	}

	// Xe Bus
	@RequestMapping(value = "/bus", method = RequestMethod.GET)
	public ModelAndView busPage() {
		ModelAndView mav = new ModelAndView("admin/bus");

		List<Xe> listXes = busService.listAll();
		mav.addObject("listXes", listXes);

		return mav;
	}

	// check bien so xe
	public boolean checkXe(String bsx) {
		List<Xe> listXes = busService.listAll();
		for (int i = 0; i < listXes.size(); i++) {
			if (listXes.get(i).getBienSoxe().equals(bsx)) {
				return true;
			}
		}
		return false;
	}

	// add bus
	@RequestMapping(value = "add-bus", method = RequestMethod.POST)
	public String addRoute(@ModelAttribute("bus") Xe xe, RedirectAttributes redirectAttributes) {
		String message;

		if (checkXe(xe.getBienSoxe())) {
			message = "error";
		} else {
			try {
				busService.save(xe);
				message = "success";

			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/bus";
	}

	// delete bus
	@RequestMapping(value = "delete-bus", method = RequestMethod.POST)
	public String deleteBus(@RequestParam("bienSoXe") String bienSoXe, RedirectAttributes redirectAttributes) {
		String message;
		try {
			busService.delete(bienSoXe);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/bus";
	}

	// Khách Tháng
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public ModelAndView customerPage() {
		ModelAndView mav = new ModelAndView("admin/customer");
		List<KhachThang> listKhachThangs = khachThangService.listAll();
		mav.addObject("listKhachThangs", listKhachThangs);
		mav.addObject("active", "customer");
		return mav;
	}

	// Add a Khach Thang
	@RequestMapping(value = "add-customer", method = RequestMethod.POST)
	public String addKhachThang(@RequestParam("hoTen") String hoTen,
			@RequestParam("ngaySinh") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaySinh,
			@RequestParam("note") String note, RedirectAttributes redirectAttributes) {
		KhachThang khachThang = new KhachThang(hoTen, ngaySinh, note);
		String message;
		try {
			khachThangService.save(khachThang);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/customer";
	}

	// Edit a Khach Thang
	@RequestMapping(value = "/edit-customer")
	public @ResponseBody HashMap<String, String> postCustomerData(@RequestParam("id") String id) {
		KhachThang khachThang = khachThangService.get(Integer.parseInt(id));

		HashMap<String, String> data = new HashMap<String, String>();
		data.put("maKhachThang", String.valueOf(khachThang.getMaKhachThang()));
		data.put("hoTen", khachThang.getHoTen());
		data.put("ngaySinh", String.valueOf(khachThang.getNgaySinh()));
		data.put("note", String.valueOf(khachThang.getNote()));
		return data;
	}

	// update a Khach Thang after edit
	@RequestMapping(value = "/update-customer", method = RequestMethod.POST)
	public String saveCustomer(@RequestParam("maKhachThang") String maKhachThang, @RequestParam("hoTen") String hoTen,
			@RequestParam("ngaySinh") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngaySinh,
			@RequestParam("note") String note, RedirectAttributes redirectAttributes) {
		KhachThang khachThang = new KhachThang(Integer.valueOf(maKhachThang), hoTen, ngaySinh, note);
		String message;
		try {
			khachThangService.save(khachThang);
			;
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/customer";
	}

	// delete a customer
	@RequestMapping(value = "delete-customer", method = RequestMethod.POST)
	public String deleteCustomer(@RequestParam("maKhachThang") int maKhachThang,
			RedirectAttributes redirectAttributes) {
		String message;
		try {
			khachThangService.delete(maKhachThang);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/customer";
	}

	// Chế độ
	@RequestMapping(value = "/mode", method = RequestMethod.GET)
	public ModelAndView modePage() {
		ModelAndView mav = new ModelAndView("admin/mode");
		List<CheDo> listCheDos = modeService.listAll();

		mav.addObject("listCheDos", listCheDos);
		mav.addObject("active", "mode");
		return mav;
	}

	// check maMode
	public boolean checkMaMode(String maMode) {
		List<CheDo> listCheDos = modeService.listAll();
		for (int i = 0; i < listCheDos.size(); i++) {
			if (listCheDos.get(i).getMaCheDo().equals(maMode)) {
				return true;
			}
		}
		return false;
	}

	/// add a new mode
	@RequestMapping(value = "add-mode", method = RequestMethod.POST)
	public String addMode(@ModelAttribute("chedo") CheDo cheDo, RedirectAttributes redirectAttributes) {
		String message;
		if (checkMaMode(cheDo.getMaCheDo())) {
			message = "error";
		} else {
			try {
				modeService.save(cheDo);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/mode";
	}

	// edit a mode
	@RequestMapping(value = "/edit-mode")
	public @ResponseBody CheDo postModeData(@RequestParam("maCheDo") String maCheDo) {

		CheDo cheDo = modeService.get(maCheDo);

		return cheDo;
	}

	// delete a role
	@RequestMapping(value = "delete-mode", method = RequestMethod.POST)
	public String deleteMode(@RequestParam("maCheDo") String maMode, RedirectAttributes redirectAttributes) {
		String message;
		try {
			modeService.delete(maMode);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/mode";
	}

	// update mode after edit
	@RequestMapping(value = "/update-mode", method = RequestMethod.POST)
	public String saveMode(@ModelAttribute("chedo") CheDo cheDo, RedirectAttributes redirectAttributes) {

		String message;
		try {
			modeService.save(cheDo);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/mode";
	}

	// check khachThang
	public List<KhachThang> checkKhachThang() {
		List<KhachThang> kts = khachThangService.listAll();
		List<ThongTinVeThang> vt = monthlyInformationService.listAll();
		List<KhachThang> khachThangs = new ArrayList<KhachThang>();
		if (vt.isEmpty()) {
			khachThangs.addAll(kts);
		} else {
			for (int i = 0; i < kts.size(); i++) {
				int num = 0;
				for (int j = 0; j < vt.size(); j++) {
					if (kts.get(i).getMaKhachThang() == vt.get(j).getKhachThang().getMaKhachThang()) {
						num = num + 1;
					}
				}
				if (num == 0) {
					khachThangs.add(kts.get(i));

				} else {
					num = 0;
				}
			}
		}
		System.out.println(khachThangs.toString());
		return khachThangs;
	}

	// Thông tin vé tháng
	@RequestMapping(value = "/monthly-information", method = RequestMethod.GET)
	public ModelAndView monthlyInformationPage() {
		ModelAndView mav = new ModelAndView("admin/monthly-information");
		List<ThongTinVeThang> listThongTinVeThangs = monthlyInformationService.listAll();
		List<TuyenXe> listTuyenXes = routeService.listAll();
		List<KhachThang> listCustomers = khachThangService.listAll();

		// lấy ra list thong tin vé tháng detail có ngày hết hạn lớn nhất ứng với từng
		// thông tin vé tháng
		List<ThongTinVeThangDetail> listThongTinVeThangDetails = new ArrayList<ThongTinVeThangDetail>();
		for (ThongTinVeThang i : listThongTinVeThangs) {
			List<ThongTinVeThangDetail> thongTinVeThangDetails = monthlyInformationDetailService
					.getDataByMaxNgayHetHan(i.getMaVeThang());
			ThongTinVeThangDetail thongTinVeThangDetail = thongTinVeThangDetails.get(thongTinVeThangDetails.size() - 1);
			listThongTinVeThangDetails.add(thongTinVeThangDetail);
		}

		List<GiaVeThang> listMonthPrices = monthlyTicketPriceService.listAll();
		mav.addObject("listThongTinVeThangs", listThongTinVeThangs);
		mav.addObject("listThongTinVeThangDetails", listThongTinVeThangDetails);
		mav.addObject("listTuyenXes", listTuyenXes);
		mav.addObject("listCustomers", listCustomers);
		mav.addObject("listKhachThangs", listCustomers);
		mav.addObject("listMonthPrices", listMonthPrices);
		mav.addObject("active", "monthly-information");
//		List<KhachThang> khachThangs = checkKhachThang();
//		mav.addObject("listKhachThangs", khachThangs);
		return mav;
	}

	// check khách thàng đã tồn tại?
	public boolean checkKhachHang(String Kh, String maTuyen) {
		List<ThongTinVeThang> vt = monthlyInformationService.listAll();
		for (int i = 0; i < vt.size(); i++) {
			if (Kh.equals(vt.get(i).getMaKhachThang().toString())
					&& maTuyen.equals(vt.get(i).getMaTuyenXe().toString())) {
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
		Calendar calendar = Calendar.getInstance();
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
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date date = cal.getTime();

		System.out.println(date + "\n" + ngayMua);
		if (ngayMua.compareTo(date) < 0) {
			System.out.println("Ngay mua ko hop le!");
			return true;
		}
		return false;
	}

	// Add a new Vé tháng
	@RequestMapping(value = "/add-monthly", method = RequestMethod.POST)
	public String addMonthlyInformation(@RequestParam("maKhachThang") String maKhachThang,
			@RequestParam("maTuyenXe") String maTuyenXe, @RequestParam("maGiaThang") String maGiaThang,
			@RequestParam("ngayMua") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayMua,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		if (checkKhachHang(maKhachThang, maTuyenXe) || checkKhachHang1(maKhachThang) || checkRoute(maTuyenXe)
				|| checkGiaVeThang(maGiaThang) || checkDate(ngayMua)) {
			String message = "error";
			System.out.println(message);
			redirectAttributes.addFlashAttribute("message", message);
			return "redirect:/admin/monthly-information";
		} else {

			Date ngayHetHan = getLastDayOfMonth(ngayMua);

			String message;
			HttpSession session = request.getSession();
			TaiKhoan tkSession = (TaiKhoan) session.getAttribute("taiKhoan");

			ThongTinVeThang thongTinVeThang = new ThongTinVeThang();
			thongTinVeThang.setMaKhachThang(Integer.valueOf(maKhachThang));
			thongTinVeThang.setMaTuyenXe(Integer.valueOf(maTuyenXe));
			try {
				// Lưu thông tin của vé tháng
				monthlyInformationService.save(thongTinVeThang);
				Integer highestMaVeThang = monthlyInformationService.getHighestMaVeThang();

				// Nếu thông tin vé tháng được lưu thành công -> tạo mới và lưu thông tin vé
				// tháng detail
				ThongTinVeThangDetail thongTinVeThangDetail = new ThongTinVeThangDetail();
				thongTinVeThangDetail.setNgayMua(ngayMua);
				thongTinVeThangDetail.setNgayHetHan(ngayHetHan);
				thongTinVeThangDetail.setMaGiaThang(Integer.valueOf(maGiaThang));
				thongTinVeThangDetail.setMaVeThang(highestMaVeThang);
				thongTinVeThangDetail.setAddNewBy(tkSession.getMaTaiKhoan());
				thongTinVeThangDetail.setAddNewDate(ngayMua);
				monthlyInformationDetailService.save(thongTinVeThangDetail);

				message = "success";
			} catch (Exception e) {
				message = "error";
			}
			redirectAttributes.addFlashAttribute("message", message);
			return "redirect:/admin/monthly-information";
		}
	}

	// Lấy thông tin Gia hạn vé tháng cho khách hàng đã tồn tại và trả về
	@RequestMapping(value = "/add-exit-monthly")
	public @ResponseBody HashMap<String, String> postMonthlyData(@RequestParam("id") String id) {
		HashMap<String, String> data = new HashMap<String, String>();
		ThongTinVeThangDetail thongTinVeThangDetail = monthlyInformationDetailService.get(Integer.valueOf(id));

		Integer maKhachThang = thongTinVeThangDetail.getThongTinVeThang().getMaKhachThang();
		Integer maTuyenXe = thongTinVeThangDetail.getThongTinVeThang().getMaTuyenXe();
		Integer maVeThang = thongTinVeThangDetail.getMaVeThang();
		Integer maGiaThang = thongTinVeThangDetail.getMaGiaThang();
		Date ngayHetHan = thongTinVeThangDetail.getNgayHetHan();

		data.put("maKhachThang", String.valueOf(maKhachThang));
		data.put("maTuyenXe", String.valueOf(maTuyenXe));
		data.put("maVeThang", String.valueOf(maVeThang));
		data.put("maGiaThang", String.valueOf(maGiaThang));
		data.put("ngayHetHan", String.valueOf(ngayHetHan));
		return data;
	}

	// Lấy thông tin Gia hạn vé tháng cho khách hàng đã tồn tại và trả về
	// information-ticket-detail
	@RequestMapping(value = "/add-exit-monthly-detail")
	public @ResponseBody HashMap<String, String> postMonthlyDetailData(@RequestParam("id") String id) {
		HashMap<String, String> data = new HashMap<String, String>();
		List<ThongTinVeThangDetail> thongTinVeThangDetails = monthlyInformationDetailService
				.getDataByMaxNgayHetHan(Integer.valueOf(id));
		ThongTinVeThangDetail thongTinVeThangDetail = thongTinVeThangDetails.get(thongTinVeThangDetails.size() - 1);

		Integer maKhachThang = thongTinVeThangDetail.getThongTinVeThang().getMaKhachThang();
		Integer maTuyenXe = thongTinVeThangDetail.getThongTinVeThang().getMaTuyenXe();
		Integer maVeThang = thongTinVeThangDetail.getMaVeThang();
		Integer maGiaThang = thongTinVeThangDetail.getMaGiaThang();
		Date ngayHetHan = thongTinVeThangDetail.getNgayHetHan();

		data.put("maKhachThang", String.valueOf(maKhachThang));
		data.put("maTuyenXe", String.valueOf(maTuyenXe));
		data.put("maVeThang", String.valueOf(maVeThang));
		data.put("maGiaThang", String.valueOf(maGiaThang));
		data.put("ngayHetHan", String.valueOf(ngayHetHan));
		return data;
	}

	// Thêm vé tháng cho khách hàng đã tồn tại
	@RequestMapping(value = "add-exist-monthly")
	public String addExistMonthly(
			@ModelAttribute("monthly-information-detail") ThongTinVeThangDetail thongTinVeThangDetail,
			@RequestParam("ngayMua") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayMua, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		HttpSession session = request.getSession();
		TaiKhoan tkSession = (TaiKhoan) session.getAttribute("taiKhoan");
		Date ngayHetHan = getLastDayOfMonth(thongTinVeThangDetail.getNgayMua());
		thongTinVeThangDetail.setNgayHetHan(ngayHetHan);
		thongTinVeThangDetail.setAddNewBy(tkSession.getMaTaiKhoan());
		thongTinVeThangDetail.setAddNewDate(ngayMua);
		String message;
		if (checkGiaVeThang(thongTinVeThangDetail.getMaGiaThang().toString())) {
			message = "error";
		} else {
			try {
				monthlyInformationDetailService.save(thongTinVeThangDetail);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/monthly-information";
	}

	// thông tin danh sách vé tháng theo mavethang
	@RequestMapping(value = "/monthly-information-detail")
	public ModelAndView monthlyInformationDetailByMaVeThang(@RequestParam("mavethang") String maVeThang) {
		ModelAndView mav = new ModelAndView("admin/monthly-information-detail");
		List<ThongTinVeThangDetail> listThongTinVeThangDetails = monthlyInformationDetailService
				.getThongTinVeThangDetailByMaVeThang(Integer.valueOf(maVeThang));
		mav.addObject("listThongTinVeThangDetails", listThongTinVeThangDetails);
		mav.addObject("active", "monthly-information");
		return mav;
	}

	// Giá Vé Tháng
	@RequestMapping(value = "/monthly-price", method = RequestMethod.GET)
	public ModelAndView monthlyPricePage() {
		ModelAndView mav = new ModelAndView("admin/monthly-price");
		List<GiaVeThang> listGiaVeThangs = monthlyTicketPriceService.listAll();
		List<CheDo> listCheDos = modeService.listAll();
		mav.addObject("listCheDos", listCheDos);
		mav.addObject("listGiaVeThangs", listGiaVeThangs);
		return mav;
	}

	// Role
	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public ModelAndView rolePage() {
		ModelAndView mav = new ModelAndView("admin/role");
		List<Role> listRoles = roleService.listAll();
		mav.addObject("listRoles", listRoles);
		mav.addObject("active", "role");
		return mav;
	}

	// Add a new role
	public void autoCreateTimeTable(int maTuyen) {
		TuyenXe tuyenXe = routeService.get(maTuyen);
		LocalTime gioBatDauTuyenXe = tuyenXe.getThoiGianBatDau();
		LocalTime gioKetThucTuyenXe = tuyenXe.getThoiGianKetThuc();

		while (tuyenXe.getThoiGianBatDau().compareTo(gioKetThucTuyenXe) <= 0) {
			System.out.println(" gio bat dau" + tuyenXe.getThoiGianBatDau());
			ChuyenXe chuyenXe = new ChuyenXe();
			chuyenXe.setMaTuyen(maTuyen);
			chuyenXe.setGioXuatPhat(tuyenXe.getThoiGianBatDau());
			chuyenXe.setGioKetThuc(tuyenXe.getThoiGianBatDau().plusMinutes(tuyenXe.getThoiGianChuyen()));
			tripService.save(chuyenXe);
			tuyenXe.setThoiGianBatDau(tuyenXe.getThoiGianBatDau().plusMinutes(tuyenXe.getThoiGianNghi()));
		}

	}

	// check role
	public boolean checkRole(String maRole) {
		List<Role> listRoles = roleService.listAll();
		for (int i = 0; i < listRoles.size(); i++) {
			if (listRoles.get(i).getMaRole().equals(maRole)) {
				System.out.println("co role roi");
				return true;
			}
		}
		return false;
	}

	@RequestMapping(value = "add-role", method = RequestMethod.POST)
	public String addRoute(@ModelAttribute("role") Role role, RedirectAttributes redirectAttributes) {
		String message;

		if (checkRole(role.getMaRole())) {
			message = "error";
		} else {
			try {
				roleService.save(role);
				message = "success";

			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/role";
	}

	// Edit a role
	@RequestMapping(value = "/edit-role")
	public @ResponseBody Role postRoleData(@RequestParam("marole") String maRole) {
		Role role = roleService.get(maRole);

		return role;
	}

	// delete a role
	@RequestMapping(value = "delete-role", method = RequestMethod.POST)
	public String deleteRole(@RequestParam("maRole") String maRole, RedirectAttributes redirectAttributes) {
		String message;
		try {
			roleService.delete(maRole);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/role";
	}

	// update a role after edit
	@RequestMapping(value = "/update-role", method = RequestMethod.POST)
	public String saveRole(@ModelAttribute("role") Role role, RedirectAttributes redirectAttributes) {
		String message;
		try {
			roleService.save(role);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "role");
		return "redirect:/admin/role";
	}

	// tuyen xe
	@RequestMapping(value = "/route", method = RequestMethod.GET)
	public ModelAndView routePage() {
		ModelAndView mav = new ModelAndView("admin/route");
		List<TuyenXe> listTuyenXes = routeService.listAll();

		mav.addObject("listTuyenXes", listTuyenXes);
		mav.addObject("active", "route");

		return mav;
	}

	@RequestMapping(value = "/edit-route")
	public @ResponseBody TuyenXe postRouteData(@RequestParam("matuyen") String matuyen) {

		TuyenXe tuyenXe = routeService.get(Integer.parseInt(matuyen));

		return tuyenXe;
	}

	// update route after edit
	@RequestMapping(value = "/update-route", method = RequestMethod.POST)
	public String saveRoute(@RequestParam("matuyen") Integer maTuyen, @RequestParam("tentuyen") String tenTuyen,
			@RequestParam("thoigianchuyen") Integer thoiGianChuyen, @RequestParam("thoigiannghi") Integer thoiGianNghi,
			@RequestParam("moctuyen1") String mocTuyen1, @RequestParam("moctuyen2") String mocTuyen2,
			@RequestParam("thoigianbatdau") String thoiGianBatDau,
			@RequestParam("thoigianketthuc") String thoiGianKetThuc, RedirectAttributes redirectAttributes) {

		TuyenXe tuyenXe = new TuyenXe(maTuyen, tenTuyen, thoiGianChuyen, thoiGianNghi, mocTuyen1, mocTuyen2,
				LocalTime.parse(thoiGianBatDau), LocalTime.parse(thoiGianKetThuc));
		String message;
		try {
			routeService.save(tuyenXe);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "route");
		return "redirect:/admin/route";
	}

	// add a new route
	@RequestMapping(value = "/add-route", method = RequestMethod.POST)
	public String addRoute(@ModelAttribute TuyenXe tuyenXe, @RequestParam("thoigianbatdau") String thoiGianBatDauStr,
			@RequestParam("thoigianketthuc") String thoiGianKetThucStr, RedirectAttributes redirectAttributes) {
		String message = "";
		tuyenXe.setThoiGianBatDau(LocalTime.parse(thoiGianBatDauStr));
		tuyenXe.setThoiGianKetThuc(LocalTime.parse(thoiGianKetThucStr));

		System.out.println(tuyenXe.getThoiGianBatDau());
		System.out.println(tuyenXe.getThoiGianKetThuc());
		try {
			routeService.save(tuyenXe);
			System.out.println("id tuyen: " + tuyenXe.getMaTuyen());
			autoCreateTimeTable(tuyenXe.getMaTuyen());
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}

		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/route";
	}

	// delete a route
	@RequestMapping(value = "delete-route", method = RequestMethod.POST)
	public String deleteRoute(@RequestParam("maTuyen") int maTuyen, RedirectAttributes redirectAttributes) {
		String message;
		try {
			routeService.delete(maTuyen);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "route");
		return "redirect:/admin/route";
	}

	// Nhân viên
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public ModelAndView staffPage() {
		ModelAndView mav = new ModelAndView("admin/staff");
		List<NhanVien> listNhanViens = staffService.listAll();
		mav.addObject("listNhanViens", listNhanViens);
		mav.addObject("active", "staff");
		return mav;
	}

	// Check sdt
	public boolean checkSDT(String sdt, int maNhanVien) {
		List<NhanVien> staff = staffService.listAll();
		for (int i = 0; i < staff.size(); i++) {
			if (maNhanVien == staff.get(i).getMaNhanVien()) {
				continue;
			} else {
				if (sdt.equals(staff.get(i).getSoDienThoai())) {
					return true;
				}
			}
		}
		return false;
	}

	// Check email
	public boolean checkEmail(String email, int maNhanVien) {
		List<NhanVien> staff = staffService.listAll();
		for (int i = 0; i < staff.size(); i++) {
			if (maNhanVien == staff.get(i).getMaNhanVien()) {
				continue;
			} else {
				if (email.equals(staff.get(i).getEmail())) {
					return true;
				}
			}
		}
		return false;
	}

	// Add a new Nhan vien
	@RequestMapping(value = "/add-staff", method = RequestMethod.POST)
	public String addStaff(@ModelAttribute("nhanVien") NhanVien nhanVien, RedirectAttributes redirectAttributes) {
		String message;
		if (checkEmail(nhanVien.getEmail(), 0) || checkSDT(nhanVien.getSoDienThoai(), 0)) {
			message = "error";
		} else {
			try {
				staffService.save(nhanVien);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);

		return "redirect:/admin/staff";
	}

	// Edit a Khach Thang
	@RequestMapping(value = "/edit-staff")
	public @ResponseBody HashMap<String, String> postStaffData(@RequestParam("id") String id) {
		NhanVien nhanVien = staffService.get(Integer.parseInt(id));

		HashMap<String, String> data = new HashMap<String, String>();
		data.put("maNhanVien", String.valueOf(nhanVien.getMaNhanVien()));
		data.put("hoTen", nhanVien.getHoTen());
		data.put("namSinh", String.valueOf(nhanVien.getNamSinh()));
		data.put("soDienThoai", nhanVien.getSoDienThoai());
		data.put("email", nhanVien.getEmail());
		data.put("gioiTinh", String.valueOf(nhanVien.isGioiTinh()));
		return data;
	}

	// update a staff after edit
	@RequestMapping(value = "/update-staff", method = RequestMethod.POST)
	public String saveStaff(@ModelAttribute("nhanVien") NhanVien nhanVien, RedirectAttributes redirectAttributes) {
		String message = "";
		List<NhanVien> staff = staffService.listAll();
		for (int i = 0; i < staff.size(); i++) {
			if (nhanVien.getMaNhanVien() == staff.get(i).getMaNhanVien()) {
				continue;
			} else {
				if (checkEmail(nhanVien.getEmail(), nhanVien.getMaNhanVien())
						|| checkSDT(nhanVien.getSoDienThoai(), nhanVien.getMaNhanVien())) {
					message = "error";
					redirectAttributes.addFlashAttribute("message", message);
					return "redirect:/admin/staff";
				} else {
					try {
						staffService.save(nhanVien);
						message = "success";
					} catch (Exception e) {
						// TODO: handle exception
						message = "error";
					}
					redirectAttributes.addFlashAttribute("message", message);
					return "redirect:/admin/staff";
				}
			}
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/staff";
	}

	// delete staff
	@RequestMapping(value = "delete-staff", method = RequestMethod.POST)
	public String deleteStaff(@RequestParam("maNhanVien") Integer maNhanVien, RedirectAttributes redirectAttributes) {
		String message = "";
		try {
			staffService.delete(maNhanVien);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "staff");
		return "redirect:/admin/staff";
	}

	// Thông tin vé lượt
	@RequestMapping(value = "/ticket-information", method = RequestMethod.GET)
	public ModelAndView ticketInformatuonPage() {
		ModelAndView mav = new ModelAndView("admin/ticket-information");
		List<ThongTinVeLuot> listThongTinVeLuots = ticketInformationService.listAll();
		mav.addObject("listThongTinVeLuots", listThongTinVeLuots);
		return mav;
	}

	// Giá Vé Lượt
	@RequestMapping(value = "/price-ticket", method = RequestMethod.GET)
	public ModelAndView singleTicketPage() {
		ModelAndView mav = new ModelAndView("admin/price-ticket");
		List<GiaVeLuot> listGiaVeLuots = ticketPriceService.listAll();
		List<CheDo> listCheDos = modeService.listAll();
		mav.addObject("listCheDos", listCheDos);
		mav.addObject("listGiaVeLuots", listGiaVeLuots);
		return mav;
	}

	// check Mode
	public boolean checkMode(String maMode) {
		List<CheDo> tx = modeService.listAll();

		for (int i = 0; i < tx.size(); i++) {
			if (maMode.equals(tx.get(i).getMaCheDo())) {
				return false;
			}
		}
		System.out.println("khong co ma che do!!!");
		return true;
	}

//	check gia
	public boolean checkGia(BigDecimal giaVe) {
		if (giaVe.intValue() < 0) {
			System.out.println("Gia ve < 0");
			return true;
		}
		return false;
	}

	// add gia ve luot
	@RequestMapping(value = "add-price-ticket", method = RequestMethod.POST)
	public String addPriceTicket(@RequestParam("machedo") String maCheDo, @RequestParam("giaveluot") BigDecimal giaVe,
			@RequestParam("thoigianapdung") @DateTimeFormat(pattern = "yyyy-MM-dd") Date thoiGianApDung,
			RedirectAttributes redirectAttributes) {
		String message;
		if (checkMode(maCheDo) || checkGia(giaVe)) {
			message = "error";
		} else {
			try {
				GiaVeLuot giaVeLuot = new GiaVeLuot(0, maCheDo, giaVe, thoiGianApDung);
				ticketPriceService.save(giaVeLuot);
				message = "success";

			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/price-ticket";
	}

	// add gia ve tháng
	@RequestMapping(value = "add-monthly-price", method = RequestMethod.POST)
	public String addMonthlyPrice(@RequestParam("machedo") String maCheDo, @RequestParam("giavethang") BigDecimal giaVe,
			@RequestParam("thoigianapdung") @DateTimeFormat(pattern = "yyyy-MM-dd") Date thoiGianApDung,
			RedirectAttributes redirectAttributes) {
		String message;
		System.out.println(maCheDo);
		if (checkMode(maCheDo) || checkGia(giaVe)) {
			message = "error";
		} else {
			try {
				GiaVeThang giaVeThang = new GiaVeThang(0, giaVe, maCheDo, thoiGianApDung);
				monthlyTicketPriceService.save(giaVeThang);
				message = "success";

			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/monthly-price";
	}

	// edit gia ve luot
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/edit-price-ticket")
	public @ResponseBody GiaVeLuot postPriceTicketData(@RequestParam("magia") String magia) {
		GiaVeLuot giaVeLuot = ticketPriceService.get(Integer.parseInt(magia));

		// giaVeLuot.getThoiGianApDung().toLocaleString();
		System.out.println("Gia Ve Luot: " + giaVeLuot.getThoiGianApDung());
		return giaVeLuot;
	}

	// delete a gia ve luot
	@RequestMapping(value = "delete-price-ticket", method = RequestMethod.POST)
	public String deletePriceTicket(@RequestParam("maGia") Integer maGia, RedirectAttributes redirectAttributes) {
		String message;
		System.out.println("id xoas:" + maGia);
		try {
			ticketPriceService.delete(maGia);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "price-ticket");
		return "redirect:/admin/price-ticket";
	}

	// update route after edit
	@RequestMapping(value = "/update-price-ticket", method = RequestMethod.POST)
	public String savePriceTicket(@RequestParam("magia") Integer maGia, @RequestParam("machedo") String maCheDo,
			@RequestParam("giave") BigDecimal giaVe,
			@RequestParam("thoigianapdung") @DateTimeFormat(pattern = "yyyy-MM-dd") Date thoiGianApDung,
			RedirectAttributes redirectAttributes) throws ParseException {
		GiaVeLuot giaVeLuot = new GiaVeLuot(maGia, maCheDo, giaVe, thoiGianApDung);
		String message;
		if (checkMode(maCheDo) || checkGia(giaVe)) {
			message = "error";
		} else {
			try {
				ticketPriceService.save(giaVeLuot);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}

		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "price-ticket");
		return "redirect:/admin/price-ticket";
	}

	// edit gia ve thang
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/edit-monthly-price")
	public @ResponseBody GiaVeThang postMonthlyTicketData(@RequestParam("magia") String magia) {
		GiaVeThang giaVeThang = monthlyTicketPriceService.get(Integer.parseInt(magia));

		// giaVeLuot.getThoiGianApDung().toLocaleString();
		System.out.println("Gia Ve Tháng: " + giaVeThang.getThoiGianApDung());
		return giaVeThang;
	}

	// update monthly price after edit
	@RequestMapping(value = "/update-monthly-price", method = RequestMethod.POST)
	public String saveMonthlyPrice(@RequestParam("magia") Integer maGia, @RequestParam("machedo") String maCheDo,
			@RequestParam("giave") BigDecimal giaVe,
			@RequestParam("thoigianapdung") @DateTimeFormat(pattern = "yyyy-MM-dd") Date thoiGianApDung,
			RedirectAttributes redirectAttributes) throws ParseException {
		GiaVeThang giaVeThang = new GiaVeThang(maGia, giaVe, maCheDo, thoiGianApDung);
		String message;
		if (checkMode(maCheDo) || checkGia(giaVe)) {
			message = "error";
		} else {
			try {
				monthlyTicketPriceService.save(giaVeThang);
				message = "success";
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "monthly-price");
		return "redirect:/admin/monthly-price";
	}

	// delete a gia ve thang
	@RequestMapping(value = "delete-monthly-price", method = RequestMethod.POST)
	public String deleteMonthlyPrice(@RequestParam("maGia") Integer maGia, RedirectAttributes redirectAttributes) {
		String message;
		System.out.println("id xoas:" + maGia);
		try {
			monthlyTicketPriceService.delete(maGia);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "monthly-price");
		return "redirect:/admin/monthly-price";
	}

	// Chuyến đi
	@RequestMapping(value = "/trip", method = RequestMethod.GET)
	public ModelAndView tripPage() {
		ModelAndView mav = new ModelAndView("admin/trip");
		List<ChuyenXe> listChuyenXes = tripService.listAll();
		List<TuyenXe> listTuyenXes = routeService.listAll();

		mav.addObject("listChuyenXes", listChuyenXes);
		mav.addObject("listTuyenXes", listTuyenXes);
		return mav;
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

	public boolean checkGio(int maTuyen, LocalTime gioBatDau) {
		TuyenXe tuyenXe = routeService.get(maTuyen);
		if (gioBatDau.compareTo(tuyenXe.getThoiGianBatDau()) < 0
				|| gioBatDau.compareTo(tuyenXe.getThoiGianKetThuc()) > 0) {
			System.out.println("Sai thoi gian");
			return true;
		}
		return false;

	}

	public void timeTableTuyen(int maTuyen) {
		TuyenXe tuyenXe = routeService.get(maTuyen);
		LocalTime gioBatDau = tuyenXe.getThoiGianBatDau();
		LocalTime gioKetThuc = tuyenXe.getThoiGianKetThuc();

	}
	// add a new trip
	/*
	 * @RequestMapping(value = "add-trip", method = RequestMethod.POST) public
	 * String addTrip(@RequestParam("maTuyen") int maTuyen, RedirectAttributes
	 * redirectAttributes) { String message="";
	 * if(checkRoute(Integer.valueOf(maTuyen).toString())) {
	 * System.out.println("Chua ton tai tuyen"); message="error"; }else {
	 * 
	 * }
	 * 
	 * // // if(checkRoute(String.valueOf(maTuyen))||
	 * checkGio(maTuyen,LocalTime.parse(gioXuatphat))) { // message="error"; //
	 * }else { // ChuyenXe chuyenXe = new ChuyenXe(); //
	 * chuyenXe.setMaTuyen(maTuyen); //
	 * chuyenXe.setGioXuatPhat(LocalTime.parse(gioXuatphat)); //
	 * chuyenXe.setGioKetThuc(LocalTime.parse(gioXuatphat).plusMinutes(routeService.
	 * get(maTuyen).getThoiGianChuyen())); // try { // tripService.save(chuyenXe);
	 * // message = "success"; // } catch (Exception e) { // // TODO: handle
	 * exception // message = "error"; // } // } //
	 * redirectAttributes.addFlashAttribute("message", message); //
	 * redirectAttributes.addFlashAttribute("active", "trip"); return
	 * "redirect:/admin/trip"; return null; }
	 */

	// edit a trip
	@RequestMapping(value = "/edit-trip")
	public @ResponseBody ChuyenXe postTripData(@RequestParam("id") String id) {

		ChuyenXe chuyenXe = tripService.get(Integer.parseInt(id));
		System.out.println(chuyenXe.getGioKetThuc());
		return chuyenXe;
	}

	// update trip after edit
	@RequestMapping(value = "/update-trip", method = RequestMethod.POST)
	public String saveTrip(@RequestParam("id") String id, @RequestParam("maTuyen") String maTuyen,
			@RequestParam("gioXuatPhat") String gioXuatPhatStr, RedirectAttributes redirectAttributes) {

		ChuyenXe chuyenXe = new ChuyenXe(Integer.valueOf(id), LocalTime.parse(gioXuatPhatStr), LocalTime
				.parse(gioXuatPhatStr).plusMinutes(routeService.get(Integer.valueOf(maTuyen)).getThoiGianChuyen()),
				Integer.valueOf(maTuyen));
		String message;
		try {
			tripService.save(chuyenXe);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "trip");
		return "redirect:/admin/trip";
	}

	// delete a trip
	@RequestMapping(value = "delete-trip", method = RequestMethod.POST)
	public String deleteTrip(@RequestParam("id") Integer id, RedirectAttributes redirectAttributes) {
		String message;
		System.out.println("id xoas:" + id);
		try {
			tripService.delete(id);
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("active", "route");
		return "redirect:/admin/trip";
	}

	// Phân công
	@RequestMapping(value = "/assign", method = RequestMethod.GET)
	public ModelAndView assignPage() {
		ModelAndView mav = new ModelAndView("admin/assign");
		List<PhanCong> listPhanCongs = phanCongService.listAll();
		List<ChuyenXe> listChuyenXes = tripService.listAll();
		List<NhanVien> listNhanViens = staffService.listAll();
		List<Xe> listXes = busService.listAll();

		mav.addObject("listXes", listXes);
		mav.addObject("listNhanViens", listNhanViens);
		mav.addObject("listChuyenXes", listChuyenXes);
		mav.addObject("listPhanCongs", listPhanCongs);
		mav.addObject("active", "assign");
		return mav;
	}

	public boolean checkPhanCong(int maNhanVien, String xe, Date ngayBatDau) {
		List<PhanCong> phanCongs = phanCongService.listAll();
		for (int i = 0; i < phanCongs.size(); i++) {
			if (maNhanVien == phanCongs.get(i).getMaNhanVien() && ngayBatDau.compareTo(phanCongs.get(i).getNgay()) == 0
					|| xe.equals(phanCongs.get(i).getBienSoXe())
							&& ngayBatDau.compareTo(phanCongs.get(i).getNgay()) == 0) {
				return true;
			}
		}
		return false;
	}

	// add a new assignment
	@RequestMapping(value = "/add-assign", method = RequestMethod.POST)
	public String addAssign(@RequestParam("maNhanVien") int maNhanVien, @RequestParam("bienSoXe") String bienSoXe,
			@RequestParam("ngay") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngay,
			RedirectAttributes redirectAttributes) {
		String message = "";
		if (checkPhanCong(maNhanVien, bienSoXe, ngay)) {
			message = "error";
		} else {
			PhanCong phanCong = new PhanCong();
			phanCong.setMaNhanVien(maNhanVien);
			phanCong.setBienSoXe(bienSoXe);
			phanCong.setNgay(ngay);

			try {
				phanCongService.save(phanCong);
				message = "success";
				List<GiaVeLuot> giaVeLuots = ticketPriceService.listAll();
				for (int i = 0; i < giaVeLuots.size(); i++) {
					System.out.println("vao day 2");
					ThongTinVeLuot thongTinVeLuot = new ThongTinVeLuot();
					thongTinVeLuot.setMaPhanCong(phanCong.getIdPhanCong());
					thongTinVeLuot.setMaGiaLuot(giaVeLuots.get(i).getMaGia());
					thongTinVeLuot.setSoLuong(0);
					try {
						ticketInformationService.save(thongTinVeLuot);
						message = "success";
					} catch (Exception e) {
						// TODO: handle exception
						message = "error"; // vao meet đi
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				message = "error";
			}
		}
		redirectAttributes.addFlashAttribute("message", message);

		return "redirect:/admin/assign";
	}

	// edit assignment
	@RequestMapping(value = "/edit-assign", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> addAssign(@RequestParam("id") String id) {

		HashMap<String, String> dataHashMap = new HashMap<String, String>();

		PhanCong phanCong = phanCongService.get(Integer.valueOf(id));
		dataHashMap.put("idphanCong", String.valueOf(phanCong.getIdPhanCong()));
		dataHashMap.put("maNhanVien", String.valueOf(phanCong.getMaNhanVien()));
		dataHashMap.put("bienSoXe", String.valueOf(phanCong.getBienSoXe()));
		dataHashMap.put("ngay", String.valueOf(phanCong.getNgay()));

		return dataHashMap;

	}

	// update assignment after edit
	@RequestMapping(value = "/update-assign", method = RequestMethod.POST)
	public String saveAssign(@RequestParam("idPhanCong") String idPhanCong, @RequestParam("maChuyenXe") int maChuyenXe,
			@RequestParam("maNhanVien") int maNhanVien, @RequestParam("bienSoXe") String bienSoXe,
			@RequestParam("ngay") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngay,
			RedirectAttributes redirectAttributes) {
		System.out.println("here");
		PhanCong ctChuyen = new PhanCong();
		ctChuyen.setIdPhanCong(Integer.valueOf(idPhanCong));
		ctChuyen.setMaNhanVien(maNhanVien);
		ctChuyen.setBienSoXe(bienSoXe);
		ctChuyen.setNgay(ngay);
		String message;
		try {
			phanCongService.save(ctChuyen);
			;
			message = "success";
		} catch (Exception e) {
			// TODO: handle exception
			message = "error";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/admin/assign";
	}

	// delete a role
//	@RequestMapping(value = "delete-assign", method = RequestMethod.POST)
//	public String deleteAssign(@RequestParam("idCTChuyen") int idCTChuyen, RedirectAttributes redirectAttributes) {
//		String message;
//		System.out.println("id" + idCTChuyen);
//		try {
//			detailTripService.delete(idCTChuyen);
//			message = "success";
//		} catch (Exception e) {
//			// TODO: handle exception
//			message = "error";
//		}
//		redirectAttributes.addFlashAttribute("message", message);
//		return "redirect:/admin/assign";
//	}

	// Thống kê vé lượt
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboardPage(@RequestParam(value = "kind", required = false) String kind,
			@RequestParam(value = "from", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date fromDate,
			@RequestParam(value = "to", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date toDate) {
		ModelAndView mav = new ModelAndView("admin/dashboard");

		if (kind == null)
			kind = "luot";
		// when have not fromDate and toDate
		// default value = current date
		if (fromDate == null || toDate == null) {
			if (kind.equals("luot")) {
				try {
					// get current date
					Date date = new Date();
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
					String strDate = formatter.format(date);
					Date date1 = new SimpleDateFormat("yyyy/MM/dd").parse(strDate);
					List<PhanCong> listPhanCongs = phanCongService.listAll();
					PhanCong p = new PhanCong();
					for (PhanCong i : listPhanCongs) {
						if (i.getNgay().compareTo(date1) == 0) {
							p = i;
							break;
						}
					}

					List<ThongTinVeLuot> listThongTinVeLuots = ticketInformationService
							.getDataByMaPhanCong(p.getIdPhanCong());

					mav.addObject("phancong", p);
					mav.addObject("listThongTinVeLuots", listThongTinVeLuots);
					mav.addObject("tab", "luot");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (kind.equals("thang")) {
				try {
					// get current date
					Date date = new Date();
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
					String strDate = formatter.format(date);
					Date date1 = new SimpleDateFormat("yyyy/MM/dd").parse(strDate);

					List<ThongTinVeThangDetail> listThongTinVeThangDetails = monthlyInformationDetailService
							.getDataByDate(date1);

					mav.addObject("listThongTinVeThangDetails", listThongTinVeThangDetails);

					mav.addObject("tab", "thang");

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}
		// when have fromDate and toDate
		else {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			String fromDateStr = formatter.format(fromDate);
			String toDateStr = formatter.format(toDate);
			String fromDateStr2 = formatter2.format(fromDate);
			String toDateStr2 = formatter2.format(toDate);

			if (kind.equals("luot")) {

				try {
					Date newFromDate = new SimpleDateFormat("yyyy/MM/dd").parse(fromDateStr);
					Date newToDate = new SimpleDateFormat("yyyy/MM/dd").parse(toDateStr);

					List<PhanCong> listPhanCongs = phanCongService.listAll(); // lấy tất cả phân công ra
					List<Integer> listIdPhanCongs = new ArrayList<Integer>();// list mã phân công có trong ngày bd và
																				// ngày
																				// kt
					for (PhanCong p : listPhanCongs) {
						if (p.getNgay().compareTo(newFromDate) >= 0 && p.getNgay().compareTo(newToDate) <= 0) {
							listIdPhanCongs.add(p.getIdPhanCong());
						}
					}
					List<ThongTinVeLuot> listThongTinVeLuots = new ArrayList<ThongTinVeLuot>();

					for (Integer index : listIdPhanCongs) {
						List<ThongTinVeLuot> listTemp = ticketInformationService.getDataByMaPhanCong(index);
						for (ThongTinVeLuot t : listTemp) {
							listThongTinVeLuots.add(t);
						}
					}

					mav.addObject("listThongTinVeLuots", listThongTinVeLuots);
					mav.addObject("tab", "luot");
					mav.addObject("fromDate", fromDateStr2);
					mav.addObject("toDate", toDateStr2);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (kind.equals("thang")) {

				try {
					Date newFromDate = new SimpleDateFormat("yyyy/MM/dd").parse(fromDateStr);
					Date newToDate = new SimpleDateFormat("yyyy/MM/dd").parse(toDateStr);

					List<ThongTinVeThangDetail> listThongTinVeThangDetails = monthlyInformationDetailService
							.getDataByDateToDate(newFromDate, newToDate);

					mav.addObject("listThongTinVeThangDetails", listThongTinVeThangDetails);
					mav.addObject("tab", "thang");
					mav.addObject("fromDate", fromDateStr2);
					mav.addObject("toDate", toDateStr2);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		mav.addObject("active", "dashboard");

		return mav;
	}

	// Thông tin vé lượt
	@RequestMapping(value = "/information-ticket", method = RequestMethod.GET)
	public ModelAndView informationTicketPage() {
		ModelAndView mav = new ModelAndView("admin/ticket-information");
		List<ThongTinVeLuot> listThongTinVeLuots = ticketInformationService.listAll();
		mav.addObject("listThongTinVeLuots", listThongTinVeLuots);
		return mav;
	}

	@RequestMapping(value = "/get-data-by-date")
	public @ResponseBody HashMap<String, List<ThongTinVeLuot>> getDataByDate(
			@RequestParam(value = "date", required = false) String dateStr) {
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, List<ThongTinVeLuot>> data = new HashMap<String, List<ThongTinVeLuot>>();
		List<ThongTinVeLuot> listThongTinVeLuots = new ArrayList<ThongTinVeLuot>();

		// have no parameter
		// default value = current date
		if (dateStr == null) {
			Date currentDate = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(currentDate);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - 1;

			Date dateStart = new Date(currentDate.getTime() - dayOfWeek * ONE_DAY);
			Date dateEnd = new Date(dateStart.getTime() + 6 * ONE_DAY);
			listThongTinVeLuots = ticketInformationService.listAll();
			data.put("data", listThongTinVeLuots);
		} else {
			try {
				Date dateIn;
				dateIn = formatter1.parse(dateStr);
				Calendar cal = Calendar.getInstance();
				cal.setTime(dateIn);
//				if (date2Str.equals("")) {
				System.out.println("rong");
				// lấy ra ngày đầu tiên của tuần
				int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - 1;
				Date dateStart = new Date(dateIn.getTime() - dayOfWeek * ONE_DAY);
				Date dateEnd = new Date(dateStart.getTime() + 6 * ONE_DAY);

				List<PhanCong> listPhanCongs = phanCongService.listAll(); // lấy tất cả phân công ra
				List<Integer> listIdPhanCongs = new ArrayList<Integer>();// list mã phân công có trong ngày bd và ngày
																			// kt
				for (PhanCong p : listPhanCongs) {
					if (p.getNgay().compareTo(dateStart) >= 0 && p.getNgay().compareTo(dateEnd) <= 0) {
						listIdPhanCongs.add(p.getIdPhanCong());
					}
				}

				for (Integer index : listIdPhanCongs) {
					List<ThongTinVeLuot> listTemp = ticketInformationService.getDataByMaPhanCong(index);
					for (ThongTinVeLuot t : listTemp) {
						listThongTinVeLuots.add(t);
					}
				}

				data.put("data", listThongTinVeLuots);

//				} 
//				else {
//					System.out.println("co");
//					Date dateIn2 = formatter1.parse(date2Str);
//					cal.setTime(dateIn2);
//					Date dateStart = new Date(dateIn.getTime());
//					Date dateEnd = new Date(dateIn2.getTime());
//					listThongTinVeLuots = ticketInformationService.listAll();
//					data.put("data", listThongTinVeLuots);
//					for (ThongTinVeLuot i : listThongTinVeLuots) {
//						System.out.println(listThongTinVeLuots);
//					}
//				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		return data;
	}

	// lấy ra thông tin vé tháng detail của 12 tháng
	@RequestMapping(value = "/get-data-by-month")
	public @ResponseBody HashMap<String, Integer> getDataByMonth() {

		HashMap<String, Integer> data = new HashMap<String, Integer>();
		for (int i = 1; i <= 12; i++) {
			List<ThongTinVeThangDetail> listThongTinVeThangDetails = monthlyInformationDetailService.getDataByMonth(i);
			data.put("Tháng " + i, listThongTinVeThangDetails.size());
		}
		return data;
	}

	// Profile
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public ModelAndView profilePage(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/profile");
		TaiKhoan account = (TaiKhoan) session.getAttribute("taiKhoan");
		mav.addObject("account", account);
		return mav;
	}

	@RequestMapping("banve-luot")
	public ModelAndView banVeLuotPage() {

		ModelAndView mav = new ModelAndView("admin/post");

		mav.addObject("active", "seller");
		return mav;
	}

	@RequestMapping("banve-thang")
	public ModelAndView banVeThangPage() {
		ModelAndView mav = new ModelAndView("admin/ban-ve-thang");
		mav.addObject("active", "seller");
		return mav;
	}

}
