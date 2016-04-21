package _01_register.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import misc.HibernateUtil;
import _01_register.model.AccountBean;
import _01_register.model.AccountService;
import _01_register.model.dao.AccountDAOHibernate;
import _02_login.model.QuestionBean;
import _04_stock.model.StockCodeBean;
import _04_stock.model.StockCodeService;
import _04_stock.model.dao.StockCodeDAOHibernate;

@WebServlet("/secure/AccountUpdateServlet")
public class AccountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private AccountService service;
     
    public AccountUpdateServlet() {
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		

		request.setCharacterEncoding("UTF-8");
		System.out.println("接收HTML Form資料");
		// 接收HTML Form資料
		String account = request.getRemoteUser();	
		String prodaction = request.getParameter("prodaction");
		
		String passw = "";
		String checkpassw = "";
		String checkpassw2 = "";
		String name = "";
		String idc = "";
		String email = "";
		String area_phone = "";
		String phone = "";
		String address = "";
		
		
		if(prodaction!=null){
		
		 passw = request.getParameter("passw");
		 checkpassw = request.getParameter("checkpassw");
		 checkpassw2 = request.getParameter("checkpassw2");
		 name = request.getParameter("name");
		 idc = request.getParameter("idc");
		 email = request.getParameter("email");
		 area_phone = request.getParameter("area_phone");
		 phone = request.getParameter("phone");
		 address = request.getParameter("address");
		
		
		
		
		
		// 轉換HTML Form資料
		// 驗證HTML Form資料
		if(passw==null||passw.trim().length()==0){
			error.put("passw", "請輸入密碼");
		}if(!service.selectByAccount(account).getPassw().equals(passw)){
			error.put("passw", "與原密碼不相符");
		}if(checkpassw==null||checkpassw.trim().length()==0){
			error.put("checkpassw", "請輸入新密碼");
		}if(checkpassw2==null||checkpassw2.trim().length()==0){
			error.put("checkpassw2", "請再輸入新密碼");
		}if (checkpassw!=null&&checkpassw2!=null&&checkpassw.trim().length() > 0 && checkpassw2.trim().length() > 0) {
			if (!checkpassw.trim().equals(checkpassw2.trim())) {
				error.put("checkpassw", "新密碼欄須再次確認");
				error.put("checkpassw2", "*");
			}
		}if(name==null||name.trim().length()==0){
			error.put("name", "請輸入姓名");
		}if (idc == null || idc.trim().length() == 0) {
			error.put("idc", "請輸入身分證字號");
		} else {
			if(!service.isValidId(idc)){
				error.put("idc", "身分證字號格式不符");
			}
		}if (email == null || email.trim().length() == 0) {
			error.put("email", "請輸入電子郵件");
		} else {
			if(!service.isValidEmail(email)){
				error.put("email", "電子郵件格式不符");
			}
		}
		// 如果有錯誤
		if (!error.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息		
			request.getRequestDispatcher("/secure/_02_login/memberPersonalDataPage.jsp").forward(request, response);
			return;
		}
		}
		// 呼叫Model
		AccountBean bean = new AccountBean();
		bean.setAccount(account);
		bean.setPassw(checkpassw);
		bean.setName(name);
		bean.setIdc(idc);
		bean.setEmail(email);
		bean.setArea_phone(area_phone);
		bean.setPhone(phone);
		bean.setAddress(address);
		
				
	
		
		if(prodaction!=null && prodaction.equals("送出修改")){		
		service.update(bean);
		System.out.println("好像是="+bean);
		String path = request.getContextPath();
		response.sendRedirect(path + "/index.jsp");
		}else{
		AccountBean result = service.selectByAccount(account);
		request.setAttribute("Select", result);
		
		request.getRequestDispatcher("/secure/_02_login/memberPersonalDataPage.jsp").forward(request, response);
		}
	}
	public void init() throws ServletException {
		AccountDAOHibernate dao = new AccountDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new AccountService();
		service.setDao(dao);

	}

}
