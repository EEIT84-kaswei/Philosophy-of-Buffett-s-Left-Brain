package _02_login.model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _02_login.model.SpecialFunctionDAO;
import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;
import _04_stock.model.dao.DailyStockDAOHibernate;
import _04_stock.model.dao.SecuritiesTradeDAOHibernate;

public class SpecialFunctionDAOHibernate implements SpecialFunctionDAO{
	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		SpecialFunctionDAOHibernate daoS = new SpecialFunctionDAOHibernate();
		daoS.setSessionFactory(sessionFactory);
		List<Integer> selectBean = null;//查詢最大b_s_sheets值 //查詢最小b_s_sheets值
//	    List<DailyStockBean> selectBean = null;// 查詢成交量
//		List<Integer> selectBean = null;

		Session session = sessionFactory.getCurrentSession();
		Date sDate = null;
		Date trading_Date = null;		
		Integer stock_Code = 2882;
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			sDate = sFormat.parse("2016-03-15");
			trading_Date = sFormat.parse("2014-01-02");			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// //查詢最大b_s_sheets值 //查詢最小b_s_sheets值
		try {
			daoS.getSession().beginTransaction();
			selectBean = daoS.selectMax(sDate, stock_Code); //查詢最大b_s_sheets值
			System.out.println(selectBean.get(0).getClass().getName());
//			selectBean = daoS.selectlow(sDate, stock_Code); //查詢最小b_s_sheets值
//			selectBean = daoS.selsctBuyTop15(sDate, stock_Code);//查詢TOP15b_s_sheets值
//			selectBean = daoS.selectBuyLow15(sDate, stock_Code);//查詢LOW15b_s_sheets值
//			selectBean = daoS.select_FC_Trade(stock_Code);//查詢外資連買
//			selectBean = daoS.select_IT_Trade(stock_Code);//查詢投信連買
			daoS.getSession().getTransaction().commit();
			System.out.println(selectBean);
		} catch (Exception e) {
			System.out.println("Error");
			daoS.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
		// 查詢成交量
		// try {
		// daoS.getSession().beginTransaction();
		// selectBean = daoS.selectTrade_Volume(trading_Date, stock_Code);
		// daoS.getSession().getTransaction().commit();
		// System.out.println(selectBean);
		// } catch (Exception e) {
		// System.out.println("Error");
		// daoS.getSession().getTransaction().rollback();
		// e.printStackTrace();
		// }

		HibernateUtil.closeSessionFactory();
	}

	private String selectTop1_b_s_sheets = "select max(b_s_sheets) from _04_stock.model.SecuritiesTradeBean where stock_Code=:stock_Code  and sDate=:sDate ";

	public List<Integer> selectMax(Date sDate, Integer stock_Code) {
		Query query = this.getSession().createQuery(selectTop1_b_s_sheets);
		System.out.println("SQL後");
		// query.setFirstResult(0);
		// query.setMaxResults(20);
		query.setParameter("sDate", sDate);
		query.setParameter("stock_Code", stock_Code);
		// query.setFetchSize(1);
		System.out.println("SET後");
		return query.list();
	}

	private String selectlow1_b_s_sheets = "select min(b_s_sheets) from _04_stock.model.SecuritiesTradeBean where stock_Code=:stock_Code  and sDate=:sDate";

	public List<Integer> selectMin(Date sDate, Integer stock_Code) {
		Query query = this.getSession().createQuery(selectlow1_b_s_sheets);
		query.setParameter("sDate", sDate);
		query.setParameter("stock_Code", stock_Code);
		return query.list();
	}

	private String selectTradeValue = "select trade_Volume from _04_stock.model.DailyStockBean where stock_Code=:stock_Code and trading_Date=:trading_Date";

	public List<Integer> selectTrade_Volume(Date trading_Date,
			Integer stock_Code) {
		Query query = this.getSession().createQuery(selectTradeValue);
		query.setParameter("stock_Code", stock_Code);
		query.setParameter("trading_Date", trading_Date);
		return query.list();
	}
	private String select_Top15_b_s_sheets = "select b_s_sheets from _04_stock.model.SecuritiesTradeBean where sDate=? and stock_Code=? Order by b_s_sheets desc";

	// public List<SecuritiesTradeBean> selectAll(Date sDate, Integer
	// stock_Code) {
	// Query query = this.getSession().createQuery(select_b_s_sheets);
	// query.setParameter("sDate", sDate);
	// query.setParameter("stock_Code", stock_Code);
	// return query.list();
	public List<Integer> selectBuyTop15(Date sDate,Integer stock_Code) {
		Query query = this.getSession().createQuery(select_Top15_b_s_sheets);
		query.setParameter(0, sDate);
		query.setParameter(1, stock_Code);
		List<Integer> temp = query.list();
		List<Integer> beansList = new ArrayList<Integer>();
		for (int n = 0; n < 15; n++) {
			beansList.add(temp.get(n));
		}
		return beansList;

	}
	
	private String select_Low15_b_s_sheets = "select b_s_sheets from _04_stock.model.SecuritiesTradeBean where sDate=? and stock_Code=? Order by b_s_sheets asc";
	
	public List<Integer> selectBuyLow15(Date sDate,Integer stock_Code) {
		Query query = this.getSession().createQuery(select_Low15_b_s_sheets);
		query.setParameter(0, sDate);
		query.setParameter(1, stock_Code);
		List<Integer> temp = query.list();
		List<Integer> beanLow = new ArrayList<Integer>();
		for (int n = 0; n < 15; n++) {
			beanLow.add(temp.get(n));
		}
		return beanLow;		
	}
	
	private String select_FC_Trade_Count = "select FC_Trade_Count from _03_stock_market.model.LegalPersonBean where stock_Code=? Order by ldate desc";
	public List<Integer> select_FC_Trade(Integer stock_Code){
		Query query = this.getSession().createQuery(select_FC_Trade_Count);		
		query.setParameter(0, stock_Code);
		List<Integer> temp = query.list();
		List<Integer> FC = new ArrayList<Integer>();
		for(int n = 0;n<3;n++){
			FC.add(temp.get(n));
		}
		return FC;		
	}
	
	private String select_IT_Trade_Count = "select IT_Trade_Count from _03_stock_market.model.LegalPersonBean where stock_Code=? Order by ldate desc";
	public List<Integer> select_IT_Trade(Integer stock_Code){
		Query query = this.getSession().createQuery(select_IT_Trade_Count);
		query.setParameter(0, stock_Code);
		List<Integer> temp = query.list();
		List<Integer> IT = new ArrayList<Integer>();
		for(int n = 0;n<3;n++){
			IT.add(temp.get(n));
		}
		return IT;		
	}
	
	
}
