package _01_register.model;
/* 陳昱華 Joyce Chen 06-04-2016 */
/* 這適合做為管理員操作會員資料的DAO */

import org.hibernate.Hibernate;
import org.hibernate.Session;

import misc.HibernateUtil;

public class Member_DAO implements Member_Interface{

	/* (non-Javadoc)
	 * @see _01_register.model.Member_Interface#insert(_01_register.model.Member_Bean)
	 */
	
	@Override
	public void insert(Member_Bean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(bean);
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}


	/* (non-Javadoc)
	 * @see _01_register.model.Member_Interface#delete(int)
	 */

	@Override
	public void delete(int id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Member_Bean bean = session.get(Member_Bean.class, id);
			if (bean != null) {
				session.delete(bean);
			}
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}


	/* (non-Javadoc)
	 * @see _01_register.model.Member_Interface#update(_01_register.model.Member_Bean)
	 */

	@Override
	public void update(Member_Bean bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.update(bean);
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

}
