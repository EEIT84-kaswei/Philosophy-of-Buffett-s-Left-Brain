package _04_stock.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

public class StockTypeBean {
	private String  stock_TypeCode;
	private String  stock_TypeName;
	
	@Override
	public String toString() {
		return "StockTypeBean [stock_TypeCode=" + stock_TypeCode
				+ ", stock_TypeName=" + stock_TypeName + "]";
	}
	public String getStock_TypeCode() {
		return stock_TypeCode;
	}
	public void setStock_TypeCode(String stock_TypeCode) {
		this.stock_TypeCode = stock_TypeCode;
	}
	public String getStock_TypeName() {
		return stock_TypeName;
	}
	public void setStock_TypeName(String stock_TypeName) {
		this.stock_TypeName = stock_TypeName;
	}
	
}
