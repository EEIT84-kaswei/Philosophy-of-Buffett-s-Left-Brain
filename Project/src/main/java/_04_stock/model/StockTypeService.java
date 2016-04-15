package _04_stock.model;

import java.util.ArrayList;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _02_login.model.CustFavoriteDAO;
import _04_stock.model.dao.StockTypeDAOHibernate;

public class StockTypeService {
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private StockTypeDAO stockTypeDAO;	
	
	public void setStockTypeDAO(StockTypeDAO stockTypeDAO) {
		this.stockTypeDAO = stockTypeDAO;
	}
	
	
	public static void main (String[]args){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		StockTypeDAOHibernate dao = new StockTypeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		StockTypeService service = new StockTypeService();
		service.setStockTypeDAO(dao);
		
		String s1 = "s1";
		String name = "上櫃股";
		try {
			dao.getSession().beginTransaction();
//			List<StockTypeBean> select = service.select();
//			StockTypeBean select = service.selectByCode(s1);
			StockTypeBean select = service.selectByName(name);
			dao.getSession().getTransaction().commit();
			System.out.println(select);
		} catch (Exception e) {
			dao.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
		
		HibernateUtil.closeSessionFactory();
		
	}
	
	
	
	
	
	
	public List<StockTypeBean> select(){
		List<StockTypeBean> result = new ArrayList<StockTypeBean>();
		result = stockTypeDAO.select();
		return result;
		
	}
	public StockTypeBean selectByCode(String stock_TypeCode){
		StockTypeBean result = null;
		if(stock_TypeCode!=null){
			result = stockTypeDAO.selectByCode(stock_TypeCode);
		}
		return result;
		
	}
	public StockTypeBean selectByName(String stock_TypeName){
		StockTypeBean result = null;
		if(stock_TypeName!=null){
			result = stockTypeDAO.selectByName(stock_TypeName);
		}
		return result;
		
	}
}
