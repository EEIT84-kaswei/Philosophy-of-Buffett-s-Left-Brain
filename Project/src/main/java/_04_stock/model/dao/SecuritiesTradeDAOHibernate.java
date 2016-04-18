package _04_stock.model.dao;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import _04_stock.model.SecuritiesTradeBean;
import _04_stock.model.SecuritiesTradeDAO;
import misc.HibernateUtil;

public class SecuritiesTradeDAOHibernate implements SecuritiesTradeDAO {
	private SessionFactory sessionFactory = null;	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {

		SessionFactory sFactory = HibernateUtil.getSessionFactory();

		SecuritiesTradeDAOHibernate dao = new SecuritiesTradeDAOHibernate();
		dao.setSessionFactory(sFactory);

		Session session = sFactory.getCurrentSession();
		Date sDate = null;
		Date sDateEnd = null;
		Date sDateBegin = null;
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
		SecuritiesTradeBean bean1 = null;
		List<SecuritiesTradeBean> beanlist = null;
		SecuritiesTradeBean bean = null;
		
		try {				
			sDate = sFormat.parse("2016-03-30");
			sDateEnd = sFormat.parse("2016-04-05");
			sDateBegin = sFormat.parse("2016-03-29");
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		 try {
		 session.beginTransaction();
		 
		 // =============================查詢	
		 beanlist = dao.select(sDate, 2615);
		 for(SecuritiesTradeBean xBean : beanlist){
			 System.out.println(xBean);
		 }
//		 beanlist = dao.select(2884,"瑞士信貸");
//		 System.out.println(beanlist);
		 beanlist = dao.select(sDate, 2615);
		 for(SecuritiesTradeBean xBean : beanlist){
			 System.out.println(xBean);
		 }
		 // ------------------------------------------ //
		 //範圍查詢
//	     beanlist = dao.selectRange(sDateBegin, sDateEnd, 6446);
//	     System.out.println(beanlist);
			 
	     //================新增
//		 SecuritiesTradeBean temp = new SecuritiesTradeBean();
//		 temp.setStock_Code(6446);
//		 temp.setsDate(sDate);
//		 temp.setSecurities_Supplier("測試");
//		 temp.setBuy_Sheets(2500);
//		 temp.setSell_Sheets(2000);
//		 temp.setB_s_sheets(500);//		
//		 bean1 = dao.insert(temp);
//		
		 session.getTransaction().commit();
		 } catch (Exception e) {
		 session.getTransaction().rollback();
		 e.printStackTrace();
		 }		
		 HibernateUtil.closeSessionFactory();
//		bean1 = new SecuritiesTradeBean();
//		try {			
//			session.beginTransaction();
//			bean1.setStock_Code(6446);
//			bean1.setsDate(date);
//			bean1.setSecurities_Supplier("富邦-忠孝");
//			bean1.setBuy_Sheets(3000);
//			bean1.setSell_Sheets(1500);
//			bean1.setB_s_sheets(1500);
//			bean = dao.update(bean1);
//			session.getTransaction().commit();
//		} catch (Exception e) {
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		}
//		System.out.println(bean);
//		HibernateUtil.closeSessionFactory();
	}


	public List<SecuritiesTradeBean> selectRange(Date sDateBegin, Date sDateEnd, Integer stock_Code){// select * from securitiesTrade where stock_Code=6446 and (sDate between '2016-03-29' and '2016-04-05')
		Criteria query = this.getSession().createCriteria(SecuritiesTradeBean.class);
		query.add(Restrictions.eq("stock_Code",stock_Code));
		query.add(Restrictions.between("sDate", sDateBegin, sDateEnd));
		return (List<SecuritiesTradeBean>)query.list();
	}
	private static final String SELECT_BY_D_S = "from _04_stock.model.SecuritiesTradeBean where stock_Code=:stock_Code and sDate=:sDate";

//	private static final String SELECT_BY_D_S = "select top 15 from _03_stock_market.model.SecuritiesTradeBean where stock_Code=:stock_Code and sDate=:sDate Order by b_s_sheets";

	public List<SecuritiesTradeBean> select(Date sDate, Integer stock_Code) {
		Query query = this.getSession().createQuery(SELECT_BY_D_S);	
		SecuritiesTradeBean selectBean = new SecuritiesTradeBean();
		selectBean.setsDate(sDate);
		selectBean.setStock_Code(stock_Code);
		query.setProperties(selectBean);
		return (List<SecuritiesTradeBean>)query.list();
	}
	private static final String SELECT_BY_S_S = "from _04_stock.model.SecuritiesTradeBean where stock_Code=:stock_Code and securities_Supplier=:securities_Supplier";
	public List<SecuritiesTradeBean> select(Integer stock_Code, String securities_Supplier) {
		Query query = this.getSession().createQuery(SELECT_BY_S_S);
		SecuritiesTradeBean selectBean = new SecuritiesTradeBean();
		selectBean.setStock_Code(stock_Code);
		selectBean.setSecurities_Supplier(securities_Supplier);
		query.setProperties(selectBean);
		return (List<SecuritiesTradeBean>)query.list();
	}

	public SecuritiesTradeBean insert(SecuritiesTradeBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
		// securitiesTradeBean bean1 = new securitiesTradeBean();
		// bean1.setStock_Code(bean.getStock_Code());
		// bean1.setsDate(bean.getsDate());
		// bean1.setSecurities_Supplier(bean.getSecurities_Supplier());
		// bean1.setBuy_Sheets(bean.getBuy_Sheets());
		// bean1.setSell_Sheets(bean.getSell_Sheets());
		// bean1.setB_s_sheets(bean.getB_s_sheets());
		// securitiesTradeBean result =
		// getSession().get(securitiesTradeBean.class, bean1);
		// System.out.println(result);
		// System.out.println(bean1);
		// s
		// if (result == null) {
		// System.out.println("if");
		// getSession().saveOrUpdate(bean1);
		// // return bean1;
		// }
		// return null;
	}

	public SecuritiesTradeBean update(SecuritiesTradeBean bean) {
		SecuritiesTradeBean beanUpdate=new SecuritiesTradeBean();
		beanUpdate.setsDate(bean.getsDate());
		beanUpdate.setStock_Code(bean.getStock_Code());
		beanUpdate.setSecurities_Supplier(bean.getSecurities_Supplier());
		SecuritiesTradeBean result = getSession().get(SecuritiesTradeBean.class, beanUpdate);		
		if (result != null) {
	//		result.setStock_Code(2330);
			result.setStock_Code(bean.getStock_Code());
			result.setsDate(bean.getsDate());
			result.setSecurities_Supplier(bean.getSecurities_Supplier());
			result.setBuy_Sheets(bean.getBuy_Sheets());
			result.setSell_Sheets(bean.getSell_Sheets());
			result.setB_s_sheets(bean.getB_s_sheets());	
			
		}
		return result;
//		if(select(bean.getsDate(), bean.getStock_Code())!=null){
//			securitiesTradeBean result = select(bean.getStock_Code(), bean.getsDate());
//			result.setsDate(bean.getsDate());
//			result.setStock_Code(bean.getStock_Code());
//			result.setSecurities_Supplier(bean.getSecurities_Supplier());
//			result.setBuy_Sheets(bean.getBuy_Sheets());
//			result.setSell_Sheets(bean.getSell_Sheets());
//			result.setB_s_sheets(bean.getB_s_sheets());
//						
//			return result;
//			
//		}
//		return null;

	}
	

}
