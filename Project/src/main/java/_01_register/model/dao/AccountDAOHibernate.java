package _01_register.model.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.model.AccountBean;
import _01_register.model.AccountDAO;
import misc.HibernateUtil;


public class AccountDAOHibernate implements AccountDAO {
		
	private SessionFactory sessionFactory = null;

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
			AccountDAOHibernate dao = new AccountDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
//			AccountBean bean = dao.selectByEmail("f90432@yahoo.com.tw");
			String bean = dao.selectEmailByAccount("kitty");
			System.out.println(bean);
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	@Override
	public AccountBean selectById(Integer id){
		return (AccountBean) this.getSession().get(AccountBean.class, id);
	}

	@Override
	public AccountBean selectByAccount(String account){
		Query query = this.getSession().createQuery("from AccountBean where account = ?");
		query.setParameter(0, account);
		return (AccountBean)query.uniqueResult();
	}

	@Override
	public String selectEmailByAccount(String account){
		Query query = this.getSession().createQuery("select email from AccountBean where account = ?");
		query.setParameter(0, account);
		return (String) query.uniqueResult();
	}

	@Override
	public String selectPasswByAccount(String account){
		Query query = this.getSession().createQuery("select passw from AccountBean where account = ?");
		query.setParameter(0, account);
		return (String) query.uniqueResult();
	}

	@Override
	public AccountBean selectByAccountEmail(String account , String email){
		Query query = this.getSession().createQuery("from AccountBean where account = ? and email = ?");
		query.setParameter(0, account);
		query.setParameter(1, email);
		return (AccountBean)query.uniqueResult();
	}

	@Override
	public AccountBean selectByEmail(String email){
		Query query = this.getSession().createQuery("from AccountBean where email = ?");
		query.setParameter(0, email);
		return (AccountBean)query.uniqueResult();
	}

	@Override
	public List<AccountBean> setectAll(){
		Query query = this.getSession().createQuery("from AccountBean");
		return (List<AccountBean>) query.list();
	}

	@Override
	public AccountBean insert(AccountBean bean){
		this.getSession().saveOrUpdate(bean);;
		return bean;
	}

	@Override
	public AccountBean update(AccountBean bean){
		this.getSession().saveOrUpdate(bean);;
		return bean;
	}

	@Override
	public boolean delete(Integer id){
		AccountBean bean = (AccountBean)this.getSession().get(AccountBean.class, id);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
