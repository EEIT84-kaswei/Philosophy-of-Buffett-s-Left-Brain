package _01_register.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import org.hibernate.Session;

public interface accountRoleDAO {

	Session getSession();

	accountRoleBean select(String account);

	List<accountRoleBean> select();

	accountRoleBean insert(accountRoleBean bean);

	boolean update(String account, String account_Role);

	boolean delete(String account);

}