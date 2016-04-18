package _03_stock_market.model.dao;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _03_stock_market.model.InstantStockBean;
import _03_stock_market.model.InstantStockDAO;


public class InstantStockDAOHibernate implements InstantStockDAO  {
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public static void main(String[] args) {
				
			InstantStockDAOHibernate dao = new InstantStockDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
//			InstantStockBean bean = new InstantStockBean();
			Transaction tx=null;
		try{
			tx=HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			//測試新增
//			String inTime="2016-03-31 01:01:01";
//			SimpleDateFormat sdt= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				java.util.Date ds = sdt.parse(inTime);
//				java.sql.Timestamp time =new java.sql.Timestamp(ds.getTime());
//			
//			bean.setStock_TypeCode("s1");
//			bean.setStock_Code(8080);
//			bean.setiDatetime(time);
//			bean.setStock_Name("shiu");
//			bean.setPurchase_Price(new BigDecimal(199));
//			bean.setSelling_Price(new BigDecimal(299));
//			bean.setFinal_price(new BigDecimal(299));
//			bean.setChange_Amount(new BigDecimal(29));
//			bean.setChange_extent(new BigDecimal(39));
//			bean.setAcc_Trade_Volume(999);
//			InstantStockBean beans =  
//					dao.insert(bean);
//			System.out.println(beans);

			//測試修改
//			String inTime="2016-03-31 16:26:38";
//			SimpleDateFormat sdt= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				java.util.Date ds = sdt.parse(inTime);
//				java.sql.Timestamp time =new java.sql.Timestamp(ds.getTime());
//				
//			bean=dao.update("s2",8443,time,"測試",new BigDecimal(30), new BigDecimal(40), new BigDecimal(50), new BigDecimal(55),new BigDecimal(60),655);
//			System.out.println(bean);
			//測試查詢 &List
//			String inTime="2016-03-31 13:30:00";
//			SimpleDateFormat sdt= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				java.util.Date ds = sdt.parse(inTime);
//				java.sql.Timestamp time =new java.sql.Timestamp(ds.getTime());
//			bean=dao.select(6404, time);
//					System.out.println(bean);
//			=========================================================
//			List<InstantStockBean> beanList = dao.select();
//			for(InstantStockBean showbean:beanList){
//				System.out.println(showbean);
//			}
			//測試刪除
//			String inTime="2016-03-31 01:01:01";
//			SimpleDateFormat sdt= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				java.util.Date ds = sdt.parse(inTime);
//				java.sql.Timestamp time =new java.sql.Timestamp(ds.getTime());
//				
//				boolean  beanDel=dao.delete(8080,time);
//				System.out.println(beanDel);
			//測試selectAllByStockCode(Integer stock_Code)
//			List<InstantStockBean> list=dao.selectAllByStockCode(new Integer(2330));
//			for(InstantStockBean bean:list){
//				System.out.println(bean);
//			}			
			//測試selectLatestByStockCode(Integer stock_Code)
//			InstantStockBean bean=dao.selectLatestByStockCode(new Integer(2330));
//			System.out.println(bean);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#getSession()
	 */
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#select(int)
	 */
	@Override
	public InstantStockBean select(Integer stock_Code,java.sql.Timestamp iDatetime) {
		InstantStockBean bean= new InstantStockBean();
		
		bean.setStock_Code(stock_Code);
		bean.setiDatetime(iDatetime);
		return (InstantStockBean)this.getSession().get(InstantStockBean.class, bean);	
	}
	@Override
	public List<InstantStockBean> selectAllByStockCode(Integer stock_Code){
		Query query = getSession().createQuery("from InstantStockBean where stock_Code = ? and iDatetime > ? order by iDatetime asc");
		String openingTimeStr="09:00:00";
		query.setParameter(0, stock_Code);
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd ");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal=Calendar.getInstance();
		int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		if(dayOfWeek==1){
			cal.add(Calendar.DAY_OF_WEEK, -2);
		}else if(dayOfWeek==7){
			cal.add(Calendar.DAY_OF_WEEK, -1);
		}
		Date targetTime=cal.getTime();
		String dateOfToday=sdf1.format(targetTime);
		Date openingTimeOfToday=null;
		try {
			openingTimeOfToday=sdf2.parse(dateOfToday+openingTimeStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		query.setParameter(1, openingTimeOfToday);
		List<InstantStockBean> result =  query.list();
		return result;
	}
	@Override
	public InstantStockBean selectLatestByStockCode(Integer stock_Code){
		InstantStockBean bean=null;
		Query query=getSession().createQuery("from InstantStockBean where stock_Code=:stock_Code order by iDatetime desc");
		query.setParameter("stock_Code", stock_Code);
		List<InstantStockBean> list=query.list();
		if(!list.isEmpty()){
			bean=list.get(0);
		}
		return bean;
	}
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#select()
	 */
	@Override
	public List<InstantStockBean> select() {
		Query query =
				this.getSession().createQuery("from InstantStockBean");
		return (List<InstantStockBean>) query.list();
	}
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#insert(model.InstantStockBean)
	 */
	@Override
	public InstantStockBean insert(InstantStockBean bean) {
		InstantStockBean beanCode=new InstantStockBean();
		beanCode.setStock_TypeCode(bean.getStock_TypeCode());
		beanCode.setStock_Code(bean.getStock_Code());
		InstantStockBean result = (InstantStockBean)
				this.getSession().get(InstantStockBean.class, beanCode);
		if(result==null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#update(int, java.lang.String, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, int)
	 */
	@Override
	public InstantStockBean update(String stock_TypeCode, Integer stock_Code,
			java.sql.Timestamp iDatetime,String stock_Name,BigDecimal purchase_Price,
			BigDecimal selling_Price,BigDecimal final_price,BigDecimal change_Amount,
			BigDecimal change_extent,Integer acc_Trade_Volume,Integer trade_Volume) {
		InstantStockBean bean= new InstantStockBean();
		bean.setStock_TypeCode(stock_TypeCode);
		bean.setStock_Code(stock_Code);
		InstantStockBean result = (InstantStockBean)
				this.getSession().get(InstantStockBean.class, bean);
		if(result!=null) {
			result.setStock_TypeCode(stock_TypeCode);
			result.setStock_Code(stock_Code);
			result.setiDatetime(iDatetime);
			result.setStock_Name(stock_Name);
			result.setPurchase_Price(purchase_Price);
			result.setSelling_Price(selling_Price);
			result.setFinal_price(final_price);
			result.setChange_Amount(change_Amount);
			result.setChange_extent(change_extent);
			result.setAcc_Trade_Volume(acc_Trade_Volume);
			result.setTrade_Volume(trade_Volume);
		}
		return result;
	}
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockDAO#delete(int, int)
	 */
	@Override
	public boolean delete(Integer stock_Code,java.sql.Timestamp iDatetime) {
		InstantStockBean bean= new InstantStockBean();
		bean.setStock_Code(stock_Code);
		bean.setiDatetime(iDatetime);
		InstantStockBean beandel = (InstantStockBean) this.getSession().get(InstantStockBean.class, bean);
		if(beandel!=null) {
			this.getSession().delete(beandel);
			return true;
		}
		return false;
	}
	
}
