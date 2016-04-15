package _02_login.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

public class CustFavoriteBean {
	private String account;
	private Integer stock_Code;
	
	@Override
	public String toString() {
		return "[ " + account + " , " + stock_Code	+ " ]";
	}

	
	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	
}
