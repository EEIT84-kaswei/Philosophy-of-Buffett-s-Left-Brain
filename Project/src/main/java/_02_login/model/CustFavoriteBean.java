package _02_login.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

public class CustFavoriteBean {
	private Integer id;
	private Integer stock_Code;
	
	@Override
	public String toString() {
		return "CustFavoriteBean [id=" + id + ", stock_Code=" + stock_Code
				+ "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	
}
