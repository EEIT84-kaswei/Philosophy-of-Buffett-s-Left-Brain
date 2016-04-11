package _04_stock.model.dao;
/* 張碩文 Peter Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import _04_stock.model.DailyStockBean;
import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DailyStockDAOHibernate {
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args){
		DailyStockDAOHibernate dailyStockDAOHibernate=new DailyStockDAOHibernate();
		dailyStockDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		
		Transaction tx=null;
		try {
			Session session=dailyStockDAOHibernate.getSession();
			tx=session.beginTransaction();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			
			//測試select(Integer stock_Code,Date trading_Date)		
			Date testDate=sdf.parse("2016/03/01");			
			DailyStockBean bean1=dailyStockDAOHibernate.select(new Integer(2330), testDate);
			
			//測試select()
			List<DailyStockBean> list=dailyStockDAOHibernate.select();
			for(DailyStockBean bean:list){
				System.out.println(bean);
			}		
			
			//測試insert(DailyStockBean bean)
			DailyStockBean bean2=new DailyStockBean();
			bean2.setStock_Code(new Integer(2330));	
			Date testDate2= sdf.parse("2016/03/31");
			bean2.setTrading_Date(testDate2);
			bean2.setOpening_Price(new BigDecimal("162.00"));
			bean2.setHighest_Price(new BigDecimal("163.00"));
			bean2.setLowest_Price(new BigDecimal("159.00"));
			bean2.setClosing_Price(new BigDecimal("162.00"));
			bean2.setChange_Amount(new BigDecimal("0.50"));
			bean2.setChange_Extent(new BigDecimal("0.00"));
			bean2.setTrade_Volume(49433);
			DailyStockBean result=dailyStockDAOHibernate.insert(bean2);
			System.out.println(result);
			
			//測試update(...)
			DailyStockBean resultUpdate=dailyStockDAOHibernate.update(new BigDecimal("163.00"), new BigDecimal("164.00"), new BigDecimal("160.00"), 
					new BigDecimal("163.00"), new BigDecimal("1.50"), new BigDecimal("1.00"), 49533, new Integer(2330), testDate2);
			System.out.println(resultUpdate);
			
//			//測試delete(Integer stock_Code,Date trading_Date)
			boolean resultDelete=dailyStockDAOHibernate.delete(new Integer(2330), testDate2);
			System.out.println(resultDelete);
			
			tx.commit();
		} catch (RuntimeException e) {
			tx.rollback();
			e.printStackTrace();
		} catch (ParseException e){
			e.printStackTrace();
		} finally{
			HibernateUtil.closeSessionFactory();
		}
	}
	
	public DailyStockBean select(Integer stock_Code,Date trading_Date){
		DailyStockBean beanSelect=new DailyStockBean();
		beanSelect.setStock_Code(stock_Code);		
		beanSelect.setTrading_Date(trading_Date);		
		return this.getSession().get(DailyStockBean.class, beanSelect);
	}
	
	public List<DailyStockBean> select(){
		Query query=this.getSession().createQuery("from DailyStockBean");
		return (List<DailyStockBean>)query.list();
	}
	
	public DailyStockBean insert(DailyStockBean bean){
		DailyStockBean beanSelect=new DailyStockBean();
		beanSelect.setStock_Code(bean.getStock_Code());
		beanSelect.setTrading_Date(bean.getTrading_Date());
		DailyStockBean isBeanExist=this.getSession().get(DailyStockBean.class, beanSelect);
		if(isBeanExist==null){
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	public boolean delete(Integer stock_Code,Date trading_Date){
		DailyStockBean beanSelect=new DailyStockBean();
		beanSelect.setStock_Code(stock_Code);
		beanSelect.setTrading_Date(trading_Date);
		DailyStockBean beanDelete=this.getSession().get(DailyStockBean.class, beanSelect);
		if(beanDelete!=null){
			this.getSession().delete(beanDelete);
			return true;
		}
		return false;
	}
	
	public DailyStockBean update(BigDecimal opening_Price,BigDecimal highest_Price,BigDecimal lowest_Price,
			BigDecimal closing_Price,BigDecimal change_Amount,BigDecimal change_Extent,Integer trade_Volume,
			Integer stock_Code,java.util.Date trading_Date){
		DailyStockBean beanSelect=new DailyStockBean();
		beanSelect.setStock_Code(stock_Code);
		beanSelect.setTrading_Date(trading_Date);
		DailyStockBean result=this.getSession().get(DailyStockBean.class, beanSelect);
		if(result!=null){
			result.setOpening_Price(opening_Price);
			result.setHighest_Price(highest_Price);
			result.setLowest_Price(lowest_Price);
			result.setClosing_Price(closing_Price);
			result.setChange_Amount(change_Amount);
			result.setChange_Extent(change_Extent);
			result.setTrade_Volume(trade_Volume);
		}
		return result;
	}
}
