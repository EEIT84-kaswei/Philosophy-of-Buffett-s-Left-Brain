package _04_stock.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

public class ConceptStockBean {
	private String cs_Code;
	private String cs_Name;
	
	@Override
	public String toString() {
		return "ConceptStockBean [cs_Code=" + cs_Code + ", cs_Name=" + cs_Name
				+ "]";
	}
	
	public String getCs_Code() {
		return cs_Code;
	}
	public void setCs_Code(String cs_Code) {
		this.cs_Code = cs_Code;
	}
	public String getCs_Name() {
		return cs_Name;
	}
	public void setCs_Name(String cs_Name) {
		this.cs_Name = cs_Name;
	}
	
}
