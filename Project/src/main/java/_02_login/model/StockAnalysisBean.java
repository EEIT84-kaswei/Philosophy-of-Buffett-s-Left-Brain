package _02_login.model;

public class StockAnalysisBean {
	private Integer stock_Code;
	private String stock_Name;
	private boolean index1;
	private boolean index2;
	private boolean index3;
	private boolean index4;
	private boolean index5;
	
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
	public boolean isIndex1() {
		return index1;
	}
	public void setIndex1(boolean index1) {
		this.index1 = index1;
	}
	public boolean isIndex2() {
		return index2;
	}
	public void setIndex2(boolean index2) {
		this.index2 = index2;
	}
	public boolean isIndex3() {
		return index3;
	}
	public void setIndex3(boolean index3) {
		this.index3 = index3;
	}
	public boolean isIndex4() {
		return index4;
	}
	public void setIndex4(boolean index4) {
		this.index4 = index4;
	}
	public boolean isIndex5() {
		return index5;
	}
	public void setIndex5(boolean index5) {
		this.index5 = index5;
	}
	
}
