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
		List<Object[]> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
		int resultSize=result.size();
		for(int i=0;i<resultSize;i++){
			Object[] dailyStockData=result.get(i);
			JsonArrayBuilder oneDayArrayBuilder=Json.createArrayBuilder();
			long dateMillis=((java.sql.Date)dailyStockData[1]).getTime();
			oneDayArrayBuilder.add(new BigDecimal(dateMillis));
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[2]);
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[3]);
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[4]);
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[5]);
			if(dailyStockData[6]!=null){
				oneDayArrayBuilder.add((BigDecimal)dailyStockData[6]);
			}else{
				oneDayArrayBuilder.add("-");
			}
			if(dailyStockData[7]!=null){
				oneDayArrayBuilder.add((BigDecimal)dailyStockData[7]);
			}else{
				oneDayArrayBuilder.add("-");
			}
			oneDayArrayBuilder.add(new BigDecimal(((Integer)dailyStockData[8]).intValue()));
			
			if(i>=19){
				int index=i;
				BigDecimal sum20=new BigDecimal("0");
				for(int j=1;j<=20;j++){
					sum20=sum20.add((BigDecimal)result.get(index)[5]);
					index--;
				}
				BigDecimal avg20=sum20.divide(new BigDecimal("20"),2,BigDecimal.ROUND_HALF_UP);
				oneDayArrayBuilder.add(avg20);
			}else{
				oneDayArrayBuilder.add(new BigDecimal("0"));
			}
			
			if(i>=59){
				int index=i;
				BigDecimal sum60=new BigDecimal("0");
				for(int j=1;j<=60;j++){
					sum60=sum60.add((BigDecimal)result.get(index)[5]);
					index--;
				}
				BigDecimal avg60=sum60.divide(new BigDecimal("60"),2,BigDecimal.ROUND_HALF_UP);
				oneDayArrayBuilder.add(avg60);
			}else{
				oneDayArrayBuilder.add(new BigDecimal("0"));
			}
			
			if(i>=239){
				int index=i;
				BigDecimal sum240=new BigDecimal("0");
				for(int j=1;j<=240;j++){
					sum240=sum240.add((BigDecimal)result.get(index)[5]);
					index--;
				}
				BigDecimal avg240=sum240.divide(new BigDecimal("240"),2,BigDecimal.ROUND_HALF_UP);
				oneDayArrayBuilder.add(avg240);
			}else{
				oneDayArrayBuilder.add(new BigDecimal("0"));
			}
			
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[9]);
			oneDayArrayBuilder.add((BigDecimal)dailyStockData[10]);		
			
			oneStockArrayBuilder.add(oneDayArrayBuilder);
		}		
		String oneStockDataStr=oneStockArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public String selectStockVolume(Integer stock_Code){
		List<Object[]> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
		Iterator<Object[]> it=result.iterator();
		while(it.hasNext()){
			Object[] dailyStockVolume=it.next();
			JsonArrayBuilder oneDayArrayBuilder=Json.createArrayBuilder();
			long dateMillis=((java.sql.Date)dailyStockVolume[1]).getTime();
			oneDayArrayBuilder.add(new BigDecimal(dateMillis));
			oneDayArrayBuilder.add(new BigDecimal(((Integer)dailyStockVolume[8]).intValue()));			
			oneStockArrayBuilder.add(oneDayArrayBuilder);
		}
		String oneStockDataStr=oneStockArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public String selectStockVolumeColor(Integer stock_Code){
		List<Object[]> result = dailyStockDAO.selectByStockCode(stock_Code);
		JsonArrayBuilder oneStockColorArrayBuilder=Json.createArrayBuilder();
		
		for(int i=0;i<result.size();i++){
			
			if(i==0){
				oneStockColorArrayBuilder.add("gray");
				continue;
			}
			BigDecimal closing_Price_Today=(BigDecimal)result.get(i)[5];
			BigDecimal closing_Price_Yesterday=(BigDecimal)result.get(i-1)[5];
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
