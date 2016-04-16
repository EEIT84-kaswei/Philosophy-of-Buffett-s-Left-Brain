package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockDAOHibernate;
import misc.HibernateUtil;

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
			String oneStockDataStr = service.selectByOneStock(2330);
			System.out.println(oneStockDataStr);			
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	//[即時K線圖]即時InsertService - 某支股票，當天全部交易資料 
	//回傳[Insert]股價資料： (1)stock_Code股票代碼   (2)iDateTime時分秒   (3)final_Price成交價格
	
	public String selectByOneStock(Integer stock_Code){
		List<InstantStockBean> result = null;
		result = InstantStockDAO.selectAllByStockCode(stock_Code);
		JsonArrayBuilder oneStockArrayBuilder=Json.createArrayBuilder();
		Iterator<InstantStockBean> it=result.iterator();
		while(it.hasNext()){			
			InstantStockBean bean=it.next();
			JsonArrayBuilder oneDataArrayBuilder=Json.createArrayBuilder();
			long timeMillis=bean.getiDatetime().getTime();
			oneDataArrayBuilder.add(new BigDecimal(timeMillis));
			oneDataArrayBuilder.add(bean.getFinal_price());
			oneStockArrayBuilder.add(oneDataArrayBuilder);
		}
		String oneStockDataStr=oneStockArrayBuilder.build().toString();
		return oneStockDataStr;
	}
	
	public String selectLatestData(Integer stock_Code){
		InstantStockBean bean=null;
		bean=InstantStockDAO.selectLatestByStockCode(stock_Code);
//		latestDataJson.createArrayBuilder();
		return null;
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
						bean.getChange_extent(), bean.getAcc_Trade_Volume());
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
