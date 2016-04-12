package _02_login.model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;
import _04_stock.model.dao.SecuritiesTradeDAOHibernate;

public class SpecialFunctionDAOHibernate {
	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String []args){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();		
		SpecialFunctionDAOHibernate daoS = new SpecialFunctionDAOHibernate();
		daoS.setSessionFactory(sessionFactory);
		
		Session session = sessionFactory.getCurrentSession();
		Date sDate = null;
		Date trading_Date = null;
		Integer stock_Code = 1101;
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<SecuritiesTradeBean> selectBean = null;
		
		try {
			sDate = sFormat.parse("2016-03-15");
			trading_Date = sFormat.parse("2014-01-02");
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		//查詢最大b_s_sheets值
//		try {
//			daoS.getSession().beginTransaction();		
//			selectBean = daoS.select(sDate, stock_Code);
//			daoS.getSession().getTransaction().commit();
//			System.out.println(selectBean);
//		} catch (Exception e) {
//			System.out.println("Error");
//			daoS.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		
		
		
		HibernateUtil.closeSessionFactory();
	}
	
	private String selectTop1_b_s_sheets = "select max(b_s_sheets) from _04_stock.model.SecuritiesTradeBean where stock_Code=:stock_Code  and sDate=:sDate ";
	public List<SecuritiesTradeBean> select(Date sDate, Integer stock_Code){
		Query query = this.getSession().createQuery(selectTop1_b_s_sheets);
//		query.setFirstResult(0);
//		query.setMaxResults(20);
		query.setParameter("sDate",sDate);
		query.setParameter("stock_Code",stock_Code);		
//		query.setFetchSize(1);
		return  query.list();		
	}
	private String selectTradeValue ="select trade_Volume from _04_stock.model.dailyStockBean where stock_Code=:stock_Code and trading_Date=:trading_Date";
	public List<DailyStockBean> selectTrade_Volume(Date trading_Date, Integer stock_Code){
		Query query = this.getSession().createQuery(selectTradeValue);
		query.setParameter("stock_Code", stock_Code);
		query.setParameter("trading_Date", trading_Date);		
		return query.list();		
	}
}
