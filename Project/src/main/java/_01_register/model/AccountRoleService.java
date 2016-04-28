package _01_register.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _01_register.model.dao.AccountRoleDAOHibernate;
import misc.HibernateUtil;

public class AccountRoleService {
	private AccountRoleDAO accountRoleDAO;
	public void setaccountRoleDAO(AccountRoleDAO accountRoleDAO) {
		this.accountRoleDAO = accountRoleDAO;
	}

	public List<AccountRoleBean> selectAll() {
		return accountRoleDAO.select();
	}
	
	public AccountRoleBean selectByAccount(String account){
		return accountRoleDAO.select(account);
	}
	
	public AccountRoleBean insert(AccountRoleBean bean) {
		AccountRoleBean result = null;
		if(bean!=null) {
			result = accountRoleDAO.insert(bean);
		}
		return result;
	}
	public AccountRoleBean update(AccountRoleBean bean) {
		AccountRoleBean result = null;
		if(bean!=null) {
			result = accountRoleDAO.update(bean.getaccount(), bean.getaccount_Role());
		}
		return result;
	}
	public boolean delete(AccountRoleBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = accountRoleDAO.delete(bean.getaccount());
		}
		return result;
	}
	public AccountRoleBean suspend(AccountRoleBean bean){
		AccountRoleBean result = null;
		if(bean!=null) {
			result = accountRoleDAO.update(bean.getaccount(), "suspended");
		}
		return result;
	}

}
