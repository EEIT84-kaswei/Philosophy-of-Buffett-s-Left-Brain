package _04_stock.model;

import org.hibernate.SessionFactory;

import _04_stock.model.dao.ConceptStockDAOHibernate;
import misc.HibernateUtil;

public class ConceptStockService {

	private ConceptStockDAO conceptStockDAO;
	public void setConceptStockDAO(ConceptStockDAO conceptStockDAO){
		this.conceptStockDAO = conceptStockDAO;
	}
	
	public String getConceptName(String concept_Stock){

		if(concept_Stock==null||concept_Stock.trim().length()==0){
			return null;
		}else{
			ConceptStockBean bean = conceptStockDAO.select(concept_Stock);
			return bean.getCs_Name();
		}
			
	}
	
	public static void main(String[] args){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		ConceptStockDAOHibernate daoHibernate = new ConceptStockDAOHibernate(sessionFactory);
		ConceptStockService service = new ConceptStockService();
		service.setConceptStockDAO(daoHibernate);
		
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			String name = service.getConceptName("c1");
			System.out.println(name);
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (Exception e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}
		
		
		
		
	}
	
}
