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
import _01_register.model.AccountService;
import _01_register.model.dao.AccountDAOHibernate;

@WebServlet("/secure/_02_login/member.do")
public class MemberDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	private AccountService service;
	
	@Override
	public void init() throws ServletException {
		AccountDAOHibernate dao = new AccountDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new AccountService();
		service.setDao(dao);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getRemoteUser();
		
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		Map<String, String> error = new HashMap<String, String>(); // 準備存放錯誤訊息的Map物件
		request.setAttribute("error", error); // 顯示錯誤訊息
		
		String sid = request.getParameter("id");
		String newpassw = request.getParameter("newpassw");
		String checkpassw = request.getParameter("checkpassw");
		String name = request.getParameter("name");
		String idc = request.getParameter("idc");   // hidden
		String email = request.getParameter("email");
		String area_phone = request.getParameter("area_phone");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		String prodaction = request.getParameter("prodaction");
		
		String passw = service.selectPasswByAccount(account);
		
		if(prodaction == null || prodaction.trim().length() == 0){
			AccountBean result = service.selectByAccount(account);
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			response.sendRedirect("memberPersonalDataPage.jsp");
			return;
		}
		
		if("送出修改".equals(prodaction)){
			if(newpassw != null && newpassw.trim().length() != 0){
				passw = newpassw;
				if (!newpassw.trim().equals(checkpassw.trim())) {
					error.put("checkpassw", "更改密碼欄必須與新密碼確認欄一致");
					error.put("newpassw", "*");
				}
			}
			if(checkpassw != null && checkpassw.trim().length() != 0){
				if (!newpassw.trim().equals(checkpassw.trim())) {
					error.put("checkpassw", "更改密碼欄必須與新密碼確認欄一致");
					error.put("newpassw", "*");
				}
			}
			if (email == null || email.trim().length() == 0) {
				error.put("email", "請輸入電子郵件");
			} else {
				
				if(!service.isValidEmail(email)){
					error.put("email", "電子郵件格式不符");
				}
			}
			
			// 如果有錯誤
			if (!error.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				request.getRequestDispatcher("memberPersonalDataPage.jsp").forward(request, response);
				return;
			}
			
			AccountBean bean = new AccountBean();
			if(sid != null && sid.trim().length() != 0){
				Integer id = Integer.parseInt(sid);			
				bean.setId(id);
			}
			bean.setAccount(account);
			bean.setPassw(passw);
			bean.setName(name);
			bean.setIdc(idc);
			bean.setEmail(email);
			bean.setArea_phone(area_phone);
			bean.setPhone(phone);
			bean.setAddress(address);
			
			AccountBean result = service.updateAccount(bean);
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			response.sendRedirect("memberUpdSuccess.jsp");
			return;
		}
		
		
		
		

	}

}
