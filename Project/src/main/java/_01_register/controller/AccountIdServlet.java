package _01_register.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;
import _01_register.model.AccountBean;
import _01_register.model.AccountService;
import _01_register.model.dao.AccountDAOHibernate;

@WebServlet("/pages/_01_register/account.view")
public class AccountIdServlet extends HttpServlet {
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
		String method = request.getMethod();
		String action = request.getParameter("action");
		if(action!=null && action.equals("textText")) {
			this.textText(request, response);
		} else {
			throw new ServletException("使用GET呼叫必須輸入action參數值：textText");
		}
	}
	private void textText(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder output = new StringBuilder();
		String account = request.getParameter("account");
		if(account==null || account.trim().length()==0) {
			output.append("請輸入帳號");
		}
		if(output!=null && output.length()!=0) {
			out.print(output);
			out.close();
			return;
		}
		
		AccountBean result = service.selectByAccount(account);
		if(result != null) {
			output.append("此帳號已存在，請更換帳號");
		}
		out.print(output);
		out.close();
		return;
	}

}
