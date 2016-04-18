package _02_login.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _02_login.model.CustFavoriteBean;
import _02_login.model.CustFavoriteDAO;
import misc.HibernateUtil;

public class CustFavoriteDAOHibernate implements CustFavoriteDAO {
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
			session.beginTransaction();
			CustFavoriteDAOHibernate dao = new CustFavoriteDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
//			List<CustFavoriteBean> bean = dao.select();
//			List<CustFavoriteBean> bean = dao.selectByAccount("lara");
//			List<CustFavoriteBean> bean = dao.selectByStock(4108);
//			CustFavoriteBean bean = dao.selectByAccountAndStock("lara", 2890);
//			CustFavoriteBean result = new CustFavoriteBean();
//			result.setAccount("lara");
//			result.setStock_Code(8888);
//			CustFavoriteBean bean = dao.insert(result);
//			CustFavoriteBean bean = dao.update("lara", 2890, 1234);
			boolean bean = dao.delete("lara", 4108);
			System.out.println(bean);
			session.getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}

	@Override
	public List<CustFavoriteBean> select(){
		Query query = getSession().createQuery("from CustFavoriteBean");
		return (List<CustFavoriteBean>) query.list();
	}

	@Override

	public List<CustFavoriteBean> selectByAccount(String account){
		Query query = getSession().createQuery("from CustFavoriteBean where account = ?");
		query.setParameter(0, account);
		return (List<CustFavoriteBean>) query.list();
	}

	@Override
	public List<CustFavoriteBean> selectByStock(Integer stock_Code){
		Query query = getSession().createQuery("from CustFavoriteBean where stock_Code = ? ");
		query.setParameter(0, stock_Code);
		return (List<CustFavoriteBean>) query.list();
	}
	
	@Override

	public CustFavoriteBean selectByAccountAndStock(String account, Integer stock_Code){
		CustFavoriteBean bean = new CustFavoriteBean();
		bean.setAccount(account);
		bean.setStock_Code(stock_Code);
		return this.getSession().get(CustFavoriteBean.class, bean);
	}

	@Override
	public CustFavoriteBean insert(CustFavoriteBean bean){
			getSession().saveOrUpdate(bean);
			return bean;
	}

	
	@Override
	public CustFavoriteBean update(String account, Integer stock_Code, Integer new_stock_Code){
		if(selectByAccountAndStock(account, stock_Code) != null && selectByAccountAndStock(account, new_stock_Code) == null){
			Query query = 
					getSession().createQuery("update CustFavoriteBean set stock_Code = ? where account = ? and stock_Code = ?");
			query.setParameter(0, new_stock_Code);
			query.setParameter(1, account);
			query.setParameter(2, stock_Code);
			int updateCount = query.executeUpdate();
			System.out.println("更新筆數 = " + updateCount);
			return selectByAccountAndStock(account, new_stock_Code);
		}
		return null;
	}

	@Override

	public boolean delete(String account, Integer stock_Code){

		CustFavoriteBean bean = new CustFavoriteBean();
		bean.setAccount(account);
		bean.setStock_Code(stock_Code);
		CustFavoriteBean temp = this.getSession().get(CustFavoriteBean.class, bean);
		if(temp!=null){
			this.getSession().delete(temp);
			return true;
		}
		return false;
		
		//		if(selectByAccountAndStock(account, stock_Code) != null){
//			Query query = getSession().createQuery("delete from CustFavoriteBean where id = ? and stock_Code = ?");
//			query.setParameter(0, account);
//			query.setParameter(1, stock_Code);
//			int i = query.executeUpdate();
//			System.out.println("刪除比數 = " + i);
//			
////			SQLQuery query = getSession().createSQLQuery("delete from custFavorite where id = ? and stock_Code = ?");
////			query.setParameter(0, id);
////			query.setParameter(1, stock_Code);
////			int i = query.executeUpdate();
////			System.out.println("刪除比數 = " + i);
//			return true;
//		}
//		return false;
	}
}
