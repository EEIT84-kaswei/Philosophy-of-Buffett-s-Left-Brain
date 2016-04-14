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
			List<CustFavoriteBean> bean = dao.select();
//			List<CustFavoriteBean> bean = dao.selectById(7);
//			List<CustFavoriteBean> bean = dao.selectByStock(4108);
//			CustFavoriteBean bean = dao.selectByIdAndStock(3, 2890);
//			CustFavoriteBean result = new CustFavoriteBean();
//			result.setId(3);
//			result.setStock_Code(4108);
//			CustFavoriteBean bean = dao.insert(result);
//			CustFavoriteBean bean = dao.update(3, 2890, 1234);
//			boolean bean = dao.delete(10, 4108);
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
	public List<CustFavoriteBean> selectById(Integer id){
		Query query = getSession().createQuery("from CustFavoriteBean where account = ?");
		query.setParameter(0, id);
		return (List<CustFavoriteBean>) query.list();
	}

	@Override
	public List<CustFavoriteBean> selectByStock(Integer stock_Code){
		Query query = getSession().createQuery("from CustFavoriteBean where stock_Code = ? ");
		query.setParameter(0, stock_Code);
		return (List<CustFavoriteBean>) query.list();
	}
	
	@Override
	public CustFavoriteBean selectByIdAndStock(Integer id, Integer stock_Code){
		if(id!=null && stock_Code!=null){
			Query query = getSession().createQuery("from CustFavoriteBean where account = ? and stock_Code = ?");
			query.setParameter(0, id);
			query.setParameter(1, stock_Code);
			return (CustFavoriteBean) query.uniqueResult();
		}
		return null;
	}

	@Override
	public CustFavoriteBean insert(CustFavoriteBean bean){
		if(selectByIdAndStock(bean.getId(), bean.getStock_Code()) == null){
			getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	@Override
	public CustFavoriteBean update(Integer id, Integer stock_Code, Integer new_stock_Code){
		if(selectByIdAndStock(id, stock_Code) != null && selectByIdAndStock(id, new_stock_Code) == null){
			Query query = 
					getSession().createQuery("update CustFavoriteBean set stock_Code = ? where account = ? and stock_Code = ?");
			query.setParameter(0, new_stock_Code);
			query.setParameter(1, id);
			query.setParameter(2, stock_Code);
			int updateCount = query.executeUpdate();
			System.out.println("更新筆數 = " + updateCount);
			return selectByIdAndStock(id, new_stock_Code);
		}
		return null;
	}

	@Override
	public boolean delete(Integer id, Integer stock_Code){
		if(selectByIdAndStock(id, stock_Code) != null){
			Query query = getSession().createQuery("delete from CustFavoriteBean where account = ? and stock_Code = ?");
			query.setParameter(0, id);
			query.setParameter(1, stock_Code);
			int i = query.executeUpdate();
			System.out.println("刪除比數 = " + i);
			
//			SQLQuery query = getSession().createSQLQuery("delete from custFavorite where id = ? and stock_Code = ?");
//			query.setParameter(0, id);
//			query.setParameter(1, stock_Code);
//			int i = query.executeUpdate();
//			System.out.println("刪除比數 = " + i);
			return true;
		}
		return false;
	}
}
