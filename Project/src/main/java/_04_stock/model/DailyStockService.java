package _04_stock.model;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

import _04_stock.model.dao.DailyStockDAOHibernate;
import misc.HibernateUtil;

public class DailyStockService {

	private DailyStockDAO dailyStockDAO;
	public void setDailyStockDAO (DailyStockDAO dailyStockDAO){
		this.dailyStockDAO = dailyStockDAO;
	}
	
	
	//[歷史股價 -1隻股、全部天數、全部資料]
	//回傳歷史股價：全部資料LIST
	public String selectAllofOneStock(Integer stock_Code){
		List<DailyStockBean> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
		Iterator<DailyStockBean> it=result.iterator();
		while(it.hasNext()){
			DailyStockBean bean=it.next();
			JsonArrayBuilder oneDayArrayBuilder=Json.createArrayBuilder();
			long dateMillis=bean.getTrading_Date().getTime();
			oneDayArrayBuilder.add(new BigDecimal(dateMillis));
			oneDayArrayBuilder.add(bean.getOpening_Price());
			oneDayArrayBuilder.add(bean.getHighest_Price());
			oneDayArrayBuilder.add(bean.getLowest_Price());
			oneDayArrayBuilder.add(bean.getClosing_Price());
			oneDayArrayBuilder.add(new BigDecimal(bean.getTrade_Volume().intValue()));	
			oneStockArrayBuilder.add(oneDayArrayBuilder);
		}
		String oneStockDataStr=oneStockArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public String selectStockVolume(Integer stock_Code){
		List<DailyStockBean> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
		Iterator<DailyStockBean> it=result.iterator();
		while(it.hasNext()){
			DailyStockBean bean=it.next();
			JsonArrayBuilder oneDayArrayBuilder=Json.createArrayBuilder();
			long dateMillis=bean.getTrading_Date().getTime();
			oneDayArrayBuilder.add(new BigDecimal(dateMillis));
			oneDayArrayBuilder.add(new BigDecimal(bean.getTrade_Volume().intValue()));			
			oneStockArrayBuilder.add(oneDayArrayBuilder);
		}
		String oneStockDataStr=oneStockArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public String selectStockVolumeColor(Integer stock_Code){
		List<DailyStockBean> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockColorArrayBuilder=Json.createArrayBuilder();
		
		for(int i=0;i<result.size();i++){
			
			if(i==0){
				oneStockColorArrayBuilder.add("gray");
				continue;
			}
			BigDecimal closing_Price_Today=result.get(i).getClosing_Price();
			BigDecimal closing_Price_Yesterday=result.get(i-1).getClosing_Price();
			if(closing_Price_Today.subtract(closing_Price_Yesterday).compareTo(new BigDecimal("0"))==1){
				oneStockColorArrayBuilder.add("red");
			}else if(closing_Price_Today.subtract(closing_Price_Yesterday).compareTo(new BigDecimal("0"))==0){
				oneStockColorArrayBuilder.add("gray");
			}else{
				oneStockColorArrayBuilder.add("green");
			}
		}
		String oneStockDataStr=oneStockColorArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public static void main(String[] args) {
		
		DailyStockDAOHibernate daoHibernate = new DailyStockDAOHibernate();
		daoHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		
		DailyStockService service = new DailyStockService();
		service.setDailyStockDAO(daoHibernate);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date trading_Date = null;
		Date trading_Date1 = null;
		try {
			trading_Date = sdf.parse("2014-01-02");
			trading_Date1 = sdf.parse("2014-01-03");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		try {
			daoHibernate.getSession().beginTransaction();			
//			Integer tradeVolumn = service.selectJustTradeVolumn(1101, trading_Date);
//			System.out.println(tradeVolumn);
//			DailyStockBean bean = service.selectOneDayofStock(1101, trading_Date1);
//			System.out.println(bean);
			String oneStockDataStr = service.selectAllofOneStock(new Integer(2330));
			System.out.println(oneStockDataStr);
//			for(DailyStockBean bean2 : beans){
//				System.out.println(bean2);
//			}
			daoHibernate.getSession().getTransaction().commit();
		} catch (Exception e) {
			daoHibernate.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
		
		HibernateUtil.closeSessionFactory();
		
	}
	
	//[歷史股價 -1隻股、1天、1筆資料]
	//回傳歷史股價：全部資料
	public DailyStockBean selectOneDayofStock(Integer stock_Code , Date trading_Date){
		DailyStockBean result = dailyStockDAO.select(stock_Code, trading_Date);
		return result;
	}
	
	//[股票推薦運算使用]
	//回傳歷史股價：成交量 trade_Volume 
	public Integer  selectJustTradeVolumn(Integer stock_Code , Date trading_Date){
		DailyStockBean bean = dailyStockDAO.select(stock_Code, trading_Date);
		Integer trade_Volume = bean.getTrade_Volume();
		return trade_Volume;
	}	
	
}
