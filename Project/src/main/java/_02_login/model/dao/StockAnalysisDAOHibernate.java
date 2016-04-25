package _02_login.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _02_login.model.StockAnalysisBean;

public class StockAnalysisDAOHibernate {
	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public StockAnalysisBean insert (StockAnalysisBean bean){
		 getSession().saveOrUpdate(bean);
		 return bean;
	}
	public List<StockAnalysisBean> select (){
		List<StockAnalysisBean> beans = new ArrayList<StockAnalysisBean>();
		Query query = getSession().createQuery("from StockAnalysisBean");		
		return (List<StockAnalysisBean>)query.list(); 
	}
	
	
}
