package _02_login.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import misc.HibernateUtil;
import _02_login.model.CustFavoriteService;
import _02_login.model.SpecialFunctionService;
import _02_login.model.StockAnalysisBean;
import _02_login.model.StockAnalysisService;
import _02_login.model.dao.CustFavoriteDAOHibernate;
import _02_login.model.dao.SpecialFunctionDAOHibernate;
import _02_login.model.dao.StockAnalysisDAOHibernate;
import _03_stock_market.model.InstantStockOneBean;
import _03_stock_market.model.InstantStockOneService;
import _03_stock_market.model.LegalPersonBean;
import _03_stock_market.model.dao.InstantStockOneDAOHibernate;
import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;
import _04_stock.model.StockCodeService;
import _04_stock.model.dao.StockCodeDAOHibernate;

public class StockAnalysis {
	private static SpecialFunctionService functionService;
	private static CustFavoriteService favoriteService;
	private static StockCodeService stockCodeService;
	private static InstantStockOneService service4 ;
	private static StockAnalysisService analysisService;
	//======================================================================================
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();				
		SpecialFunctionDAOHibernate dao = new SpecialFunctionDAOHibernate();
		dao.setSessionFactory(sessionFactory);
		functionService = new SpecialFunctionService();
		functionService.setSpecialFunctionDAO(dao);
		
		InstantStockOneDAOHibernate daoOne = new InstantStockOneDAOHibernate();
		daoOne.setSessionFactory(sessionFactory);
		service4 = new InstantStockOneService();
		service4.setInstantStockOneDAO(daoOne);

		CustFavoriteDAOHibernate daoC = new CustFavoriteDAOHibernate();
		daoC.setSessionFactory(sessionFactory);
		favoriteService = new CustFavoriteService();
		favoriteService.setCustFavoriteDAO(daoC);
		
		StockCodeDAOHibernate stockCodeDAOHibernate=new StockCodeDAOHibernate();
		stockCodeDAOHibernate.setSessionFactory(sessionFactory);
		stockCodeService = new StockCodeService();
		stockCodeService.setStockCodeDAO(stockCodeDAOHibernate);
		

		StockAnalysisDAOHibernate daoAnalysis = new StockAnalysisDAOHibernate();
		daoAnalysis.setSessionFactory(sessionFactory);
		analysisService = new StockAnalysisService();
		analysisService.setDao(daoAnalysis);
		//======================================================================================	
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sformat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date();
		// System.out.println(date.getTime()-(86400000*2));
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -1);
		// System.out.println(cal.get(Calendar.DAY_OF_WEEK));
		String yesterdayStr = sformat.format(cal.getTime());
		String time = "00:00:00";
		Date sDate = null;
		try {
			sDate = sformat2.parse(yesterdayStr + " " + time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(sDate);
		Date trading_Date = sDate;

		String answer1;
		String answer2;
		String answer3;
		String answer4;
		String answer5;

		System.out.println("轉換資料後");
		// 驗證HTML Form資料
		// 呼叫Model
		DailyStockBean DBean = new DailyStockBean();
		SecuritiesTradeBean SBean = new SecuritiesTradeBean();
		LegalPersonBean LBean = new LegalPersonBean();
		List<StockAnalysisBean> beans = new ArrayList<StockAnalysisBean>();
		
		List<InstantStockOneBean> IBean = new ArrayList<InstantStockOneBean>();
		Session session1 = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session1.beginTransaction();
			IBean = service4.select(null);
			session1.getTransaction().commit();
		} catch (Exception e2) {
			session1.getTransaction().rollback();
			e2.printStackTrace();
		}		

		for (InstantStockOneBean temp : IBean) {
			Integer stock_Code = temp.getStock_Code();
			System.out.println(stock_Code);
			StockAnalysisBean bean = new StockAnalysisBean();
			bean.setStock_Code(stock_Code);
			bean.setStock_Name(temp.getStock_Name());
			DBean.setStock_Code(stock_Code);
			SBean.setStock_Code(stock_Code);
			LBean.setStock_Code(stock_Code);
			Integer B_s_sheetsMax = null;
			Integer B_s_sheetsMin = null;
			Integer[] top_B_s_sheets = null;
			Integer[] low_B_s_sheets = null;
			int trade_Volume = 0;
			Integer[] FC_Trade_Count = { null, null, null };
			Integer[] IT_Trade_Count = { null, null, null };
			// try {
			int i = 1;
			while (i <= 31) {
				Session session3 = HibernateUtil.getSessionFactory().getCurrentSession();
				
				try {
					session3.beginTransaction();
					B_s_sheetsMax = functionService.selectMax(sDate, stock_Code);
					B_s_sheetsMin = functionService.selectMin(sDate, stock_Code);
					top_B_s_sheets = functionService.selsctBuyTop15(sDate,
							stock_Code);
					low_B_s_sheets = functionService.selectBuyLow15(sDate,
							stock_Code);
					trade_Volume = functionService.selectTrade_Volume(trading_Date,
							stock_Code);
					FC_Trade_Count = functionService.select_FC_Trade(stock_Code);
					IT_Trade_Count = functionService.select_IT_Trade(stock_Code);
					if (B_s_sheetsMax != null) {
						break;
					}
					session3.getTransaction().commit();
				} catch (IndexOutOfBoundsException e1) {

					System.out.println(e1.getMessage());
					if (B_s_sheetsMax == null || B_s_sheetsMin == null
							|| top_B_s_sheets == null || low_B_s_sheets == null
							|| trade_Volume == 0) {
						cal.add(Calendar.DAY_OF_MONTH, -1);
						yesterdayStr = sformat.format(cal.getTime());
						System.out.println(yesterdayStr);
						sDate = null;
						try {
							sDate = sformat2.parse(yesterdayStr + " " + time);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						System.out.println(sDate);
						trading_Date = sDate;
					} else {
						session3.getTransaction().rollback();
						break;
						
					}
				}
				i++;
			}
			boolean index1 = favoriteService.Stock_index1(stock_Code,
					B_s_sheetsMax, trade_Volume);
			boolean index2 = favoriteService.Stock_index2(B_s_sheetsMax,
					B_s_sheetsMin);
			boolean index3 = favoriteService.Stock_index3(top_B_s_sheets,
					low_B_s_sheets, trade_Volume);
			boolean index4 = favoriteService.Stock_index4(FC_Trade_Count[0],
					FC_Trade_Count[1], FC_Trade_Count[2], stock_Code);
			boolean index5 = favoriteService.Stock_index5(IT_Trade_Count[0],
					IT_Trade_Count[1], IT_Trade_Count[2], stock_Code);
			

			if (index1 == true) {
				bean.setIndex1("符合");
			} else {
				bean.setIndex1("尚未符合");
			}
			if (index2 == true) {
				bean.setIndex2("符合");
			} else {
				bean.setIndex2("尚未符合");
			}
			if (index3 == true) {
				bean.setIndex3("符合");
			} else {
				bean.setIndex3("尚未符合");
			}
			if (index4 == true) {
				bean.setIndex4("符合");
			} else {
				bean.setIndex4("尚未符合");
			}
			if (index5 == true) {
				bean.setIndex5("符合");
			} else {
				bean.setIndex5("尚未符合");
			}
			beans.add(bean);
		}
		
		
		
		
		
		
		
		Session session2 = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session2.beginTransaction();
			for(StockAnalysisBean X:beans){
				analysisService.insert(X);
				System.out.println(X);
			}
			session2.getTransaction().commit();
		} catch (Exception e) {
			session2.getTransaction().rollback();
			e.printStackTrace();
		}		
		HibernateUtil.closeSessionFactory();
		


	}
	
	

}
