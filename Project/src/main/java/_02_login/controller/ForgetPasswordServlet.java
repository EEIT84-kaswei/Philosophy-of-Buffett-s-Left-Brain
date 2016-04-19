package _02_login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import misc.HibernateUtil;
import _01_register.model.AccountBean;
import _01_register.model.dao.AccountDAOHibernate;
import _02_login.model.ForgetPasswordService;

@WebServlet("/pages/_02_login/password.do")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ForgetPasswordService service;	

	@Override
	public void init() throws ServletException {
		AccountDAOHibernate dao = new AccountDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new ForgetPasswordService();
		service.setDao(dao);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		Map<String, String> error = new HashMap<String, String>(); // 準備存放錯誤訊息的Map物件
		request.setAttribute("error", error); // 顯示錯誤訊息
		
		String account = request.getParameter("account");
		
		if (account == null || account.trim().length() == 0) {
			error.put("account", "請輸入您的帳號");
		} else {
			AccountBean result = service.selectByAccount(account);
			if(result == null){
				error.put("account", "此帳號不存在，請重新輸入。");
			}
		}
		
		if (!error.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			request.getRequestDispatcher("login_fgpw.jsp").forward(request, response);
			return;
		}
		
		String email = service.selectEmailByAccount(account);
		if(email != null && email.trim().length() != 0){
			StringBuffer newPassword = service.createNum();
			service.sendNewPasswordMail(newPassword, email);
			if(service.changePassword(account, newPassword)){
				HttpSession session = request.getSession();
				session.setAttribute("changePassword", "新密碼已寄送至您的註冊信箱，請使用新密碼登入。");
			}
			String path = request.getContextPath();
			response.sendRedirect(path + "/pages/_02_login/login.jsp");
			return;
		}
	}

}
