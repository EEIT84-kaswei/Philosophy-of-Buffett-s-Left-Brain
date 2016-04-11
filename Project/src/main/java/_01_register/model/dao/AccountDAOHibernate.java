package _01_register.model.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import _01_register.model.AccountBean;
import misc.HibernateUtil;


public class AccountDAOHibernate {
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction trx = session.beginTransaction();
			AccountDAOHibernate dao = new AccountDAOHibernate(session);
//			AccountBean bean = dao.selectByPrimaryKey(1);
//			System.out.println(bean);
			AccountBean bean1 = dao.selectByAccount("root");		
			System.out.println(bean1);
			AccountBean bean2 = dao.selectByAccountEmail("lara", "3a5h95h@gmail.com");
			System.out.println(bean2);
//			
//			AccountBean temp = new AccountBean();
//			temp.setAccount("3a5h95h");
//			temp.setPassw("a1234564");
//			temp.setName("劉育依");
//			temp.setIdc("H231876954");
//			temp.setEmail("3a5h95h@gmail.com");
//			temp.setArea_phone("03");
//			temp.setPhone("85432456");
//			temp.setAddress("桃園市");
//			AccountBean bean3 = dao.insert(temp);
//			System.out.println(bean3);
			

			
			trx.commit();
		} finally{
			HibernateUtil.closeSessionFactory();
		}
		
		
		
	}
	
	private Session session = null;
	public AccountDAOHibernate(Session session){
		this.session = session;
	}
	public Session getSession(){
		return session;
	}
	
	public AccountBean selectByPrimaryKey(Integer id){
		return (AccountBean) this.getSession().get(AccountBean.class, id);
	}
	
	
	public AccountBean selectByAccount(String account){
		Query query = this.getSession().createQuery("from AccountBean where account=?");
		query.setParameter(0, account);
		return (AccountBean)query.uniqueResult();
	}
	
	public AccountBean selectByAccountEmail(String account , String email){
		Query query = this.getSession().createQuery("from AccountBean where account = ? and email = ?");
		query.setParameter(0, account);
		query.setParameter(1, email);
		return (AccountBean)query.uniqueResult();
	}
	
	
	public List<AccountBean> setectAll(){
		Query query = this.getSession().createQuery("from AccountBean");
		return (List<AccountBean>) query.list();
	}
	
	public AccountBean insert(AccountBean bean){
		this.getSession().saveOrUpdate(bean);;
		return bean;
	}
	
	public AccountBean update(AccountBean bean){
		this.getSession().saveOrUpdate(bean);;
		return bean;
	}
	
	public boolean delete(Integer id){
		AccountBean bean = (AccountBean)this.getSession().get(AccountBean.class, id);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
