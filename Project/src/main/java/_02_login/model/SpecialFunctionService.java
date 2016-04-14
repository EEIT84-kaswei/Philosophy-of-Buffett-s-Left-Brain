package _02_login.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Session;

import _02_login.model.dao.CustFavoriteDAOHibernate;
import _02_login.model.dao.SpecialFunctionDAOHibernate;
import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;

public class SpecialFunctionService {
	private SpecialFunctionDAO specialFunctionDAO;
	public void setSpecialFunctionDAO(SpecialFunctionDAO specialFunctionDAO) {
		this.specialFunctionDAO = specialFunctionDAO;
	}
	
		
	
	public static void main (String [] args){
		SpecialFunctionDAOHibernate dao = new SpecialFunctionDAOHibernate();	
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		SpecialFunctionService service = new SpecialFunctionService();
		service.setSpecialFunctionDAO(dao);
		
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<SecuritiesTradeBean> SBean = null;
		List<DailyStockBean> DBean = null ; 
		List<Integer>IBean = null;
		Date sDate = null;
		Date trading_Date = null;
		Integer stock_Code = 1101;
		try {
			sDate = sFormat.parse("2015-11-02");
			trading_Date =  sFormat.parse("2015-11-02");
		} catch (ParseException e) {			
			e.printStackTrace();
		}
		try {
			dao.getSession().beginTransaction();
//			SBean = dao.selectMax(sDate, stock_Code);//查詢某日單一個股最大買超
//			SBean = dao.selectMin(sDate, stock_Code);//查詢某日單一個股最大賣超
//			DBean = dao.selectTrade_Volume(trading_Date, stock_Code);//查詢某日單一個股總成交量
//			IBean = dao.selectBuyTop15(sDate, stock_Code);//查詢某日單一個股TOP15買超量
//			IBean = dao.selectBuyLow15(sDate, stock_Code);//查詢某日單一個股TOP15賣超量
//			IBean = dao.select_FC_Trade(stock_Code);//查詢近三個交易日單一個股外資買賣超
			IBean = dao.select_IT_Trade(stock_Code);//查詢近三個交易日單一個股投信買賣超
			dao.getSession().getTransaction().commit();
//			System.out.println(SBean);
//			System.out.println(DBean);
//			System.out.println(IBean);
		} catch (Exception e) {
			dao.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
		
		
		
	}

	//查詢某日單一個股最大買超
	public  Integer selectMax(Date sDate, Integer stock_Code) {
		List<Integer> result = null;
		if(sDate!=null&&stock_Code!=null){
			result = specialFunctionDAO.selectMax(sDate, stock_Code);
		}
		return result.get(0);
	}
	//查詢某日單一個股最大賣超
	public Integer selectMin(Date sDate, Integer stock_Code) {
		List<Integer> result = null;
		if(sDate!=null&&stock_Code!=null){
			result = specialFunctionDAO.selectMin(sDate, stock_Code);
		}
		return result.get(0);
	}
	//查詢某日單一個股總成交量
	public Integer selectTrade_Volume(Date trading_Date,Integer stock_Code) {
		List<Integer> result = null;
		if(trading_Date!=null&&stock_Code!=null){
			result = specialFunctionDAO.selectTrade_Volume(trading_Date, stock_Code);
		}
		return result.get(0);
	}
	//查詢某日單一個股TOP15買超量
	public Integer[] selsctBuyTop15(Date sDate,Integer stock_Code) {
		List<Integer> result = null;
		if(sDate!=null&&stock_Code!=null){
			result = specialFunctionDAO.selectBuyTop15(sDate, stock_Code);
		}
		Integer [] BuyTop15 = new Integer[15];
		for(int i = 0;i<15;i++){
			BuyTop15 [i] = result.get(i);
		}
		return BuyTop15;
	}
	//查詢某日單一個股TOP15賣超量
	public Integer[] selectBuyLow15(Date sDate,Integer stock_Code) {
		List<Integer> result = null;
		if(sDate!=null&&stock_Code!=null){
			result = specialFunctionDAO.selectBuyLow15(sDate, stock_Code);
		}
		Integer [] BuyLow15 = new Integer[15];
		for(int i = 0;i<15;i++){
			BuyLow15 [i] = result.get(i);
		}
		return BuyLow15;
	}
	//查詢近三個交易日單一個股外資買賣超
	public Integer[] select_FC_Trade(Integer stock_Code) {
		List<Integer> result = null;
		if(stock_Code!=null){
			result = specialFunctionDAO.select_FC_Trade(stock_Code);
		}
		Integer [] FC_Trade = new Integer[3];
		for(int i = 0;i<3;i++){
			FC_Trade [i] = result.get(i);
		}
		return FC_Trade;
	}
	//查詢近三個交易日單一個股投信買賣超
	public Integer[] select_IT_Trade(Integer stock_Code) {
		List<Integer> result = null;
		if(stock_Code!=null){
			result = specialFunctionDAO.select_IT_Trade(stock_Code);
		}
		Integer [] IT_Trade = new Integer[3];
		for(int i = 0;i<3;i++){
			IT_Trade [i] = result.get(i);
		}
		return IT_Trade;
	}
}
