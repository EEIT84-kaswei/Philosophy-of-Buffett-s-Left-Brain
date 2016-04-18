package _01_register.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import org.hibernate.Session;

public interface AccountRoleDAO {

	AccountRoleBean select(String account);

	List<AccountRoleBean> select();

	AccountRoleBean insert(AccountRoleBean bean);

	AccountRoleBean update(String account, String account_Role);

	boolean delete(String account);

}