package _04_stock.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _04_stock.model.StockTypeBean;
import _04_stock.model.StockTypeDAO;
import misc.HibernateUtil;

public class StockTypeDAOHibernate implements StockTypeDAO {
	private SessionFactory sessionFactory;	

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			StockTypeDAOHibernate dao = new StockTypeDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
			session.beginTransaction();			
			List<StockTypeBean> bean = dao.select();
//			StockTypeBean bean = dao.selectByCode("s3");
//			StockTypeBean bean = dao.selectByName("上櫃股");
			
			System.out.println(bean);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}

	@Override
	public List<StockTypeBean> select(){
		Query query = getSession().createQuery("from StockTypeBean");
		return (List<StockTypeBean>) query.list();
	}

	@Override
	public StockTypeBean selectByCode(String stock_TypeCode){
		return (StockTypeBean) getSession().get(StockTypeBean.class, stock_TypeCode);		
	}

	@Override
	public StockTypeBean selectByName(String stock_TypeName){
		Query query = getSession().createQuery("from StockTypeBean where stock_TypeName like'%" + stock_TypeName + "%'");
		return (StockTypeBean) query.uniqueResult();
	}
	
}
