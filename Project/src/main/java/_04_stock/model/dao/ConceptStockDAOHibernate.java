package _04_stock.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _04_stock.model.ConceptStockBean;
import _04_stock.model.ConceptStockDAO;
import misc.HibernateUtil;

public class ConceptStockDAOHibernate implements ConceptStockDAO {
	private SessionFactory sessionFactory;

	public ConceptStockDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			ConceptStockDAOHibernate dao = new ConceptStockDAOHibernate(sessionFactory);
//			List<ConceptStockBean> bean = dao.select();
			ConceptStockBean bean = dao.select("c2");
//			List<ConceptStockBean> bean = dao.selectByName("福");
//			ConceptStockBean result = new ConceptStockBean();
//			result.setCs_Code("c1");
//			result.setCs_Name("abcdefg");
//			ConceptStockBean bean = dao.insert(result);
//			boolean bean = dao.delete("c11");
			
			System.out.println(bean);
			session.getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}		
	}
	
	@Override
	public List<ConceptStockBean> select(){
		Query query = getSession().createQuery("from ConceptStockBean");
		return (List<ConceptStockBean>) query.list();
	}

	@Override
	public ConceptStockBean select(String cs_Code){
		return (ConceptStockBean) getSession().get(ConceptStockBean.class, cs_Code);
		
	}

	@Override
	public List<ConceptStockBean> selectByName(String name){
		Query query = getSession().createQuery("from ConceptStockBean where cs_Name like '%"+ name + "%' ");
		return (List<ConceptStockBean>) query.list();
	}

	@Override
	public ConceptStockBean insert(ConceptStockBean bean){
		if(select(bean.getCs_Code())==null){
			getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public ConceptStockBean update(ConceptStockBean bean){
		if(select(bean.getCs_Code())!=null){
			ConceptStockBean result = select(bean.getCs_Code());
			result.setCs_Code(bean.getCs_Code());
			result.setCs_Name(bean.getCs_Name());
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(String cs_Code){
		if(select(cs_Code)!=null){
			getSession().delete(select(cs_Code));
			return true;
		}
		return false;
	}
}
