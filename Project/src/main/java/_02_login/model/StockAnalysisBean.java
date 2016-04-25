package _02_login.model;

public class StockAnalysisBean {
	private Integer stock_Code;
	private String stock_Name;
	private String index1;
	private String index2;
	private String index3;
	private String index4;
	private String index5;
	
	
	@Override
	public String toString() {
		return "StockAnalysisBean [stock_Code=" + stock_Code + ", stock_Name="
				+ stock_Name + ", index1=" + index1 + ", index2=" + index2
				+ ", index3=" + index3 + ", index4=" + index4 + ", index5="
				+ index5 + "]";
	}
	public Integer getStock_Code() {
		return stock_Code;
	}
	public void setStock_Code(Integer stock_Code) {
		this.stock_Code = stock_Code;
	}
	public String getStock_Name() {
		return stock_Name;
	}
	public void setStock_Name(String stock_Name) {
		this.stock_Name = stock_Name;
	}
	public String getIndex1() {
		return index1;
	}
	public void setIndex1(String index1) {
		this.index1 = index1;
	}
	public String getIndex2() {
		return index2;
	}
	public void setIndex2(String index2) {
		this.index2 = index2;
	}
	public String getIndex3() {
		return index3;
	}
	public void setIndex3(String index3) {
		this.index3 = index3;
	}
	public String getIndex4() {
		return index4;
	}
	public void setIndex4(String index4) {
		this.index4 = index4;
	}
	public String getIndex5() {
		return index5;
	}
	public void setIndex5(String index5) {
		this.index5 = index5;
	}

	
	
	
}
