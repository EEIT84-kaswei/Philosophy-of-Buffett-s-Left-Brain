package _01_register.model;

import java.util.List;

import _01_register.model.AccountBean;

public interface AccountDAO {

	public abstract AccountBean selectById(Integer id);

	public abstract AccountBean selectByAccount(String account);

	public abstract AccountBean selectByAccountEmail(String account, String email);
	
	public abstract AccountBean selectByEmail(String email);

	public abstract List<AccountBean> setectAll();

	public abstract AccountBean insert(AccountBean bean);

	public abstract AccountBean update(AccountBean bean);

	public abstract boolean delete(Integer id);

}