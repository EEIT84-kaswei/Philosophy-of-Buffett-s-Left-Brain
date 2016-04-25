package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockDAOHibernate;

public class InstantStockService {
	private InstantStockDAO InstantStockDAO;
	public void setInstantStockDAO(InstantStockDAO InstantStockDAO) {
		this.InstantStockDAO = InstantStockDAO;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction transaction = session.beginTransaction();

			InstantStockService service = new InstantStockService();
			InstantStockDAOHibernate instantStockDAOHibernate=new InstantStockDAOHibernate();
			instantStockDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
			service.setInstantStockDAO(instantStockDAOHibernate);
//			List<InstantStockBean> beans = service.select(null);
//			System.out.println("beans="+beans);
			//測試selectByOneStock(Integer stock_Code)
			String oneStockDataStr = service.selectByOneStock(new Integer(2330));
			System.out.println(oneStockDataStr);
			//測試selectLatestData(Integer stock_Code)
//			String latestDataStr=service.selectLatestData(new Integer(2330));
//			System.out.println(latestDataStr);
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	//[即時K線圖]即時InsertService - 某支股票，當天全部交易資料 
	//回傳[Insert]股價資料： (1)stock_Code股票代碼   (2)iDateTime時分秒   (3)final_Price成交價格
	
	public String selectByOneStock(Integer stock_Code){		
		String openingTimeStr="09:00:00";
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd ");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal=Calendar.getInstance();
		int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		int hourOfDay=cal.get(Calendar.HOUR_OF_DAY);
		if(dayOfWeek==1){
			cal.add(Calendar.DAY_OF_WEEK, -2);
		}else if(dayOfWeek==7){
			cal.add(Calendar.DAY_OF_WEEK, -1);
		}else{			
			if(hourOfDay>=0 && hourOfDay <9){
				if(dayOfWeek==2){
					cal.add(Calendar.DAY_OF_WEEK, -3);
				}else{
					cal.add(Calendar.DAY_OF_WEEK, -1);
				}				
			}
		}
		Date targetTime=cal.getTime();
		String dateOfToday=sdf1.format(targetTime);
		Date openingTimeOfToday=null;
		try {
			openingTimeOfToday=sdf2.parse(dateOfToday+openingTimeStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		Timestamp iDatetime=new Timestamp(openingTimeOfToday.getTime());
		
		List<InstantStockBean> result = null;		
		result = InstantStockDAO.selectAllByStockCode(stock_Code,iDatetime);
		String oneStockDataStr=null;
		if(!result.isEmpty()){
			JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
			Iterator<InstantStockBean> it=result.iterator();
			while(it.hasNext()){
				InstantStockBean bean=it.next();
				JsonArrayBuilder oneDataArrayBuilder=Json.createArrayBuilder();
				long timeMillis=bean.getiDatetime().getTime();
				oneDataArrayBuilder.add(new BigDecimal(timeMillis));

				BigDecimal final_price=bean.getFinal_price();
				if(final_price!=null){
					oneDataArrayBuilder.add(final_price);
				}else{
					oneDataArrayBuilder.add(new BigDecimal("0"));
				}
				Integer trade_Volume=bean.getTrade_Volume();
				if(trade_Volume!=null){
					oneDataArrayBuilder.add(bean.getTrade_Volume());
				}else{
					oneDataArrayBuilder.add(new Integer(0));
				}			
				oneStockArrayBuilder.add(oneDataArrayBuilder);
			}
			oneStockDataStr=oneStockArrayBuilder.build().toString();		
		}
		return oneStockDataStr;
	}
	
	
	
	public String selectLatestData(Integer stock_Code){		
		InstantStockBean bean=InstantStockDAO.selectLatestByStockCode(stock_Code);
		String latestDataStr=null;
		if(bean!=null){
			JsonArrayBuilder latestDataArrayBuilder=Json.createArrayBuilder();
			long timeMillis=bean.getiDatetime().getTime();
			latestDataArrayBuilder.add(new BigDecimal(timeMillis));
			latestDataArrayBuilder.add(bean.getFinal_price());
			latestDataStr=latestDataArrayBuilder.build().toString();
		}		
		return latestDataStr;
	}
	
	//1隻股某個時間資料 or 全部股票資料
	public List<InstantStockBean> select(InstantStockBean bean) {
		List<InstantStockBean> result = null;
		if(bean!=null && bean.getStock_Code()!=0) {
			InstantStockBean temp = InstantStockDAO.select(bean.getStock_Code(),bean.getiDatetime());
			if(temp!=null) {
				result = new ArrayList<InstantStockBean>();
				result.add(temp);
			}
		} else {
			result = InstantStockDAO.select(); 
		}
		return result;
	}
	public InstantStockBean insert(InstantStockBean bean) {
		InstantStockBean result = null;
		if(bean!=null) {
			result = InstantStockDAO.insert(bean);
		}
		return result;
	}
	public InstantStockBean update(InstantStockBean bean) {
		InstantStockBean result = null;
		if(bean!=null) {
			
			result = InstantStockDAO.update(bean.getStock_TypeCode(), bean.getStock_Code(),
						bean.getiDatetime(), bean.getStock_Name(), bean.getPurchase_Price(),
						bean.getSelling_Price(), bean.getFinal_price(), bean.getChange_Amount(),
						bean.getChange_extent(), bean.getAcc_Trade_Volume(),bean.getTrade_Volume());
		}
		return result;
	}
	public boolean delete(InstantStockBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = InstantStockDAO.delete(bean.getStock_Code(), bean.getiDatetime());
		}
		return result;
	}

}
