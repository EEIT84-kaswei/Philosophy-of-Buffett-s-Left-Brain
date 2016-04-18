package _01_register.model.dao;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.model.AccountRoleBean;
import _01_register.model.AccountRoleDAO;
import misc.HibernateUtil;

public class AccountRoleDAOHibernate implements AccountRoleDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public AccountRoleBean select(String account) {
		return (AccountRoleBean) this.getSession().get(AccountRoleBean.class, account);
	}
	

	@Override
	public List<AccountRoleBean> select() {
		Query query = this.getSession().createQuery("from AccountRoleBean");
		return (List<AccountRoleBean>) query.list();
	}
	

	@Override
	public AccountRoleBean insert(AccountRoleBean bean) {
		AccountRoleBean result = (AccountRoleBean)
				this.getSession().get(AccountRoleBean.class, bean.getaccount());
		if(result==null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	

	@Override
	public AccountRoleBean update(String account,
			String account_Role) {
		AccountRoleBean result = (AccountRoleBean)
				this.getSession().get(AccountRoleBean.class, account);
		if(result!=null) {
			result.setaccount_Role(account_Role);
			return result;
		}
		return result;
	}

	@Override
	public boolean delete(String account) {
		AccountRoleBean bean = (AccountRoleBean) this.getSession().get(AccountRoleBean.class, account);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
