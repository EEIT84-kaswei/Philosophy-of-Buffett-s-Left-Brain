package _04_stock.model.dao;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.util.List;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import org.hibernate.Transaction;

import misc.HibernateUtil;
import _04_stock.model.StockCodeBean;
import _04_stock.model.StockCodeDAO;

public class StockCodeDAOHibernate implements StockCodeDAO {
	
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		StockCodeDAOHibernate dao = new StockCodeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		//===================================================================================
		StockCodeBean bean = null;
		List<StockCodeBean> beanList = null;
//		try {
//			Transaction tx = session.beginTransaction();
////			bean = dao.select(4108);
////			beanList = dao.selectByTypeCode("s1");
//			beanList = dao.selectBycs_Code("c1");
//			for(StockCodeBean xBean : beanList){
//				System.out.println(xBean);
//			}
//			tx.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		System.out.println(bean);//查詢========================================================
		
//		StockCodeBean bean = null;
//		StockCodeBean bean1= null;
//		try {
//			session.beginTransaction();
//			bean = new StockCodeBean();
//			bean.setStock_Code(4162);
//			bean.setStock_Name("智擎");
//			bean.setStock_TypeCode("s2");
//			bean.setCs_Code("c2");	
//			bean.setCommend("風險偏高");
//			bean1 = dao.insert(bean);
//			session.getTransaction().commit();
//		} catch (Exception e) {	
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		}
//		
//		System.out.println(bean1);//新增========================================================
		
		List<StockCodeBean> beans = null;
		try {
			session.beginTransaction();
			beans = dao.selectAll();
			session.getTransaction().commit();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		for(StockCodeBean X:beans){
		System.out.println(X);//查詢全部=====================================================
		}
//		boolean bean = false;
//		try {
//			session.beginTransaction();
//			bean = dao.delete(4108);
//			session.getTransaction().commit();
//		} catch (Exception e) {
//		    session.getTransaction().rollback();
//			e.printStackTrace();
//		}
//		System.out.println(bean);//刪除========================================================
		
//		StockCodeBean bean = null;
//		
//		try {
//			session.beginTransaction();
//			bean = dao.update(4108, "懷特", "s1", "c1","風險偏高");
//			session.getTransaction().commit();
//		} catch (Exception e) {
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		}
//		System.out.println(bean);//修改========================================================
	}
	
	@Override
	public List<StockCodeBean> selectBycs_Code(String cs_Code){
		Query query = getSession().createQuery("from StockCodeBean where cs_Code = ?");
		query.setParameter(0, cs_Code);
		return (List<StockCodeBean>)query.list();
	}

	@Override
	public List<StockCodeBean> selectByTypeCode(String stock_TypeCode){
		Query query = getSession().createQuery("from StockCodeBean where stock_TypeCode = ?");
		query.setParameter(0, stock_TypeCode);
		return (List<StockCodeBean>)query.list();
	}
	
	@Override
	public StockCodeBean select(Integer stock_Code) {		
		return (StockCodeBean)this.getSession().get(StockCodeBean.class, stock_Code);
	}

	private static final String SELECT_ALL = "from StockCodeBean order by stock_Code";

	@Override
	public List<StockCodeBean> selectAll() {		
		Query query = this.getSession().createQuery(SELECT_ALL);
		return (List<StockCodeBean>)query.list();
	}
	
	@Override
	public StockCodeBean insert(StockCodeBean bean) {
		StockCodeBean result = (StockCodeBean)this.getSession().get(StockCodeBean.class, bean.getStock_Code());
		if(result ==null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;

	}

	@Override
	public StockCodeBean update(Integer stock_Code, String stock_Name,
			String stock_TypeCode, String cs_Code,String commend) {		
		StockCodeBean result = (StockCodeBean)this.getSession().get(StockCodeBean.class, stock_Code);
		if(result!=null){
			result.setCs_Code(cs_Code);
			result.setStock_Code(stock_Code);
			result.setStock_Name(stock_Name);
			result.setStock_TypeCode(stock_TypeCode);
			result.setCommend(commend);
		}		
			
		

		return result;
	}

	@Override
	public boolean delete(Integer stock_Code) {		
		StockCodeBean bean = (StockCodeBean)this.getSession().get(StockCodeBean.class, stock_Code);
		if(bean!=null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

}
