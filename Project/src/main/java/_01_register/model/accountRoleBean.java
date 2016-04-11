package _01_register.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

public class accountRoleBean {

	private String account;
	private String account_Role;
	
	
	public accountRoleBean(){
		
	}


	@Override
	public String toString() {
		return "MemberPermissionsBean [account=" + account + ", account_Role=" + account_Role + "]";
	}


	public String getaccount() {
		return account;
	}


	public void setaccount(String account) {
		this.account = account;
	}


	public String getaccount_Role() {
		return account_Role;
	}


	public void setaccount_Role(String account_Role) {
		this.account_Role = account_Role;
	}
	
	
	
}
