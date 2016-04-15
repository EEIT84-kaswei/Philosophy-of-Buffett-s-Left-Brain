package _02_login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;

import _02_login.model.CustFavoriteBean;
import _02_login.model.CustFavoriteService;
import _02_login.model.dao.CustFavoriteDAOHibernate;
import misc.HibernateUtil;

@WebServlet(
		urlPatterns={"/secure/custFavorite.view"}
		)
public class CustFavoriteServlet extends HttpServlet {
	
	private CustFavoriteService service;
	
	@Override
	public void init() throws ServletException {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		CustFavoriteDAOHibernate dao = new CustFavoriteDAOHibernate();
		dao.setSessionFactory(sessionFactory);
		service = new CustFavoriteService();
		service.setCustFavoriteDAO(dao);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String temp = request.getParameter("stock_Code");
		String account = request.getParameter("account");
		System.out.println("取值 : " + temp +","+account);
		
		//驗證
		if(temp==null || temp.trim().length()==0){
			return;
		}
		
		if(account==null || account.trim().length()==0){
			return;
		}
		
		//轉換
		Integer stock_Code = Integer.valueOf(temp);
		
		//呼叫model
		CustFavoriteBean bean = new CustFavoriteBean();
		bean.setAccount(account);
		bean.setStock_Code(stock_Code);
		CustFavoriteBean result = service.insert(bean);
		
		if(result==null){
			System.out.println("輸入最愛 失敗");
			return;
		}
			System.out.println("輸入最愛 成功");
			return;
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

	
}
