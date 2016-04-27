package _01_register.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import misc.HibernateUtil;
import _01_register.model.AccountBean;
import _01_register.model.AccountService;
import _01_register.model.dao.AccountDAOHibernate;

@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/pages/_01_register/account.do")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
	private AccountService service;
	
	@Override
	public void init() throws ServletException {
		AccountDAOHibernate dao = new AccountDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new AccountService();
		service.setDao(dao);
	}

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		Map<String, String> error = new HashMap<String, String>(); // 準備存放錯誤訊息的Map物件
		request.setAttribute("error", error); // 顯示錯誤訊息
		String account = "";
		String passw = "";
		String checkpassw = "";
		String name = "";
		String idc = "";
		String email = "";
		String area_phone = "";
		String phone = "";
		String address = "";
		String auth = "";
		String prodaction = "";
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart
														// request內所有的parts
		// 由parts != null來判斷此上傳資料是否為HTTP multipart request
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("account")) {
						account = value;
						System.out.println("account = " + account);
					} else if (fldName.equals("passw")) {
						passw = value;
//						System.out.println("passw = " + passw);
					} else if (fldName.equals("checkpassw")) {
						checkpassw = value;
//						System.out.println("checkpassw = " + checkpassw);
					} else if (fldName.equals("name")) {
						name = value;
//						System.out.println("name = " + name);
					} else if (fldName.equals("idc")) {
						idc = value;
//						System.out.println("idc = " + idc);
					} else if (fldName.equals("email")) {
						email = value;
//						System.out.println("email = " + email);
					} else if (fldName.equals("area_phone")) {
						area_phone = value;
//						System.out.println("area_phone = " + area_phone);
					} else if (fldName.equals("phone")) {
						phone = value;
//						System.out.println("phone = " + phone);
					} else if (fldName.equals("address")) {
						address = value;
//						System.out.println("address = " + address);
					} else if (fldName.equals("auth")) {
						auth = value;
//						System.out.println("auth = " + auth);
					} else if (fldName.equals("prodaction")) {
						prodaction = value;
//						System.out.println("prodaction = " + prodaction);
					}
				}
			}
			if (account == null || account.trim().length() == 0) {
				error.put("account", "請輸入帳號");
			}
			if (passw == null || passw.trim().length() == 0) {
				error.put("passw", "請輸入密碼");
			}
			if (checkpassw == null || checkpassw.trim().length() == 0) {
				error.put("checkpassw", "請輸入密碼確認");
			}
			if (passw.trim().length() > 0 && checkpassw.trim().length() > 0) {
				if (!passw.trim().equals(checkpassw.trim())) {
					error.put("checkpassw", "密碼欄必須與確認欄一致");
					error.put("passw", "*");
				}
			}
			if (name == null || name.trim().length() == 0) {
				error.put("name", "請輸入姓名");
			}
			if (idc == null || idc.trim().length() == 0) {
				error.put("idc", "請輸入身分證字號");
			} else {
				if(!service.isValidId(idc)){
					error.put("idc", "身分證字號格式不符");
				}
			}
			if (email == null || email.trim().length() == 0) {
				error.put("email", "請輸入電子郵件");
			} else {
				if(!service.isValidEmail(email)){
					error.put("email", "電子郵件格式不符");
				}
			}
			if (service.accountExists(account)) {
				error.put("account", "此帳號已存在，請更換帳號");
			}
		} else {
			error.put("errTitle", "此表單不是上傳檔案的表單");
		}
		// 如果有錯誤
		if (!error.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			request.getRequestDispatcher("registerPage.jsp").forward(request, response);
			return;
		}

//		if (service.accountExists(account)) {
//			error.put("account", "此帳號已存在，請更換帳號");
//		} else {
			if("寄送認證信".equals(prodaction)){
				StringBuffer number = service.createNum();
				HttpSession session = request.getSession();
				session.setAttribute("number", number);
				System.out.println("number1 = " + number.toString());
				if(service.sendMail(number, email)){
					error.put("auth", "認證碼已送出");
				} else {
					error.put("auth", "認證碼送出失敗");
				}
			} else if ("送出".equals(prodaction)){
				if (auth == null || auth.trim().length() == 0) {
					error.put("auth", "請輸入認證碼");
				} else {
					HttpSession session = request.getSession();
					StringBuffer number = (StringBuffer) session.getAttribute("number");
					System.out.println("number2 = " + number.toString());
					if(number.toString().equals(auth)){
						AccountBean bean = new AccountBean();
						bean.setAccount(account);
						bean.setPassw(passw);
						bean.setName(name);
						bean.setIdc(idc);
						bean.setEmail(email);
						bean.setArea_phone(area_phone);
						bean.setPhone(phone);
						bean.setAddress(address);
						AccountBean result = service.saveAccount(bean);
						System.out.println("result = " + result);
						if(result.getId() != null) {
							session.setAttribute("user", result);
							String path = request.getContextPath();
							response.sendRedirect(path + "/pages/_01_register/registerSuccess.jsp");
							return;
						} else {
							error.put("errTitle", "新增此筆資料有誤");
						}
					} else {
						error.put("auth", "認證碼輸入錯誤,請重新輸入");
					}
				}
			}			
//		}
		// 如果有錯誤
		if (!error.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			request.getRequestDispatcher("registerPage.jsp").forward(request, response);
			return;
		}

		
		
		
		
	}
}
