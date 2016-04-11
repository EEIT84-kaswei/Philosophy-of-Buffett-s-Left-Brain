package _01_register.model.dao;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import _01_register.model.accountRoleBean;
import _01_register.model.accountRoleDAO;
import misc.HibernateUtil;

public class accountRoleDAOHibernate implements accountRoleDAO {
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction trx = session.beginTransaction();
			accountRoleDAO dao = new accountRoleDAOHibernate(session);
			//查詢測試
			accountRoleBean beanss=dao.select("root");
			System.out.println(beanss);
			
	//		List<accountRoleBean> beanss=dao.select();
	//		for(accountRoleBean pbeans:beanss){
	//		System.out.println(pbeans);
	//		}
			
			//新增測試
	//		accountRoleBean bean=new accountRoleBean();
	//		bean.setaccount("shiuWei");
	//		bean.setaccount_Role("I\'m God");
	//		accountRoleBean beans=dao.insert(bean);
	//		accountRoleBean beanss=dao.select("shiuWei");
	//		System.out.println(beanss);
			
			//修改測試
	//		boolean bean=dao.update("shiuWei", "SuperGod");
	//		System.out.println(bean);
	//		List<accountRoleBean> beanss=dao.select();
	//		for(accountRoleBean pbeans:beanss){
	//		System.out.println(pbeans);
	//		}
			//刪除測試
	//		boolean bean=dao.delete("shiuWei");
	//		System.out.println(bean);
		

			trx.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	
	}
	private Session session = null;
	public accountRoleDAOHibernate(Session session) {
		this.session = session;
	}

	@Override
	public Session getSession() {
		return session;
	}
	

	@Override
	public accountRoleBean select(String account) {
		return (accountRoleBean)
				this.getSession().get(accountRoleBean.class, account);
	}
	

	@Override
	public List<accountRoleBean> select() {
		Query query =
				this.getSession().createQuery("from accountRoleBean");
		return (List<accountRoleBean>) query.list();
	}
	

	@Override
	public accountRoleBean insert(accountRoleBean bean) {
		accountRoleBean result = (accountRoleBean)
				this.getSession().get(accountRoleBean.class, bean.getaccount());
		if(result==null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	

	@Override
	public boolean update(String account,
			String account_Role) {
		accountRoleBean result = (accountRoleBean)
				this.getSession().get(accountRoleBean.class, account);
		if(result!=null) {
			result.setaccount_Role(account_Role);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String account) {
		accountRoleBean bean = (accountRoleBean) this.getSession().get(accountRoleBean.class, account);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
