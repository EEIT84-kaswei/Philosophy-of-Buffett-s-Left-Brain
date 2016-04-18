package _03_stock_market.model.dao;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import _03_stock_market.model.InstantStockBean;
import _03_stock_market.model.InstantStockDAO;
import misc.HibernateUtil;


public class InstantStockDAOHibernate implements InstantStockDAO  {
	private Session session = null;
	public InstantStockDAOHibernate(Session session) {
		this.session = session;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction trx = session.beginTransaction();
			InstantStockDAO dao = new InstantStockDAOHibernate(session);
			InstantStockBean bean = new InstantStockBean();
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

			
			trx.commit();
		} catch (Exception e) {
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
		return session;
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
	
	public List<InstantStockBean> selectAllByStockCode(Integer stock_Code){
		Query query = getSession().createQuery("from InstantStockBean where stock_Code = ?");
		query.setParameter(0, stock_Code);
		List<InstantStockBean> result =  query.list();
		return result;
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
			BigDecimal change_extent,Integer acc_Trade_Volume) {
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
