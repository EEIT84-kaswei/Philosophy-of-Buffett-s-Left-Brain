package _02_login.model;

import java.util.ArrayList;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.SessionFactory;

import _02_login.model.dao.StockAnalysisDAOHibernate;

public class StockAnalysisService {
	public static void main(String[] args ){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		StockAnalysisService service = new StockAnalysisService();
		StockAnalysisDAOHibernate dao = new StockAnalysisDAOHibernate();
		dao.setSessionFactory(sessionFactory);
		service.setDao(dao);
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			StockAnalysisBean bean = new StockAnalysisBean();
			bean.setStock_Code(2330);
			bean.setStock_Name("測試");
			bean.setIndex1("null");
			bean.setIndex2("null");
			bean.setIndex3("null");
			bean.setIndex4("null");
			bean.setIndex5("null");
			dao.insert(bean);
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (Exception e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		HibernateUtil.closeSessionFactory();
		
	}
	
	
	private StockAnalysisDAOHibernate dao;

	public void setDao(StockAnalysisDAOHibernate dao) {
		this.dao = dao;
	}
	
	public StockAnalysisBean insert(StockAnalysisBean bean){
		dao.insert(bean);
		return bean;
	}
	public List<StockAnalysisBean> select(){
		
		List<StockAnalysisBean> beans = new ArrayList<StockAnalysisBean>();
		beans = dao.select();
		return beans;
	}
	
	
}
