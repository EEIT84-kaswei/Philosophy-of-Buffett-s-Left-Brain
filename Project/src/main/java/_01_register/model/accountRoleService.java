package _01_register.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _01_register.model.dao.accountRoleDAOHibernate;
import misc.HibernateUtil;

public class accountRoleService {
	private accountRoleDAO accountRoleDAO;
	public void setaccountRoleDAO(accountRoleDAO accountRoleDAO) {
		this.accountRoleDAO = accountRoleDAO;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction transaction = session.beginTransaction();

			accountRoleService service = new accountRoleService();
			service.setaccountRoleDAO(new accountRoleDAOHibernate(session));
			List<accountRoleBean> beans = service.select(null);
			System.out.println("beans="+beans);
			
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	public List<accountRoleBean> select(accountRoleBean bean) {
		List<accountRoleBean> result = null;
		if(bean!=null && bean.getaccount().trim().length()!=0) {
			accountRoleBean temp = accountRoleDAO.select(bean.getaccount());
			if(temp!=null) {
				result = new ArrayList<accountRoleBean>();
				result.add(temp);
			}
		} else {
			result = accountRoleDAO.select(); 
		}
		return result;
	}
	public accountRoleBean insert(accountRoleBean bean) {
		accountRoleBean result = null;
		if(bean!=null) {
			result = accountRoleDAO.insert(bean);
		}
		return result;
	}
	public boolean update(accountRoleBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = accountRoleDAO.update(bean.getaccount(), bean.getaccount_Role());
		}
		return result;
	}
	public boolean delete(accountRoleBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = accountRoleDAO.delete(bean.getaccount());
		}
		return result;
	}

}
