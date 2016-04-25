package _02_login.controller;

import misc.HibernateUtil;

import org.hibernate.Session;

import _02_login.model.CustFavoriteService;
import _02_login.model.SpecialFunctionService;
import _04_stock.model.StockCodeService;

public class StockAnalysServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private SpecialFunctionService functionService;
	private CustFavoriteService favoriteService;
	private StockCodeService stockCodeService;
	
	
	
	
	
}
