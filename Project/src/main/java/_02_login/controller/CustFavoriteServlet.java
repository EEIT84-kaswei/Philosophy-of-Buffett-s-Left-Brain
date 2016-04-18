package _02_login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import misc.HibernateUtil;

import org.hibernate.SessionFactory;

import _02_login.model.CustFavoriteBean;
import _02_login.model.CustFavoriteService;
import _02_login.model.dao.CustFavoriteDAOHibernate;
import _03_stock_market.model.InstantStockOneBean;
import _03_stock_market.model.InstantStockOneService;
import _03_stock_market.model.InstantStockService;
import _03_stock_market.model.dao.InstantStockOneDAOHibernate;

@WebServlet(
		urlPatterns={"/secure/custFavorite.view"}
		)
public class CustFavoriteServlet extends HttpServlet {
	
	private CustFavoriteService service;
	private InstantStockOneService serviceISO;
	
	@Override
	public void init() throws ServletException {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		CustFavoriteDAOHibernate dao = new CustFavoriteDAOHibernate();
		InstantStockOneDAOHibernate daoISO = new InstantStockOneDAOHibernate();
		dao.setSessionFactory(sessionFactory);
		daoISO.setSessionFactory(sessionFactory);
		service = new CustFavoriteService();
		service.setCustFavoriteDAO(dao);
		serviceISO=new InstantStockOneService();
		serviceISO.setInstantStockOneDAO(daoISO);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取值
		String temp = request.getParameter("stock_Code");
		String account = request.getParameter("account");
		String action = request.getParameter("action");
		System.out.println("取值 : " + temp +","+account);
		System.out.println("要做什麼動作：" + action);
		
		String loginAccount=request.getRemoteUser();
		System.out.println("loginAccount：" + loginAccount);
		//驗證
//		if(temp==null || temp.trim().length()==0){
//			return;
//		}
//		
//		if(account==null || account.trim().length()==0){
//			return;
//		}
		
		//轉換
		CustFavoriteBean bean = new CustFavoriteBean();
		Integer stock_Code=null;
		if(temp!=null){
		stock_Code = Integer.valueOf(temp);
		//呼叫model
		bean.setAccount(account);
		bean.setStock_Code(stock_Code);
		}
		if(loginAccount!=null&&temp==null){
			List<Integer> acf=service.selectByAccount(loginAccount);
			List<InstantStockOneBean> result=new ArrayList<InstantStockOneBean>();
			for(Integer sc:acf){
				result.add(serviceISO.selectOne(sc));
			}
			HttpSession session = request.getSession();
			session.setAttribute("sltAccountCF", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_02_login/personal_stock.jsp");
			
		}else if(action.equals("insert")){
			CustFavoriteBean result = service.insert(bean);
			
				System.out.println("輸入最愛 成功");
				return;
			
		}else if(action.equals("delete")){
			Boolean answer = service.delete(loginAccount, stock_Code);
			if(answer==true){
				System.out.println("刪除最愛成功");
				List<Integer> acf=service.selectByAccount(loginAccount);
				List<InstantStockOneBean> result=new ArrayList<InstantStockOneBean>();
				for(Integer sc:acf){
					result.add(serviceISO.selectOne(sc));
				}
				HttpSession session = request.getSession();
				session.setAttribute("sltAccountCF", result);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_02_login/personal_stock.jsp");
			}else {
				System.out.println("刪除最愛失敗");
				return;
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

	
}
